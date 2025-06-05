let dischi = [];
let dischiFiltrati = [];
let currentPage = 1;
const cardsPerPage = 12;
const copertine = ["disco2.jpg", "disco3.jpg", "disco4.jpg"];

async function fetchDischi() {
  try {
    const response = await fetch("dischi_musicali.json");
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    dischi = await response.json();
    dischiFiltrati = [...dischi];
    return dischi;
  } catch (error) {
    console.error(`Couldn't get data: ${error}`);
  }
}

function card(disco, indice) {
  const div = document.createElement("div");
  div.className = "disco-card";

  const copertinaIndex = indice % copertine.length;

  div.innerHTML = `
    <img src="${copertine[copertinaIndex]}" alt="Copertina ${disco.nome_disco}">
    <p class="nome-disco">${disco.nome_disco}</p>
    <p class="artista">${disco.artista}</p>
    <p class="categoria">${disco.categoria}</p>
    <p class="prezzo">€${disco.prezzo}</p>
    <p class="descrizione">${disco.descrizione}</p>
  `;

  return div;
}

function displayDischi() {
  const container = document.getElementById("dischi-container");

  container.innerHTML = "";

  const startIndex = (currentPage - 1) * cardsPerPage;
  const endIndex = startIndex + cardsPerPage;

  const dischiPagina = dischiFiltrati.slice(startIndex, endIndex);

  dischiPagina.forEach((disco, indice) => {
    const cardElement = card(disco, startIndex + indice);
    container.appendChild(cardElement);
  });

  updatePaginationControls();
}

function updatePaginationControls() {
  const totalPages = Math.ceil(dischiFiltrati.length / cardsPerPage);
  const paginationContainer = document.getElementById("pagination-container");

  if (!paginationContainer) {
    console.error("Container paginazione non trovato!");
    return;
  }

  paginationContainer.innerHTML = "";

  const prevBtn = document.createElement("button");
  prevBtn.textContent = "« Precedente";
  prevBtn.className = "pagination-btn";
  prevBtn.disabled = currentPage === 1;
  prevBtn.onclick = () => {
    if (currentPage > 1) {
      currentPage--;
      displayDischi();
    }
  };
  paginationContainer.appendChild(prevBtn);

  for (let i = 1; i <= totalPages; i++) {
    const pageBtn = document.createElement("button");
    pageBtn.textContent = i;
    pageBtn.className = `pagination-btn ${i === currentPage ? "active" : ""}`;
    pageBtn.onclick = () => {
      currentPage = i;
      displayDischi();
    };
    paginationContainer.appendChild(pageBtn);
  }

  const nextBtn = document.createElement("button");
  nextBtn.textContent = "Successivo »";
  nextBtn.className = "pagination-btn";
  nextBtn.disabled = currentPage === totalPages;
  nextBtn.onclick = () => {
    if (currentPage < totalPages) {
      currentPage++;
      displayDischi();
    }
  };
  paginationContainer.appendChild(nextBtn);

  const pageInfo = document.createElement("div");
  pageInfo.className = "page-info";
  pageInfo.textContent = `Pagina ${currentPage} di ${totalPages} (${dischiFiltrati.length} dischi totali)`;
  paginationContainer.appendChild(pageInfo);
}

function populateArtistFilter() {
  const artistSelect = document.getElementById("artist-select");
  const uniqueArtists = [
    ...new Set(dischi.map((disco) => disco.artista)),
  ].sort();

  artistSelect.innerHTML = '<option value="all">Tutti</option>';

  uniqueArtists.forEach((artist) => {
    const option = document.createElement("option");
    option.value = artist.toLowerCase();
    option.textContent = artist;
    artistSelect.appendChild(option);
  });
}

function updatePriceDisplay() {
  const priceRange = document.getElementById("price-range");
  const minPriceSpan = document.getElementById("min-price-value");
  const maxPriceSpan = document.getElementById("max-price-value");

  minPriceSpan.textContent = `0€`;
  maxPriceSpan.textContent = `${priceRange.value}€`;
}

function applyFilters() {
  const categorySelect = document.getElementById("category-select");
  const artistSelect = document.getElementById("artist-select");
  const priceRange = document.getElementById("price-range");

  const selectedCategory = categorySelect.value;
  const selectedArtist = artistSelect.value;
  const maxPrice = parseInt(priceRange.value);

  dischiFiltrati = dischi.filter((disco) => {
    const categoryMatch =
      selectedCategory === "all" ||
      disco.categoria.toLowerCase() === selectedCategory.toLowerCase();

    const artistMatch =
      selectedArtist === "all" ||
      disco.artista.toLowerCase() === selectedArtist.toLowerCase();

    const priceMatch = disco.prezzo <= maxPrice;

    return categoryMatch && artistMatch && priceMatch;
  });

  currentPage = 1;
  displayDischi();
}

function resetFilters() {
  document.getElementById("category-select").value = "all";
  document.getElementById("artist-select").value = "all";
  document.getElementById("price-range").value = "100";

  updatePriceDisplay();
  dischiFiltrati = [...dischi];
  currentPage = 1;
  displayDischi();
}

document.addEventListener("DOMContentLoaded", async () => {
  await fetchDischi();

  if (dischi.length > 0) {
    populateArtistFilter();

    updatePriceDisplay();

    displayDischi();

    const categorySelect = document.getElementById("category-select");
    const artistSelect = document.getElementById("artist-select");
    const priceRange = document.getElementById("price-range");

    const allCategoryOption = document.createElement("option");
    allCategoryOption.value = "all";
    allCategoryOption.textContent = "Tutte";
    categorySelect.insertBefore(allCategoryOption, categorySelect.firstChild);
    categorySelect.value = "all";

    categorySelect.addEventListener("change", applyFilters);
    artistSelect.addEventListener("change", applyFilters);
    priceRange.addEventListener("input", () => {
      updatePriceDisplay();
      applyFilters();
    });

    const sidebar = document.querySelector(".sidebar");
    const resetButton = document.createElement("button");
    resetButton.textContent = "Reset Filtri";
    resetButton.style.cssText = `
      padding: 10px 6px;
      background-color: skyblue;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 14px;
      margin-top: 20px;
    `;
    resetButton.addEventListener("click", resetFilters);
    resetButton.addEventListener("mouseenter", () => {
      resetButton.style.backgroundColor = "lightskyblue";
    });
    resetButton.addEventListener("mouseleave", () => {
      resetButton.style.backgroundColor = "skyblue";
    });

    sidebar.appendChild(resetButton);
  }
});
