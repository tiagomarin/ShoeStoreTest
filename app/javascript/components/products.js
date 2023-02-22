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

       // add valid li element to the list of applied filters if it doesn't already exist
       if (colorFilter !== "" && !filterExists(colorFilter)) {
        addFilterLi(colorFilter)
      }
      if (brandFilter !== "" && !filterExists(brandFilter)) {
        addFilterLi(brandFilter)
      }
      if (categoryFilter !== "" && !filterExists(categoryFilter)) {
        addFilterLi(categoryFilter)
      }

      // add query to be used in the search form as query when sending a reqquest that filters results
      let hiddenQuery = document.querySelectorAll(".add_query")
      hiddenQuery.forEach((element) => {
        element.value = query
      })
      
      /* 
      add color filter applied to be used in the search when
      sending a reqquest that filters results based on color
      */
      let appliedColorFilters = document.querySelectorAll(".add_color_filters_applied")
      appliedColorFilters.forEach((element) => {
        if (element.nextElementSibling.innerText.toLowerCase() !== colorFilter){
          element.value += ` ${colorFilter}`
        }
      })
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
