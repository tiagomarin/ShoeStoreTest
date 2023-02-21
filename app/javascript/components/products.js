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


  // Watch for changes to the products container and update the DOM acconding to user filter choices

  const productsDiv = document.querySelector("#products")

  function productsChange(mutationList) {
    // only run if the products container has changed
    if (mutationList.length !== 0) {

      let search = window.location.search.split(/[?&=]/)
      console.log("search: ", search)

      let query = search[2]
      console.log("query: ", query)

      // get color filter from the url
      let color_filter = ""
      console.log("color filter exist?:", search.includes("color_filter"))
      if (search.includes("color_filter")) {
        let color_filter_index = search.indexOf("color_filter") +1
        color_filter = search[color_filter_index].toLowerCase()
        console.log("color_filter: ", color_filter)
      }

      // add color filter to the list of applied filters
      // let filtersApplied = document.querySelector(".products-container__header-filters-applied")
      // if (color_filter !== "") {
      //   let li = document.createElement("li")
      //   li.classList.add("products-container__header-filters-applied-item")
      //   li.textContent = color_filter
      //   filtersApplied.appendChild(li)
      // }

      // add query to be userd in the search form as query when sending a reqquest that filters results
      let hiddenQuery = document.querySelectorAll(".add_query")
      hiddenQuery.forEach((element) => {
        element.value = query
        console.log("element.value: ", element.value)
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
}
