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

  // remove li from the list of applied filters

  // ---------------------------------- Filter products begin ----------------------------------
  // UL list that will display applied filters
  const filtersApplied = document.querySelector(".products-container__applied-filters-list")


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

      // get filter applied from the url
      let sizeFiltersApplied = ""
      let colorFiltersApplied = ""
      let brandFiltersApplied = ""
      let categoryFiltersApplied = ""
      let minPriceFilterApplied = ""
      let maxPriceFilterApplied = ""

      if (search.includes("size_filters_applied")) {
        let sizeFiltersAppliedIndex = search.indexOf("size_filters_applied") + 1
        let lastSizeFilterIndex = search.indexOf("color_filters_applied") - 1
        for (let i = sizeFiltersAppliedIndex; i <= lastSizeFilterIndex; i++) {
          sizeFiltersApplied += search[i]
        }
      }

      if (search.includes("color_filters_applied")) {
        let colorFiltersAppliedIndex = search.indexOf("color_filters_applied") + 1
        let lastColorFilterIndex = search.indexOf("brand_filters_applied") - 1
        for (let i = colorFiltersAppliedIndex; i <= lastColorFilterIndex; i++) {
          colorFiltersApplied += search[i]
        }
      }

      if (search.includes("brand_filters_applied")) {
        let brandFiltersAppliedIndex = search.indexOf("brand_filters_applied") + 1
        let lastBrandFilterIndex = search.indexOf("category_filters_applied") - 1
        for (let i = brandFiltersAppliedIndex; i <= lastBrandFilterIndex; i++) {
          brandFiltersApplied += search[i]
        }
      }

      if (search.includes("category_filters_applied")) {
        let categoryFiltersAppliedIndex = search.indexOf("category_filters_applied") + 1
        let lastCategoryFilterIndex = search.indexOf("min_price_filter_applied") - 1
        for (let i = categoryFiltersAppliedIndex; i <= lastCategoryFilterIndex; i++) {
          categoryFiltersApplied += search[i]
        }
      }

      if (search.includes("min_price_filter_applied")) {
        let minPriceFilterAppliedIndex = search.indexOf("min_price_filter_applied") + 1
        minPriceFilterApplied += search[minPriceFilterAppliedIndex]
      }
      
      if (search.includes("max_price_filter_applied")) {
        let maxPriceFilterAppliedIndex = search.indexOf("max_price_filter_applied") + 1
        maxPriceFilterApplied += search[maxPriceFilterAppliedIndex]
      }

      // Add filter to the list of applied filters
      function addFilterLi(filter, filterType) {
        let li = document.createElement("li")
        li.classList.add("products-container__header-filters-applied-item")

        // create form
        let form = document.createElement("form")
        form.setAttribute("data-controller", "search-form")
        form.setAttribute("data-turbo-frame", "products")
        form.setAttribute("data-turbo-action", "advance")
        form.setAttribute("action", "/products")
        form.setAttribute("accept-charset", "UTF-8")
        form.setAttribute("method", "get")

        // create hidden inputs
        let hiddenQueries = ["query", "size_filters_applied", "color_filters_applied", "brand_filters_applied", "category_filters_applied", "min_price_filter_applied", "max_price_filter_applied"]
        hiddenQueries.forEach((e) => {
          let value = ''
          switch (e) {
            case "query":
              value = query
              break
            case "size_filters_applied":
              value = sizeFiltersApplied
              break
            case "color_filters_applied":
              value = colorFiltersApplied
              break
            case "brand_filters_applied":
              value = brandFiltersApplied
              break
            case "category_filters_applied":
              value = categoryFiltersApplied
              break
            case "min_price_filter_applied":
              value = minPriceFilterApplied
              break
            case "max_price_filter_applied":
              value = maxPriceFilterApplied
              break
          }
          let hiddenQuery = document.createElement("input")
          hiddenQuery.classList.add(`add_${e}`)
          hiddenQuery.setAttribute("value", value)
          hiddenQuery.setAttribute("autocomplete", "off")
          hiddenQuery.setAttribute("type", "hidden")
          hiddenQuery.setAttribute("name", e)
          hiddenQuery.setAttribute("id", e)
          form.appendChild(hiddenQuery)
        })

        // append button to remove filter
        let removeFilterBtn = document.createElement("button")
        removeFilterBtn.setAttribute("name", `remove_${filterType}_filter`)
        removeFilterBtn.setAttribute("type", "submit")
        removeFilterBtn.setAttribute("value", filter)
        removeFilterBtn.setAttribute("data-action", "click->search-form#removeFilter")
        removeFilterBtn.classList.add("products-container__header-filters-applied-item-remove")
        removeFilterBtn.innerText = `${filter} x`
        form.appendChild(removeFilterBtn)

        li.appendChild(form)
        console.log("li:", li.children)
        filtersApplied.appendChild(li)
        console.log("filtersApplied:", filtersApplied.children)
      }

      // add valid li element to the list of applied filters if it doesn't already exist
      if (sizeFilter !== "" && !filterExists(sizeFilter)) { addFilterLi(sizeFilter, "size") }
      if (colorFilter !== "" && !filterExists(colorFilter)) { addFilterLi(colorFilter, "color") }
      if (brandFilter !== "" && !filterExists(brandFilter)) { addFilterLi(brandFilter, "brand") }
      if (categoryFilter !== "" && !filterExists(categoryFilter)) { addFilterLi(categoryFilter, "category") }
      if (minPriceFilter !== "" && !filterExists(minPriceFilter)) { addFilterLi(`min:${minPriceFilter}`, "min_price") }
      if (maxPriceFilter !== "" && !filterExists(maxPriceFilter)) { addFilterLi(`max:${maxPriceFilter}`, "max_price") }
      // add query to be used in the search form as query when sending a reqquest that filters results
      let hiddenQueries = document.querySelectorAll(".add_query")
      hiddenQueries.forEach((element) => {
        element.value = query
      })

      /* 
      Add filters_applied to "value" in hidden fields. These values are filters that user already applied. 
      The new filter selected will be added to the value of the hidden field (in products controller).
      */
      // check if the filter already exists in the hidden field
      function filterExistsInHiddenField(filter, hiddenField) {
        let appliedFilters = hiddenField.value.split(" ")
        if (appliedFilters.length === 0) {
          return false
        }
        return appliedFilters.includes(filter)
      }

      


      // SIZE FILTER
      const appliedSizeFilters = document.querySelectorAll(".add_size_filters_applied")
      appliedSizeFilters.forEach((element) => {
        let correctGrandParent = element.parentElement.parentElement.classList.contains("products-container__filter-sizes-item")
        let siblingHasSize = element.parentElement.lastElementChild.innerText.toLowerCase() === sizeFilter
        if (correctGrandParent &&
          !siblingHasSize &&
          sizeFilter !== "" &&
          !filterExistsInHiddenField(sizeFilter, element)) {
          element.value === "" ? element.value = `${sizeFilter}` : element.value += ` ${sizeFilter}`
        }
        if (!correctGrandParent &&
          sizeFilter !== "" &&
          !filterExistsInHiddenField(sizeFilter, element)) {
          element.value === "" ? element.value = `${sizeFilter}` : element.value += ` ${sizeFilter}`
        }
      })
      // COLOR FILTER
      const appliedColorFilters = document.querySelectorAll(".add_color_filters_applied")
      appliedColorFilters.forEach((element) => {
        let correctGrandParent = element.parentElement.parentElement.classList.contains("products-container__filter-colors-item")
        let siblingHasColor = element.parentElement.lastElementChild.innerText.toLowerCase() === colorFilter
        if (correctGrandParent &&
          !siblingHasColor &&
          colorFilter !== "" &&
          !filterExistsInHiddenField(colorFilter, element)) {
          element.value === "" ? element.value = `${colorFilter}` : element.value += ` ${colorFilter}`
        }
        if (!correctGrandParent &&
          colorFilter !== "" &&
          !filterExistsInHiddenField(colorFilter, element)) {
          element.value === "" ? element.value = `${colorFilter}` : element.value += ` ${colorFilter}`
        }
      })

      // BRAND FILTER
      const appliedBrandFilters = document.querySelectorAll(".add_brand_filters_applied")
      appliedBrandFilters.forEach((element) => {
        let correctGrandParent = element.parentElement.parentElement.classList.contains("products-container__filter-brands-item")
        let siblingHasBrand = element.parentElement.lastElementChild.innerText.toLowerCase() === brandFilter
        if (correctGrandParent &&
          !siblingHasBrand &&
          brandFilter !== "" &&
          !filterExistsInHiddenField(brandFilter, element)) {
          element.value === "" ? element.value = `${brandFilter}` : element.value += ` ${brandFilter}`
        }
        if (!correctGrandParent &&
          brandFilter !== "" &&
          !filterExistsInHiddenField(brandFilter, element)) {
          element.value === "" ? element.value = `${brandFilter}` : element.value += ` ${brandFilter}`
        }
      })
      // CATEGORY FILTER
      const appliedCategoryFilters = document.querySelectorAll(".add_category_filters_applied")
      appliedCategoryFilters.forEach((element) => {
        let correctGrandParent = element.parentElement.parentElement.classList.contains("products-container__filter-categories-item")
        let siblingHasCategory = element.parentElement.lastElementChild.innerText.toLowerCase() === categoryFilter
        if (correctGrandParent &&
          !siblingHasCategory &&
          categoryFilter !== "" &&
          !filterExistsInHiddenField(categoryFilter, element)) {
          element.value === "" ? element.value = `${categoryFilter}` : element.value += ` ${categoryFilter}`
        }
        if (!correctGrandParent &&
          categoryFilter !== "" &&
          !filterExistsInHiddenField(categoryFilter, element)) {
          element.value === "" ? element.value = `${categoryFilter}` : element.value += ` ${categoryFilter}`
        }
      })
      // MIN PRICE FILTER
      const appliedMinPriceFilters = document.querySelectorAll(".add_min_price_filter_applied")
      let min = parseInt(minPriceFilter)
      let max = 0
      if (maxPriceFilter !== "") {
        max = parseInt(maxPriceFilter)
      }
      if (min < max || max === 0) {
        appliedMinPriceFilters.forEach((element) => {
          if (!filterExistsInHiddenField(minPriceFilter, element)) {
            element.value = minPriceFilter
          }
        })
      }
      // MAX PRICE FILTER
      const appliedMaxPriceFilters = document.querySelectorAll(".add_max_price_filter_applied")
      max = parseInt(maxPriceFilter)
      min = 0
      if (minPriceFilter !== "") {
        min = parseInt(minPriceFilter)
      }
      if (max > min || min === 0) {
        appliedMaxPriceFilters.forEach((element) => {
          if (!filterExistsInHiddenField(maxPriceFilter, element)) {
            element.value = maxPriceFilter
          }
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
