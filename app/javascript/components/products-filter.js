window.addEventListener("click", (event) => {
  // buttons to add all filters except the price filters
  if (event.target.className === "options-to-filter") {
    document.querySelectorAll(".applied-filters").forEach((e) => {
      if (e.firstElementChild.firstElementChild.value === event.target.value) {
        e.classList.add("active");
      }
    })
    event.target.classList.add("active");
  }
  // Add a min price filter
  if (event.target.id == "min-price-filter-btn") {
    // put the value of the min price filter in the remove min price filter button
    let removeMinPrice = document.getElementById("remove-min-price-filter")
    let minPrice = document.getElementById("min_price_filter").value
    removeMinPrice.value = minPrice
    removeMinPrice.innerHTML = `min: $${minPrice}`
    // add the active class to the remove min price filter li
    let minPriceApplied = document.getElementById("min-price-filter-applied")
    minPriceApplied.classList.add("active")
  }
  // Add max price filter
  if (event.target.id == "max-price-filter-btn") {
    // put the value of the min price filter in the remove min price filter button
    let removeMaxPrice = document.getElementById("remove-max-price-filter")
    let maxPrice = document.getElementById("max_price_filter").value
    removeMaxPrice.value = maxPrice
    removeMaxPrice.innerHTML = `max: $${maxPrice}`
    // add the active class to the remove min price filter li
    let maxPriceApplied = document.getElementById("max-price-filter-applied")
    maxPriceApplied.classList.toggle("active")
  }

  // Remove a filter that is applied
  if (event.target.className === "applied-filters-btns" ||
      event.target.className === "applied-filters-btns-x") {


    document.querySelectorAll(".options-to-filter.active").forEach((e) => {
      if (e.value === event.target.value || e.value === event.target.parentElement.value) {
        e.classList.remove("active");
      }
    })
    event.target.parentElement.parentElement.classList.remove("active");
    event.target.parentElement.parentElement.parentElement.classList.remove("active");
  }

  // Clear all filter
  if (event.target.id === "clear_filters") {
    document.querySelectorAll(".applied-filters.active").forEach((e) => {
      e.classList.remove("active");
    })
    document.querySelectorAll(".options-to-filter.active").forEach((e) => {
      e.classList.remove("active");
    })
    document.querySelectorAll(".applied-filters-title").forEach((e) => {
      e.classList.remove("active");
    })
  }
})
