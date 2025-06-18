// Variabili globali
let sales = [];
let salesFiltered = [];
let currentPage = 1;
const cardsPerPage = 21;

// Caricamento dati dal JSON
async function fetchData(url, errorMessage) {
  try {
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    return await response.json();
  } catch (error) {
    console.error(`${errorMessage}: ${error}`);
    return null;
  }
}

async function fetchSales() {
  const data = await fetchData(
    "./Json/sales_dataset.json",
    "Couldn't get sales data"
  );
  if (data) {
    sales = data;
    salesFiltered = [...sales];
  }
  return data;
}

async function fetchCategories() {
  const categories = await fetchData(
    "./Json/categories.json",
    "Couldn't get categories"
  );
  if (categories) {
    populateSelect("categories-select", categories, "All Categories");
  }
}

async function fetchCities() {
  const cities = await fetchData("./Json/cities.json", "Couldn't get cities");
  if (cities) {
    populateSelect("cities-select", cities, "All Cities");
  }
}

// Funzione per popolare i select
function populateSelect(selectId, options, defaultText) {
  const select = document.getElementById(selectId);
  if (!select) return;

  // Opzione "All"
  const defaultOption = document.createElement("option");
  defaultOption.value = "All";
  defaultOption.textContent = defaultText;
  select.appendChild(defaultOption);

  // Aggiungi le opzioni
  options.forEach((option) => {
    const optionElement = document.createElement("option");
    optionElement.value = option;
    optionElement.textContent = option;
    select.appendChild(optionElement);
  });
}

// Creazione card
function createCard(sale) {
  const div = document.createElement("div");
  div.className = "sale-card";

  div.innerHTML = `
    <img src="${sale.immagine_principale}" alt="" class="sale-image" />
    <p class="sale-title">${sale.titolo}</p>
    <p class="sale-price">${sale.prezzo}</p>
    <p class="sale-city">${sale.citta}</p>
    <p class="sale-publish-date">${sale.data_pubblicazione}</p>
  `;

  return div;
}

// Visualizzazione delle vendite
function displaySales() {
  const container = document.getElementById("sales-container");
  if (!container) {
    console.error("Sales container not found!");
    return;
  }

  container.innerHTML = "";

  const startIndex = (currentPage - 1) * cardsPerPage;
  const endIndex = startIndex + cardsPerPage;
  const salesPage = salesFiltered.slice(startIndex, endIndex);

  salesPage.forEach((sale, index) => {
    const cardElement = createCard(sale, startIndex + index);
    container.appendChild(cardElement);
  });

  updatePaginationControls();
}

// Controlli paginazione
function updatePaginationControls() {
  const totalPages = Math.ceil(salesFiltered.length / cardsPerPage);
  const paginationContainer = document.getElementById("pagination-container");

  if (!paginationContainer) {
    console.error("Pagination container not found!");
    return;
  }

  paginationContainer.innerHTML = "";

  if (totalPages <= 1) {
    paginationContainer.style.display = "none";
    return;
  }

  paginationContainer.style.display = "flex";

  // Bottone Previous
  const prevButton = createButton("Previous", currentPage === 1, () => {
    if (currentPage > 1) {
      currentPage--;
      displaySales();
    }
  });

  // Info pagina
  const pageInfo = document.createElement("span");
  pageInfo.textContent = `Page ${currentPage} of ${totalPages}`;

  // Bottone Next
  const nextButton = createButton("Next", currentPage === totalPages, () => {
    if (currentPage < totalPages) {
      currentPage++;
      displaySales();
    }
  });

  paginationContainer.appendChild(prevButton);
  paginationContainer.appendChild(pageInfo);
  paginationContainer.appendChild(nextButton);
}

// Funzione helper per creare bottoni
function createButton(text, disabled, clickHandler) {
  const button = document.createElement("button");
  button.textContent = text;
  button.disabled = disabled;
  button.addEventListener("click", clickHandler);
  return button;
}

// Filtri
function filterSales() {
  const searchInput = document
    .getElementById("search-input")
    .value.toLowerCase();
  const categorySelect = document.getElementById("categories-select").value;
  const citySelect = document.getElementById("cities-select").value;
  const sortSelect = document.getElementById("sort-select").value;

  // Filtra i dati
  salesFiltered = sales.filter((sale) => {
    const matchesSearch = sale.titolo.toLowerCase().includes(searchInput);
    const matchesCategory =
      categorySelect === "All" || sale.categoria === categorySelect;
    const matchesCity = citySelect === "All" || sale.citta === citySelect;

    return matchesSearch && matchesCategory && matchesCity;
  });

  // Ordina i risultati
  sortSales(sortSelect);

  currentPage = 1;
  displaySales();
}

// Ordinamento
function sortSales(sortType) {
  switch (sortType) {
    case "price-asc":
      salesFiltered.sort((a, b) => parseFloat(a.prezzo) - parseFloat(b.prezzo));
      break;
    case "price-desc":
      salesFiltered.sort((a, b) => parseFloat(b.prezzo) - parseFloat(a.prezzo));
      break;
    case "date-asc":
      salesFiltered.sort(
        (a, b) =>
          new Date(a.data_pubblicazione) - new Date(b.data_pubblicazione)
      );
      break;
    case "date-desc":
      salesFiltered.sort(
        (a, b) =>
          new Date(b.data_pubblicazione) - new Date(a.data_pubblicazione)
      );
      break;
    case "alphabet-asc":
      salesFiltered.sort((a, b) => a.titolo.localeCompare(b.titolo));
      break;
    case "alphabet-desc":
      salesFiltered.sort((a, b) => b.titolo.localeCompare(a.titolo));
      break;
  }
}

// Reset filtri
function resetFilters() {
  document.getElementById("search-input").value = "";
  document.getElementById("categories-select").value = "All";
  document.getElementById("cities-select").value = "All";
  document.getElementById("sort-select").value = "date-desc";

  salesFiltered = [...sales];
  currentPage = 1;
  displaySales();
}

// Creazione bottone reset
function createResetButton() {
  const resetButton = document.createElement("button");
  resetButton.textContent = "Reset Filters";
  resetButton.className = "reset-button";
  resetButton.addEventListener("click", resetFilters);

  return resetButton;
}

// Event listeners
function setupEventListeners() {
  // Ricerca
  const searchButton = document.getElementById("search-button");
  const searchInput = document.getElementById("search-input");

  if (searchButton) {
    searchButton.addEventListener("click", (e) => {
      e.preventDefault();
      filterSales();
    });
  }

  if (searchInput) {
    searchInput.addEventListener("input", filterSales);
  }

  // Filtri
  const categoriesSelect = document.getElementById("categories-select");
  const citiesSelect = document.getElementById("cities-select");
  const sortSelect = document.getElementById("sort-select");

  if (categoriesSelect) {
    categoriesSelect.addEventListener("change", filterSales);
  }

  if (citiesSelect) {
    citiesSelect.addEventListener("change", filterSales);
  }

  if (sortSelect) {
    sortSelect.addEventListener("change", filterSales);
  }

  // Bottone reset
  const sidebar = document.querySelector(".sidebar");
  if (sidebar) {
    const resetButton = createResetButton();
    sidebar.appendChild(resetButton);
  }
}

// Sidebar Toggle - VERSIONE AGGIORNATA CON FIX RESET BUTTON
function initSidebarToggle() {
  const sidebar = document.querySelector(".sidebar");
  const filtersContainer = document.querySelector(".filters-container");
  const filtersTitle = document.querySelector(".filters-title");
  const productsContainer = document.querySelector(".products");
  const salesContainer = document.getElementById("sales-container");
  const paginationContainer = document.getElementById("pagination-container");
  const searchContainer = document.querySelector(".search-container");

  if (!sidebar || !filtersContainer || !filtersTitle) {
    console.error("Sidebar elements not found!");
    return;
  }

  let isCollapsed = true;

  function initializeSidebar() {
    // Inizializza sidebar collassata
    sidebar.classList.remove("expanded");
    filtersContainer.classList.remove("visible");
    if (productsContainer) productsContainer.classList.remove("visible");

    // Aggiorna il titolo
    filtersTitle.innerHTML = `
      <button class="filters-hamburger" aria-label="Open Filters Menu">
        <i class="fa-solid fa-list-ul"></i>
      </button>
    `;

    // Rimuovi classi di espansione dai contenitori
    if (salesContainer) salesContainer.classList.remove("sidebar-expanded");
    if (paginationContainer)
      paginationContainer.classList.remove("sidebar-expanded");
    if (searchContainer) searchContainer.classList.remove("sidebar-expanded");

    // NASCONDI IL RESET BUTTON QUANDO LA SIDEBAR È COLLASSATA
    const resetButton = document.querySelector(".reset-button");
    if (resetButton) resetButton.classList.remove("visible");
  }

  function toggleSidebar() {
    const resetButton = document.querySelector(".reset-button");

    if (isCollapsed) {
      // Espandi
      sidebar.classList.add("expanded");
      filtersTitle.innerHTML = `
        <button class="filters-hamburger" aria-label="Close Filters Menu">
          <i class="fa-solid fa-list-ul"></i>
        </button>
        Filters
      `;

      setTimeout(() => {
        filtersContainer.classList.add("visible");
        if (productsContainer) productsContainer.classList.add("visible");
        // MOSTRA IL RESET BUTTON QUANDO LA SIDEBAR SI ESPANDE
        if (resetButton) resetButton.classList.add("visible");
      }, 150);

      // Aggiungi classi di espansione ai contenitori
      if (salesContainer) salesContainer.classList.add("sidebar-expanded");
      if (paginationContainer)
        paginationContainer.classList.add("sidebar-expanded");
      if (searchContainer) searchContainer.classList.add("sidebar-expanded");

      isCollapsed = false;
    } else {
      // Collassa
      sidebar.classList.remove("expanded");
      filtersContainer.classList.remove("visible");
      if (productsContainer) productsContainer.classList.remove("visible");
      // NASCONDI IL RESET BUTTON QUANDO LA SIDEBAR SI CHIUDE
      if (resetButton) resetButton.classList.remove("visible");

      setTimeout(() => {
        filtersTitle.innerHTML = `
          <button class="filters-hamburger" aria-label="Open Filters Menu">
            <i class="fa-solid fa-list-ul"></i>
          </button>
        `;
      }, 200);

      // Rimuovi classi di espansione dai contenitori
      if (salesContainer) salesContainer.classList.remove("sidebar-expanded");
      if (paginationContainer)
        paginationContainer.classList.remove("sidebar-expanded");
      if (searchContainer) searchContainer.classList.remove("sidebar-expanded");

      isCollapsed = true;
    }
  }

  // Event listener per hamburger
  document.addEventListener("click", function (e) {
    if (e.target.closest(".filters-hamburger")) {
      e.preventDefault();
      toggleSidebar();
    }
  });

  initializeSidebar();
}

// Inizializzazione principale
async function init() {
  await fetchSales();
  await fetchCategories();
  await fetchCities();

  displaySales();
  setupEventListeners();
  initSidebarToggle();
}

// Avvia l'applicazione
document.addEventListener("DOMContentLoaded", init);
