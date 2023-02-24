const productsController = () => {
  // Hide and show filters that personalize search results
  const filtersBtn = document.querySelector(".products-container__header-filter-btn")
  const filters = document.querySelector(".products-container__filters")
  const productsGrid = document.querySelector(".products-container__grid")
  filtersBtn.addEventListener("click", (e) => {
    filters.classList.toggle("filters_active")
    productsGrid.classList.toggle("filters_active")
  })

  // Hide and show options to sort the search results
  const sortBtn = document.querySelector(".products-container__header-sort-btn")
  const sortCollection = document.querySelector(".products-container__header-sort-selection")
  sortBtn.addEventListener("click", (e) => {
    sortCollection.classList.toggle("sort-selection_active")
  })

  // ---------------------------------- Filter products begin ----------------------------------
  // Check if the filter already exists in the list of applied filters
  function filterExists(filter) {
    let appliedFiltersNodeList = document.querySelectorAll(".products-container__header-filters-applied-item")
    if (appliedFiltersNodeList.length === 0) {
      return false
    }
    // convert NodeList to Array of innerTexts
    let appliedFilters = []
    appliedFiltersNodeList.forEach((appliedFilter) => {
      appliedFilters.push(appliedFilter.innerText)
    })
    return appliedFilters.includes(`${filter} x`)
  }

  // Add filter to the list of applied filters
  function addFilterLi(filter, filterType) {
    let li = document.createElement("li")
    li.classList.add("products-container__header-filters-applied-item")

    // form
    let form = document.createElement("form")
    form.setAttribute("data-controller", "search-form")
    form.setAttribute("data-turbo-frame", "products")
    form.setAttribute("data-turbo-action", "advance")
    form.setAttribute("action", "/products")
    form.setAttribute("accept-charset", "UTF-8")
    form.setAttribute("method", "get")
    // button to remove filter
    let removeFilterBtn = document.createElement("button")
    removeFilterBtn.setAttribute("name", `remove_${filterType}_filter`)
    removeFilterBtn.setAttribute("type", "search")
    removeFilterBtn.setAttribute("value", filter)
    removeFilterBtn.classList.add("products-container__header-filters-applied-item-remove")
    removeFilterBtn.innerText = `${filter} x`

    form.appendChild(removeFilterBtn)
    li.appendChild(form)
    filtersApplied.appendChild(li)
  }

  // UL list that will display applied filters
  const filtersApplied = document.querySelector(".products-container__applied-filters-list")

  let search = window.location.search.split(/[?&=]/)
  let query = search[2]

  // get size filter from the url
  let sizeFilter = ""
  if (search.includes("size_filter")) {
    let sizeFilterIndex = search.indexOf("size_filter") + 1
    sizeFilter = search[sizeFilterIndex].toLowerCase()
  }

  // get color filter from the url
  let colorFilter = ""
  if (search.includes("color_filter")) {
    let colorFilterIndex = search.indexOf("color_filter") + 1
    colorFilter = search[colorFilterIndex].toLowerCase()
  }

  // get brand from the url
  let brandFilter = ""
  if (search.includes("brand_filter")) {
    let brandIndex = search.indexOf("brand_filter") + 1
    brandFilter = search[brandIndex].toLowerCase()
  }

  // get category from the url
  let categoryFilter = ""
  if (search.includes("category_filter")) {
    let categoryIndex = search.indexOf("category_filter") + 1
    categoryFilter = search[categoryIndex].toLowerCase()
  }

  // get min price from the url
  let minPriceFilter = ""
  if (search.includes("min_price_filter")) {
    let minPriceIndex = search.indexOf("min_price_filter") + 1
    minPriceFilter = search[minPriceIndex]
  }

  // get max price from the url
  let maxPriceFilter = ""
  if (search.includes("max_price_filter")) {
    let maxPriceIndex = search.indexOf("max_price_filter") + 1
    maxPriceFilter = search[maxPriceIndex]
  }

  // add valid li element to the list of applied filters if it doesn't already exist
  if (sizeFilter !== "" && !filterExists(sizeFilter)) { addFilterLi(sizeFilter, "size") }
  if (colorFilter !== "" && !filterExists(colorFilter)) { addFilterLi(colorFilter, "color") }
  if (brandFilter !== "" && !filterExists(brandFilter)) { addFilterLi(brandFilter, "brand") }
  if (categoryFilter !== "" && !filterExists(categoryFilter)) { addFilterLi(categoryFilter, "category") }
  if (minPriceFilter !== "" && !filterExists(minPriceFilter)) { addFilterLi(`min:${minPriceFilter}`, "min_price") }
  if (maxPriceFilter !== "" && !filterExists(maxPriceFilter)) { addFilterLi(`max:${maxPriceFilter}`, "max_price") }
}

// ---------------------------------- Filter products end ----------------------------------

export default productsController;
