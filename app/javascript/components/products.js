// Hide and show filters that personalize search results
const filtersBtn = document.querySelector(".products-container__header-filter-btn")
const filters = document.querySelector(".products-container__filters")
const productsGrid = document.querySelector(".products-container__grid")
filtersBtn.addEventListener( "click" , (e) => {
  filters.classList.toggle("filters_active")
  productsGrid.classList.toggle("filters_active")
})

// Hide and show options to sort the search results
const sortBtn = document.querySelector(".products-container__header-sort-btn")
const sortCollection = document.querySelector(".products-container__header-sort-selection")
sortBtn.addEventListener( "click" , (e) => {
  sortCollection.classList.toggle("sort-selection_active")
})