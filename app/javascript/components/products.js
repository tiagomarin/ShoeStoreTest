window.addEventListener("click", (event) => {
  // Hide and show filters that personalize search results
  if (event.target.className === "products-container__header-filter-btn") {
    document.querySelector(".products-container__filters").classList.toggle("filters_active")
    document.querySelector(".products-container__grid").classList.toggle("filters_active")
  }
  // Hide and show options to sort the search results
  if (event.target.className === "products-container__header-sort-btn") {
    document.querySelector(".products-container__header-sort-selection").classList.toggle("sort-selection_active")
  }
})