if (window.location.pathname === "/products") {
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
  // UL list that will display applied filters
  const filtersApplied = document.querySelector(".products-container__applied-filters-list")
  // Add filter to the list of applied filters

  // Check if the filter already exists in the list of applied filters
  function filterExists(filter) {
    let appliedFiltersNodeList = document.querySelectorAll(".products-container__header-filters-applied-item")
    if (appliedFiltersNodeList.length === 0) {
      return false
    }
    // convert NodeList to Array of innerText
    let appliedFilters = []
    appliedFiltersNodeList.forEach((filter) => {
      appliedFilters.push(filter.innerText)
    })
    return appliedFilters.includes(filter)
  }
  // Add filter to the list of applied filters if it doesn't already exist
  function addFilterLi(filter) {
    let li = document.createElement("li")
    li.classList.add("products-container__header-filters-applied-item")
    li.textContent = filter
    filtersApplied.appendChild(li)
  }

  // Watch for changes to the products container and update the DOM acconding to user filter choices
  const productsDiv = document.querySelector("#products")
  function productsChange(mutationList) {
    // only run if the products container has changed
    if (mutationList.length !== 0) {
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
      if (sizeFilter !== "" && !filterExists(sizeFilter)) { addFilterLi(sizeFilter) }
      if (colorFilter !== "" && !filterExists(colorFilter)) { addFilterLi(colorFilter) }
      if (brandFilter !== "" && !filterExists(brandFilter)) { addFilterLi(brandFilter) }
      if (categoryFilter !== "" && !filterExists(categoryFilter)) { addFilterLi(categoryFilter) }
      if (minPriceFilter !== "" && !filterExists(minPriceFilter)) { addFilterLi(`min:${minPriceFilter}`) }
      if (maxPriceFilter !== "" && !filterExists(maxPriceFilter)) { addFilterLi(`max:${maxPriceFilter}`) }
      // add query to be used in the search form as query when sending a reqquest that filters results
      let hiddenQueries = document.querySelectorAll(".add_query")
      hiddenQueries.forEach((element) => {
          element.value = query
      })
      
      /* 
      Add filters applied to "value" in hidden fields. These values are filters that user already applied. 
      The new filter selected will be added to the value of the hidden field (in products controller).
      */
      // SIZE FILTER
      const appliedSizeFilters = document.querySelectorAll(".add_size_filters_applied")
      appliedSizeFilters.forEach((element) => {
        let correctGrandParent = element.parentElement.parentElement.classList.contains("products-container__filter-sizes-item")
        let siblingHasSize = element.parentElement.lastElementChild.innerText.toLowerCase() === sizeFilter
        if (correctGrandParent && !siblingHasSize && sizeFilter !== ""){
          element.value === "" ? element.value = `${sizeFilter}` : element.value += ` ${sizeFilter}`
        }
        if (!correctGrandParent && sizeFilter !== ""){
          element.value === "" ? element.value = `${sizeFilter}` : element.value += ` ${sizeFilter}`
        }
      })
      // COLOR FILTER
      const appliedColorFilters = document.querySelectorAll(".add_color_filters_applied")
      appliedColorFilters.forEach((element) => {
        let correctGrandParent = element.parentElement.parentElement.classList.contains("products-container__filter-colors-item")
        let siblingHasColor = element.parentElement.lastElementChild.innerText.toLowerCase() === colorFilter
        if (correctGrandParent && !siblingHasColor && colorFilter !== ""){
          element.value === "" ? element.value = `${colorFilter}` : element.value += ` ${colorFilter}`
        }
        if (!correctGrandParent && colorFilter !== ""){
          element.value === "" ? element.value = `${colorFilter}` : element.value += ` ${colorFilter}`
        }
      })

      // BRAND FILTER
      const appliedBrandFilters = document.querySelectorAll(".add_brand_filters_applied")
      appliedBrandFilters.forEach((element) => {
        let correctGrandParent = element.parentElement.parentElement.classList.contains("products-container__filter-brands-item")
        let siblingHasBrand = element.parentElement.lastElementChild.innerText.toLowerCase() === brandFilter
        if (correctGrandParent && !siblingHasBrand && brandFilter !== ""){
          element.value === "" ? element.value = `${brandFilter}` : element.value += ` ${brandFilter}`
        }
        if (!correctGrandParent && brandFilter !== ""){
          element.value === "" ? element.value = `${brandFilter}` : element.value += ` ${brandFilter}`
        }
      })
      // CATEGORY FILTER
      const appliedCategoryFilters = document.querySelectorAll(".add_category_filters_applied")
      appliedCategoryFilters.forEach((element) => {
        let correctGrandParent = element.parentElement.parentElement.classList.contains("products-container__filter-categories-item")
        let siblingHasCategory = element.parentElement.lastElementChild.innerText.toLowerCase() === categoryFilter
        if (correctGrandParent && !siblingHasCategory && categoryFilter !== ""){
          element.value === "" ? element.value = `${categoryFilter}` :  element.value += ` ${categoryFilter}`
        }
        if (!correctGrandParent && categoryFilter !== ""){
          element.value === "" ? element.value = `${categoryFilter}` : element.value += ` ${categoryFilter}`
        }
      })
      // MIN PRICE FILTER
      const appliedMinPriceFilters = document.querySelectorAll(".add_min_price_filter_applied")
        let min = parseInt(minPriceFilter)
        let max = 0
        if (maxPriceFilter !== ""){
          max = parseInt(maxPriceFilter)
        }
        if (min < max || max === 0) {
          appliedMinPriceFilters.forEach((element) => {
            element.value = minPriceFilter
          })
        }
      // MAX PRICE FILTER
      const appliedMaxPriceFilters = document.querySelectorAll(".add_max_price_filter_applied")
      max = parseInt(maxPriceFilter)
      min = 0
      if (minPriceFilter !== ""){
        min = parseInt(minPriceFilter)
      }
      if (max > min || min === 0) {
        appliedMaxPriceFilters.forEach((element) => {
          element.value = maxPriceFilter
        })
      }
    }
  }

  const observerOptions = {
    childList: true,
    // Omit (or set to false) to observe only changes to the parent node
    subtree: true
  }

  const observer = new MutationObserver(productsChange);
  observer.observe(productsDiv, observerOptions);

// ---------------------------------- Filter products end ----------------------------------

}
