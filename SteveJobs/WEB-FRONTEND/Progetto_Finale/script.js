// Variabili globali
let sales = [];
let salesFiltered = [];
let currentPage = 1;
const cardsPerPage = 21;
let cities = [];
let categories = [];

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
  // Determina il percorso corretto basato sulla pagina corrente
  let basePath = "./Json/sales_dataset.json";
  if (window.location.pathname.includes("/pages/")) {
    basePath = "./../Json/sales_dataset.json";
  }

  const data = await fetchData(basePath, "Couldn't get sales data");
  if (data) {
    sales = data;
    salesFiltered = [...sales];
  }
  return data;
}

async function fetchCategories() {
  // Determina il percorso corretto basato sulla pagina corrente
  let basePath = "./Json/categories.json";
  if (window.location.pathname.includes("/pages/")) {
    basePath = "./../Json/categories.json";
  }

  const categoriesData = await fetchData(basePath, "Couldn't get categories");
  if (categoriesData) {
    categories = categoriesData; // Salva in variabile globale
    populateSelect("categories-select", categoriesData, "All Categories");
    // Popola anche il dropdown della navbar
    populateNavbarDropdown(categoriesData);
  }
}

async function fetchCities() {
  // Determina il percorso corretto basato sulla pagina corrente
  let basePath = "./Json/cities.json";
  if (window.location.pathname.includes("/pages/")) {
    basePath = "./../Json/cities.json";
  }

  const citiesData = await fetchData(basePath, "Couldn't get cities");
  if (citiesData) {
    cities = citiesData; // Salva in variabile globale
    populateSelect("cities-select", citiesData, "All Cities");
  }
}

// Popola il dropdown della navbar
function populateNavbarDropdown(categories) {
  const dropdownMenu = document.getElementById("categories-dropdown-menu");
  if (!dropdownMenu) return;

  // Pulisci il dropdown
  dropdownMenu.innerHTML = "";

  // Aggiungi opzione "All Categories"
  const allCategoriesLink = document.createElement("a");
  allCategoriesLink.href = "#";
  allCategoriesLink.textContent = "All Categories";
  allCategoriesLink.addEventListener("click", (e) => {
    e.preventDefault();
    navigateToCategory("All");
  });
  dropdownMenu.appendChild(allCategoriesLink);

  // Aggiungi le categorie specifiche
  categories.forEach((category) => {
    const categoryLink = document.createElement("a");
    categoryLink.href = "#";
    categoryLink.textContent = category;
    categoryLink.addEventListener("click", (e) => {
      e.preventDefault();
      navigateToCategory(category);
    });
    dropdownMenu.appendChild(categoryLink);
  });
}

// Naviga sempre alla pagina category con parametro
function navigateToCategory(category) {
  // Chiudi il dropdown dopo la selezione
  const dropdownContainer = document.querySelector(".dropdown-container");
  if (dropdownContainer) {
    dropdownContainer.classList.remove("active");
  }

  // Determina l'URL di destinazione basato sulla pagina corrente
  let targetUrl;

  if (window.location.pathname.includes("/pages/")) {
    // Siamo già in una sottopagina, naviga verso category.html
    targetUrl =
      category === "All"
        ? "./category.html"
        : `./category.html?category=${encodeURIComponent(category)}`;
  } else {
    // Siamo nell'index, naviga verso pages/category.html
    targetUrl =
      category === "All"
        ? "./pages/category.html"
        : `./pages/category.html?category=${encodeURIComponent(category)}`;
  }

  window.location.href = targetUrl;
}

// Applica filtro basato sui parametri URL (per category.html)
function applyURLFilters() {
  const urlParams = new URLSearchParams(window.location.search);
  const categoryParam = urlParams.get("category");

  console.log("Applying URL filters, category:", categoryParam);

  if (categoryParam && categoryParam !== "All") {
    // Filtra per la categoria specifica
    salesFiltered = sales.filter((sale) => {
      return (
        sale.categoria &&
        sale.categoria.toLowerCase() === categoryParam.toLowerCase()
      );
    });

    console.log(
      "Filtered sales for category:",
      categoryParam,
      "Count:",
      salesFiltered.length
    );

    // Aggiorna il select della sidebar se esiste
    const categoriesSelect = document.getElementById("categories-select");
    if (categoriesSelect) {
      categoriesSelect.value = categoryParam;
    }

    // Mostra un indicatore della categoria attiva
    showCategoryIndicator(categoryParam);
  } else {
    // Mostra tutte le categorie
    salesFiltered = [...sales];
    showCategoryIndicator("All Categories");
  }

  currentPage = 1;
  displaySales();
}

// Mostra indicatore categoria attiva
function showCategoryIndicator(category) {
  let indicator = document.getElementById("category-indicator");

  indicator.innerHTML =
    category === "All Categories"
      ? `<i class="fa-solid fa-layer-group"></i> Showing All Categories`
      : `<i class="fa-solid fa-filter"></i> Filtered by: ${category}`;
}

// Funzione per popolare i select
function populateSelect(selectId, options, defaultText) {
  const select = document.getElementById(selectId);
  if (!select) return;

  // Pulisci il select
  select.innerHTML = "";

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
function createCard(sale, index) {
  const div = document.createElement("div");
  div.className = "sale-card";
  div.style.cursor = "pointer";

  div.innerHTML = `
    <img src="${sale.immagine_principale}" alt="${sale.titolo}" class="sale-image" />
    <p class="sale-title">${sale.titolo}</p>
    <p class="sale-price">${sale.prezzo}</p>
    <p class="sale-city">${sale.citta}</p>
    <p class="sale-publish-date">${sale.data_pubblicazione}</p>
  `;

  // Aggiungi event listener per il click
  div.addEventListener("click", () => {
    navigateToSaleDetails(sale, index);
  });

  return div;
}

// Navigazione ai dettagli dell'annuncio
function navigateToSaleDetails(sale, index) {
  // Salva i dati dell'annuncio nel localStorage per recuperarli nella pagina dei dettagli
  const saleData = {
    ...sale,
    index: index,
    // Aggiungi dati venditore fittizi
    venditore: generateSellerData(),
  };

  localStorage.setItem("currentSale", JSON.stringify(saleData));

  // Determina l'URL di destinazione basato sulla pagina corrente
  let targetUrl;
  if (window.location.pathname.includes("/pages/")) {
    targetUrl = "./clicked_sale.html";
  } else {
    targetUrl = "./pages/clicked_sale.html";
  }

  window.location.href = targetUrl;
}

// Genera dati venditore fittizi
function generateSellerData() {
  const nomi = [
    "Mario Rossi",
    "Anna Bianchi",
    "Luca Verdi",
    "Sara Neri",
    "Marco Ferrari",
    "Elena Russo",
    "Giovanni Costa",
    "Laura Marino",
  ];
  const telefoni = [
    "320 123 4567",
    "339 876 5432",
    "347 555 0123",
    "388 999 8877",
    "340 111 2233",
    "335 444 5566",
    "329 777 8899",
    "348 222 3344",
  ];
  const emails = [
    "mario.rossi@email.com",
    "anna.bianchi@email.com",
    "luca.verdi@email.com",
    "sara.neri@email.com",
    "marco.ferrari@email.com",
    "elena.russo@email.com",
    "giovanni.costa@email.com",
    "laura.marino@email.com",
  ];

  const randomIndex = Math.floor(Math.random() * nomi.length);

  return {
    nome: nomi[randomIndex],
    telefono: telefoni[randomIndex],
    email: emails[randomIndex],
    membro_dal: new Date(
      Date.now() - Math.random() * 365 * 24 * 60 * 60 * 1000 * 3
    )
      .toISOString()
      .split("T")[0], // Membro da 0-3 anni fa
  };
}

// Visualizzazione delle vendite
function displaySales() {
  const container = document.getElementById("sales-container");
  if (!container) {
    console.error("Sales container not found!");
    return;
  }

  container.innerHTML = "";

  console.log("Displaying sales. Total filtered:", salesFiltered.length);

  const startIndex = (currentPage - 1) * cardsPerPage;
  const endIndex = startIndex + cardsPerPage;
  const salesPage = salesFiltered.slice(startIndex, endIndex);

  if (salesPage.length === 0) {
    container.innerHTML = `
      <div style="grid-column: 1 / -1; text-align: center; padding: 40px; color: #666;">
        <i class="fa-solid fa-search" style="font-size: 3em; margin-bottom: 20px; display: block;"></i>
        <h3>No results found</h3>
        <p>Try adjusting your search terms</p>
      </div>
    `;
    updatePaginationControls();
    return;
  }

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
  const categorySelect = document.getElementById("categories-select");
  const citySelect = document.getElementById("cities-select").value;
  const sortSelect = document.getElementById("sort-select").value;

  // Gestisci il caso in cui categories-select non esiste
  const categorySelectValue = categorySelect ? categorySelect.value : "All";

  // Filtra i dati
  salesFiltered = sales.filter((sale) => {
    const matchesSearch = sale.titolo.toLowerCase().includes(searchInput);
    const matchesCategory =
      categorySelectValue === "All" || sale.categoria === categorySelectValue;
    const matchesCity = citySelect === "All" || sale.citta === citySelect;

    return matchesSearch && matchesCategory && matchesCity;
  });

  // Ordina i risultati
  sortSales(sortSelect);

  currentPage = 1;
  displaySales();

  // Aggiorna l'URL se necessario
  updateURLWithFilters(categorySelectValue);
}

// Aggiorna URL con i filtri attuali
function updateURLWithFilters(category) {
  if (category && category !== "All") {
    const newUrl = `${window.location.pathname}?category=${encodeURIComponent(
      category
    )}`;
    window.history.replaceState({ category }, "", newUrl);
  } else {
    window.history.replaceState({}, "", window.location.pathname);
  }
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
  const categorySelect = document.getElementById("categories-select");
  if (categorySelect) categorySelect.value = "All";
  document.getElementById("cities-select").value = "All";
  document.getElementById("sort-select").value = "date-desc";

  salesFiltered = [...sales];
  currentPage = 1;
  displaySales();

  // Rimuovi parametri URL
  window.history.replaceState({}, "", window.location.pathname);

  // Aggiorna l'indicatore
  showCategoryIndicator("All Categories");
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

  // Gestione navigazione browser (back/forward)
  window.addEventListener("popstate", (event) => {
    applyURLFilters();
  });
}

// Gestisce il dropdown della navbar
function initNavbarDropdown() {
  const dropdownContainer = document.querySelector(".dropdown-container");
  const dropdownTrigger = document.getElementById(
    "categories-dropdown-trigger"
  );
  const dropdownMenu = document.getElementById("categories-dropdown-menu");

  if (!dropdownContainer || !dropdownTrigger || !dropdownMenu) return;

  // Gestisce il click sul trigger
  dropdownTrigger.addEventListener("click", (e) => {
    e.preventDefault();
    e.stopPropagation();
    dropdownContainer.classList.toggle("active");
  });

  // Chiude il dropdown quando si clicca fuori
  document.addEventListener("click", (e) => {
    if (!dropdownContainer.contains(e.target)) {
      dropdownContainer.classList.remove("active");
    }
  });

  // Evita che il dropdown si chiuda quando si clicca sui link interni
  dropdownMenu.addEventListener("click", (e) => {
    e.stopPropagation();
  });
}

// Sidebar Toggle
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
      const categoryIndicator = document.getElementById("category-indicator");
      if (categoryIndicator)
        categoryIndicator.classList.add("sidebar-expanded");

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
      const categoryIndicator = document.getElementById("category-indicator");
      if (categoryIndicator)
        categoryIndicator.classList.remove("sidebar-expanded");

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

// Determina se siamo nella pagina index o category
function isIndexPage() {
  return (
    window.location.pathname.endsWith("index.html") ||
    window.location.pathname.endsWith("/") ||
    (!window.location.pathname.includes("/pages/") &&
      !window.location.pathname.includes("category.html"))
  );
}

function isCategoryPage() {
  return window.location.pathname.includes("category.html");
}

// Determina se siamo nella pagina clicked_sale
function isClickedSalePage() {
  return window.location.pathname.includes("clicked_sale.html");
}

// Carica e visualizza i dettagli dell'annuncio
function loadSaleDetails() {
  const saleData = localStorage.getItem("currentSale");
  const container = document.getElementById("sale-details-container");

  if (!saleData || !container) {
    showSaleError();
    return;
  }

  try {
    const sale = JSON.parse(saleData);
    displaySaleDetails(sale, container);
  } catch (error) {
    console.error("Error parsing sale data:", error);
    showSaleError();
  }
}

// Visualizza i dettagli dell'annuncio
function displaySaleDetails(sale, container) {
  container.innerHTML = `
    <div class="sale-details">
      <div class="sale-header">
        <h1 class="sale-title">${sale.titolo}</h1>
        <span class="sale-category">${sale.categoria}</span>
      </div>
      
      <div class="sale-body">
        <div class="sale-image-section">
          <img src="${sale.immagine_principale}" alt="${
    sale.titolo
  }" class="sale-main-image" />
        </div>
        
        <div class="sale-info-section">
          <div class="price-section">
            <div class="sale-price">${sale.prezzo}</div>
            <div class="price-label">Prezzo</div>
          </div>
          
          <div class="info-grid">
            <div class="info-item">
              <div class="info-label">
                <i class="fa-solid fa-calendar"></i> Data pubblicazione
              </div>
              <div class="info-value">${sale.data_pubblicazione}</div>
            </div>
            
            <div class="info-item">
              <div class="info-label">
                <i class="fa-solid fa-location-dot"></i> Città
              </div>
              <div class="info-value">${sale.citta}</div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="description-section">
        <h3 class="description-title">
          <i class="fa-solid fa-file-text"></i> Descrizione
        </h3>
        <div class="sale-description">
          ${
            sale.descrizione ||
            "Nessuna descrizione disponibile per questo annuncio."
          }
        </div>
      </div>
      
      <div class="seller-section">
        <h3 class="seller-title">
          <i class="fa-solid fa-user"></i> Informazioni Venditore
        </h3>
        <div class="seller-info">
          <div class="seller-item">
            <i class="fa-solid fa-user-circle"></i>
            <div>
              <strong>${sale.venditore.nome}</strong>
            </div>
          </div>
          
          <div class="seller-item">
            <i class="fa-solid fa-clock"></i>
            <div>Membro dal ${sale.venditore.membro_dal}</div>
          </div>
        </div>
        
        <div class="contact-buttons">
          <a href="mailto:${sale.venditore.email}" class="contact-btn email">
            <i class="fa-solid fa-envelope"></i>
            Invia Email
          </a>
          <a href="tel:${sale.venditore.telefono}" class="contact-btn phone">
            <i class="fa-solid fa-phone"></i>
            Chiama
          </a>
        </div>

        <div class="payment-section" id="payment-section">
          <h2 class="payment-title">
            <i class="fab fa-paypal"></i>
            Pagamento Sicuro
          </h2>

          <div class="paypal-button-container">
            <a href="#" class="paypal-button" id="paypal-payment-btn">
              <i class="fab fa-paypal paypal-logo"></i>
              Paga con PayPal
            </a>
          </div>

          <div class="payment-info">
            <p><i class="fas fa-shield-alt"></i> Pagamento sicuro e protetto con PayPal</p>
            <p><i class="fas fa-lock"></i> I tuoi dati sono al sicuro e crittografati</p>
            <p><i class="fas fa-undo"></i> Politica di rimborso PayPal attiva</p>
          </div>
        </div>
      </div>
    </div>
  `;
}

// Mostra errore se l'annuncio non viene trovato
function showSaleError() {
  const container = document.getElementById("sale-details-container");
  if (container) {
    container.innerHTML = `
      <div class="error-message">
        <i class="fa-solid fa-exclamation-triangle"></i>
        <h3>Annuncio non trovato</h3>
        <p>L'annuncio che stai cercando non è disponibile.</p>
        <a href="../index.html" class="nav-link" style="margin-top: 20px; display: inline-flex;">
          <i class="fa-solid fa-arrow-left"></i>
          Torna alla Homepage
        </a>
      </div>
    `;
  }
}

// Gestione form nuovo annuncio
document.addEventListener("DOMContentLoaded", function () {
  const newListingBtn = document.getElementById("new-listing-btn");
  const listingOverlay = document.getElementById("listing-overlay");
  const closeBtn = document.getElementById("close-listing-form");
  const cancelBtn = document.getElementById("cancel-listing");
  const newListingForm = document.getElementById("new-listing-form");
  const listingCitySelect = document.getElementById("listing-city");
  const listingCategorySelect = document.getElementById("listing-category");

  // Popola le select del form con i dati esistenti
  function populateFormSelects() {
    // Popola città
    if (listingCitySelect && cities && cities.length > 0) {
      listingCitySelect.innerHTML =
        '<option value="">Seleziona una città</option>';
      cities.forEach((city) => {
        const option = document.createElement("option");
        option.value = city;
        option.textContent = city;
        listingCitySelect.appendChild(option);
      });
    }

    // Popola categorie
    if (listingCategorySelect && categories && categories.length > 0) {
      listingCategorySelect.innerHTML =
        '<option value="">Seleziona una categoria</option>';
      categories.forEach((category) => {
        const option = document.createElement("option");
        option.value = category;
        option.textContent = category;
        listingCategorySelect.appendChild(option);
      });
    }
  }

  // Apri form
  function openListingForm() {
    populateFormSelects();
    listingOverlay.classList.remove("hidden");
    document.body.style.overflow = "hidden";
  }

  // Chiudi form
  function closeListingForm() {
    listingOverlay.classList.add("hidden");
    document.body.style.overflow = "auto";
    newListingForm.reset();
  }

  // Mostra messaggio di successo
  function showSuccessMessage() {
    const message = document.createElement("div");
    message.className = "success-message";
    message.innerHTML =
      '<i class="fa-solid fa-check-circle"></i> Annuncio pubblicato con successo!';
    document.body.appendChild(message);

    setTimeout(() => message.classList.add("show"), 100);

    setTimeout(() => {
      message.classList.remove("show");
      setTimeout(() => {
        if (message.parentNode) {
          message.parentNode.removeChild(message);
        }
      }, 300);
    }, 3000);
  }

  // Event listeners
  if (newListingBtn) {
    newListingBtn.addEventListener("click", function (e) {
      e.preventDefault();
      openListingForm();
    });
  }

  if (closeBtn) {
    closeBtn.addEventListener("click", closeListingForm);
  }

  if (cancelBtn) {
    cancelBtn.addEventListener("click", closeListingForm);
  }

  // Chiudi cliccando sull'overlay
  if (listingOverlay) {
    listingOverlay.addEventListener("click", function (e) {
      if (e.target === listingOverlay) {
        closeListingForm();
      }
    });
  }

  // Gestione submit form
  if (newListingForm) {
    newListingForm.addEventListener("submit", function (e) {
      e.preventDefault();

      const formData = new FormData(newListingForm);
      const currentDate = new Date().toLocaleDateString("it-IT");

      console.log("Nuovo annuncio:", {
        titolo: formData.get("title"),
        descrizione: formData.get("description"),
        prezzo: formData.get("price"),
        città: formData.get("city"),
        categoria: formData.get("category"),
        immagine: formData.get("image")?.name || "Nessuna immagine",
        dataPubblicazione: currentDate,
      });

      closeListingForm();
      showSuccessMessage();
    });
  }

  // Chiudi con tasto ESC
  document.addEventListener("keydown", function (e) {
    if (e.key === "Escape" && !listingOverlay.classList.contains("hidden")) {
      closeListingForm();
    }
  });
});

// Gestione form contatti
function initContactForm() {
  const contactForm = document.getElementById("contact-form");

  // Mostra messaggio di successo per contatti
  function showContactSuccessMessage() {
    const message = document.createElement("div");
    message.className = "success-message";
    message.innerHTML =
      '<i class="fa-solid fa-check-circle"></i> Messaggio inviato con successo!';
    document.body.appendChild(message);

    setTimeout(() => message.classList.add("show"), 100);

    setTimeout(() => {
      message.classList.remove("show");
      setTimeout(() => {
        if (message.parentNode) {
          message.parentNode.removeChild(message);
        }
      }, 300);
    }, 3000);
  }

  // Gestione submit form contatti
  if (contactForm) {
    contactForm.addEventListener("submit", function (e) {
      e.preventDefault();

      const formData = new FormData(contactForm);

      console.log("Messaggio contatti:", {
        nome: formData.get("name"),
        email: formData.get("email"),
        oggetto: formData.get("subject"),
        messaggio: formData.get("message"),
      });

      contactForm.reset();
      showContactSuccessMessage();
    });
  }
}

document.addEventListener("DOMContentLoaded", function () {
  initContactForm();
});

// Inizializzazione principale
async function init() {
  try {
    console.log("Starting initialization...");

    // Se siamo nella pagina clicked_sale, carica solo i dettagli dell'annuncio
    if (isClickedSalePage()) {
      await fetchCategories(); // Per popolare il dropdown della navbar
      initNavbarDropdown();
      initSidebarToggle();
      loadSaleDetails();
      initAuthSystem();
      initializePayPal();
      return;
    }

    // Carica tutti i dati per le altre pagine
    await Promise.all([fetchSales(), fetchCategories(), fetchCities()]);

    console.log("Data loaded. Sales count:", sales.length);

    // Inizializza il dropdown della navbar
    initNavbarDropdown();

    // Se siamo nella pagina category, applica filtri URL
    if (isCategoryPage()) {
      console.log("Category page detected, applying URL filters");
      applyURLFilters();
    } else if (isIndexPage()) {
      console.log("Index page detected, showing all sales");
      // Nell'index mostra tutte le vendite
      salesFiltered = [...sales];
      displaySales();
    }

    // Setup event listeners e sidebar toggle
    setupEventListeners();
    initSidebarToggle();
    initAuthSystem();

    console.log("Initialization complete!");
  } catch (error) {
    console.error("Initialization error:", error);
  }
}

// SISTEMA DI AUTENTICAZIONE
// Gestione utenti e autenticazione con localStorage

// Inizializza il sistema di autenticazione quando la pagina si carica
document.addEventListener("DOMContentLoaded", function () {
  initAuthSystem();
});

function initAuthSystem() {
  updateNavbarAuth();

  // Se siamo nella pagina login-register, inizializza i form
  if (window.location.pathname.includes("login-register.html")) {
    initAuthForms();
  }
}

// Aggiorna la navbar in base allo stato di login
function updateNavbarAuth() {
  // Cerca l'elemento userName nell'index.html
  const userNameSpan = document.getElementById("userName");

  const currentUser = getCurrentUser();

  if (currentUser && userNameSpan) {
    // Utente loggato - mostra il nome utente
    userNameSpan.textContent = currentUser.name;

    // Opzionale: aggiungi un link di logout
    const userLink = userNameSpan.parentElement;
    if (userLink && !userLink.hasAttribute("data-logout-added")) {
      userLink.setAttribute("data-logout-added", "true");
      userLink.addEventListener("click", function (e) {
        e.preventDefault();
        if (confirm("Vuoi effettuare il logout?")) {
          handleLogout();
        }
      });
      userLink.style.cursor = "pointer";
      userLink.title = "Clicca per effettuare il logout";
    }
  } else if (userNameSpan) {
    // Utente non loggato - mostra testo di default
    userNameSpan.textContent = "Accedi";
  }
}

// Ottieni l'utente corrente dal localStorage
function getCurrentUser() {
  const user = localStorage.getItem("currentUser");
  return user ? JSON.parse(user) : null;
}

// Salva l'utente corrente nel localStorage
function saveCurrentUser(user) {
  localStorage.setItem("currentUser", JSON.stringify(user));
}

// Ottieni tutti gli utenti registrati
function getAllUsers() {
  const users = localStorage.getItem("registeredUsers");
  return users ? JSON.parse(users) : [];
}

// Salva tutti gli utenti registrati
function saveAllUsers(users) {
  localStorage.setItem("registeredUsers", JSON.stringify(users));
}

// Inizializza i form di autenticazione
function initAuthForms() {
  const toggleBtns = document.querySelectorAll(".auth-toggle-btn");
  const loginForm = document.getElementById("login-form");
  const registerForm = document.getElementById("register-form");
  const passwordToggles = document.querySelectorAll(".password-toggle");

  // Toggle tra login e register
  toggleBtns.forEach((btn) => {
    btn.addEventListener("click", () => {
      const formType = btn.getAttribute("data-form");

      // Aggiorna bottoni attivi
      toggleBtns.forEach((b) => b.classList.remove("active"));
      btn.classList.add("active");

      // Mostra/nascondi form
      if (formType === "login") {
        loginForm.classList.add("active");
        registerForm.classList.remove("active");
      } else {
        registerForm.classList.add("active");
        loginForm.classList.remove("active");
      }

      // Reset messaggi di errore
      hideErrorMessage();
    });
  });

  // Toggle visibilità password
  passwordToggles.forEach((toggle) => {
    toggle.addEventListener("click", () => {
      const targetId = toggle.getAttribute("data-target");
      const targetInput = document.getElementById(targetId);
      const icon = toggle.querySelector("i");

      if (targetInput.type === "password") {
        targetInput.type = "text";
        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");
      } else {
        targetInput.type = "password";
        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");
      }
    });
  });

  // Gestione submit login
  if (loginForm) {
    loginForm.addEventListener("submit", handleLogin);
  }

  // Gestione submit register
  if (registerForm) {
    registerForm.addEventListener("submit", handleRegister);
  }

  // Validazione in tempo reale
  setupRealTimeValidation();
}

// Gestisce il login
function handleLogin(e) {
  e.preventDefault();

  const email = document.getElementById("login-email").value.trim();
  const password = document.getElementById("login-password").value;
  const rememberMe = document.getElementById("remember-me").checked;

  // Validazione
  if (!email || !password) {
    showErrorMessage("Tutti i campi sono obbligatori");
    return;
  }

  if (!isValidEmail(email)) {
    showErrorMessage("Inserisci un indirizzo email valido");
    return;
  }

  // Verifica credenziali
  const users = getAllUsers();
  const user = users.find((u) => u.email === email && u.password === password);

  if (!user) {
    showErrorMessage("Email o password non corretti");
    return;
  }

  // Login riuscito
  const loginData = {
    id: user.id,
    name: user.name,
    email: user.email,
    loginTime: new Date().toISOString(),
    rememberMe: rememberMe,
  };

  saveCurrentUser(loginData);
  showSuccessMessage("Login effettuato con successo!");

  // Reindirizza alla homepage dopo 1.5 secondi
  setTimeout(() => {
    // Correggi il path per il redirect
    window.location.href = "../index.html";
  }, 1500);
}

// Gestisce la registrazione
function handleRegister(e) {
  e.preventDefault();

  const name = document.getElementById("register-name").value.trim();
  const email = document.getElementById("register-email").value.trim();
  const password = document.getElementById("register-password").value;
  const confirmPassword = document.getElementById("confirm-password").value;
  const acceptTerms = document.getElementById("accept-terms").checked;

  // Validazione
  if (!name || !email || !password || !confirmPassword) {
    showErrorMessage("Tutti i campi sono obbligatori");
    return;
  }

  if (!isValidEmail(email)) {
    showErrorMessage("Inserisci un indirizzo email valido");
    return;
  }

  if (password.length < 6) {
    showErrorMessage("La password deve essere di almeno 6 caratteri");
    return;
  }

  if (password !== confirmPassword) {
    showErrorMessage("Le password non coincidono");
    return;
  }

  if (!acceptTerms) {
    showErrorMessage("Devi accettare i termini di servizio");
    return;
  }

  // Verifica se l'email è già registrata
  const users = getAllUsers();
  if (users.find((u) => u.email === email)) {
    showErrorMessage("Questa email è già registrata");
    return;
  }

  // Crea nuovo utente
  const newUser = {
    id: Date.now().toString(),
    name: name,
    email: email,
    password: password,
    registrationDate: new Date().toISOString(),
  };

  // Salva nuovo utente
  users.push(newUser);
  saveAllUsers(users);

  // Login automatico
  const loginData = {
    id: newUser.id,
    name: newUser.name,
    email: newUser.email,
    loginTime: new Date().toISOString(),
    rememberMe: false,
  };

  saveCurrentUser(loginData);
  showSuccessMessage("Registrazione completata! Benvenuto!");

  // Reindirizza alla homepage dopo 1.5 secondi
  setTimeout(() => {
    window.location.href = "../index.html";
  }, 1500);
}

// Gestisce il logout
function handleLogout() {
  localStorage.removeItem("currentUser");
  showSuccessMessage("Logout effettuato con successo!");

  // Aggiorna la navbar
  setTimeout(() => {
    updateNavbarAuth();

    // Refresh della pagina per aggiornare completamente lo stato
    window.location.reload();
  }, 1000);
}

// Mostra messaggio di successo
function showSuccessMessage(message) {
  // Puoi usare la stessa struttura del messaggio di errore o un alert
  const errorDiv = document.getElementById("error-message");
  const errorText = document.getElementById("error-text");

  if (errorDiv && errorText) {
    errorText.textContent = message;
    errorDiv.classList.remove("error-message");
    errorDiv.classList.add("success-message");
    errorDiv.classList.add("show");

    // Nascondi dopo 3 secondi
    setTimeout(() => {
      hideErrorMessage();
      errorDiv.classList.remove("success-message");
      errorDiv.classList.add("error-message");
    }, 3000);
  } else {
    // Fallback con alert se non c'è l'elemento
    alert(message);
  }
}

// Validazione email
function isValidEmail(email) {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}

// Mostra messaggio di errore
function showErrorMessage(message) {
  const errorDiv = document.getElementById("error-message");
  const errorText = document.getElementById("error-text");

  if (errorDiv && errorText) {
    errorText.textContent = message;
    errorDiv.classList.add("show");

    // Nascondi dopo 5 secondi
    setTimeout(() => {
      hideErrorMessage();
    }, 5000);
  }
}

// Nascondi messaggio di errore
function hideErrorMessage() {
  const errorDiv = document.getElementById("error-message");
  if (errorDiv) {
    errorDiv.classList.remove("show");
  }
}

// Validazione in tempo reale
function setupRealTimeValidation() {
  const inputs = document.querySelectorAll(".form-input");

  inputs.forEach((input) => {
    input.addEventListener("blur", () => validateInput(input));
    input.addEventListener("input", () => clearValidation(input));
  });

  // Validazione speciale per conferma password
  const confirmPassword = document.getElementById("confirm-password");
  const registerPassword = document.getElementById("register-password");

  if (confirmPassword && registerPassword) {
    confirmPassword.addEventListener("input", () => {
      validatePasswordMatch(registerPassword, confirmPassword);
    });
  }
}

// Valida singolo input
function validateInput(input) {
  const value = input.value.trim();
  let isValid = true;
  let message = "";

  switch (input.type) {
    case "email":
      isValid = value && isValidEmail(value);
      message = isValid
        ? "Email valida"
        : "Inserisci un indirizzo email valido";
      break;
    case "password":
      isValid = value.length >= 6;
      message = isValid
        ? "Password valida"
        : "La password deve essere di almeno 6 caratteri";
      break;
    case "text":
      if (input.id === "register-name") {
        isValid = value.length >= 2;
        message = isValid
          ? "Nome valido"
          : "Il nome deve essere di almeno 2 caratteri";
      }
      break;
  }

  updateInputValidation(input, isValid, message);
}

// Valida corrispondenza password
function validatePasswordMatch(password, confirmPassword) {
  const isValid =
    password.value === confirmPassword.value &&
    confirmPassword.value.length > 0;
  const message = isValid
    ? "Le password coincidono"
    : "Le password non coincidono";

  updateInputValidation(confirmPassword, isValid, message);
}

// Aggiorna lo stato di validazione dell'input
function updateInputValidation(input, isValid, message) {
  const validationMessage = input.parentNode.querySelector(
    ".validation-message"
  );

  if (validationMessage) {
    validationMessage.textContent = message;
    validationMessage.className = `validation-message ${
      isValid ? "success" : "error"
    }`;
  }

  input.className = `form-input ${isValid ? "valid" : "invalid"}`;
}

// Pulisci validazione
function clearValidation(input) {
  const validationMessage = input.parentNode.querySelector(
    ".validation-message"
  );

  if (validationMessage) {
    validationMessage.textContent = "";
    validationMessage.className = "validation-message";
  }

  input.className = "form-input";
}

// Controllo accesso per pagine protette (opzionale)
function requireAuth() {
  const currentUser = getCurrentUser();
  if (!currentUser) {
    alert("Devi effettuare l'accesso per accedere a questa pagina");
    window.location.href = "./login-register.html";
    return false;
  }
  return true;
}

// === PAYPAL PAYMENT FUNCTIONS ===

// Funzione principale per inizializzare PayPal
function initializePayPal() {
  // Aspetta che il DOM sia caricato
  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", setupPayPalButton);
  } else {
    setupPayPalButton();
  }
}

// Configura il pulsante PayPal
function setupPayPalButton() {
  const paypalBtn = document.getElementById("paypal-payment-btn");
  const priceElement = document.getElementById("product-price");

  if (!paypalBtn) {
    console.log("PayPal button not found on this page");
    return;
  }

  let price = 100; // Prezzo di default
  if (priceElement) {
    const priceText = priceElement.textContent
      .replace("€", "")
      .replace(",", ".")
      .trim();
    const parsedPrice = parseFloat(priceText);
    if (!isNaN(parsedPrice)) {
      price = parsedPrice;
    }
  }

  // Crea URL PayPal.me
  const paypalMeUrl = `https://www.paypal.me/DavidePanda/${price}EUR`;

  // Configura il pulsante
  paypalBtn.href = paypalMeUrl;
  paypalBtn.target = "_blank";

  // Event listener per il click
  paypalBtn.addEventListener("click", handlePayPalClick);
}

// Gestisce il click sul pulsante PayPal
function handlePayPalClick(e) {
  const priceElement = document.getElementById("product-price");
  const price = priceElement ? priceElement.textContent : "€ 100,00";

  // Conferma pagamento
  const confirmed = confirm(
    `Stai per essere reindirizzato a PayPal per pagare ${price}. Continuare?`
  );

  if (!confirmed) {
    e.preventDefault();
    return false;
  }

  return true;
}

// Inizializza PayPal quando la pagina è pronta
initializePayPal();

// Funzioni di utilità per essere chiamate da altre parti del codice
window.DubitoPayPal = {
  init: initializePayPal,
};

// Avvia l'applicazione
document.addEventListener("DOMContentLoaded", init);
