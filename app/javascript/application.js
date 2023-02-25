// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./components/addNewProductBrandCategoryPopUp"
import "./components/products"
import "controllers"

let lastScrollTop = 32;

window.addEventListener("scroll", () => {
  const currentScrollTop = window.pageYOffset || document.documentElement.scrollTop;
  const nav = document.querySelector("nav")

  if (currentScrollTop > lastScrollTop) {
    nav.classList.add("sticky", window.scrollY > 0);
  } else {
    nav.classList.remove("sticky", window.scrollY > 0);
  }

  lastScrollTop = currentScrollTop <= 32 ? 32 : currentScrollTop;
});

/* ================================================= */

function toggleDivs() {
  let div1 = document.getElementById("headline-container__product-1");
  let div2 = document.getElementById("headline-container__product-2");

  if (div1.style.display !== "none") {
    div1.style.display = "none";
    div2.style.display = "flex";
  } else {
    div1.style.display = "flex";
    div2.style.display = "none";
  }
}
setInterval(toggleDivs, 3000);

/* ================================================= */

window.addEventListener("click", (event) => {
  if (event.target.className === "order-container__arrow-down-div" || event.target.className === "order-container__arrow-down-div show") {
    event.target.nextElementSibling.classList.toggle("show");
    event.target.classList.toggle("show");
  }

  if (event.target.innerHTML === "Do you have a promo code?" || event.target.className === "order-container-icon") {
    event.target.parentElement.nextElementSibling.classList.toggle("show");
    event.target.parentElement.classList.toggle("show");
  }
})

/* ================================================= */

window.addEventListener("click", (event) => {
  if (event.target.className === "order-container__coupons-applied" || event.target.className === "order-container__coupons-applied show") {
    event.target.nextElementSibling.classList.toggle("show");
    event.target.classList.toggle("show");
  }

  if (event.target.innerHTML === "Coupons Applied" || event.target.id === "order-container__promo-icon") {
    event.target.parentElement.nextElementSibling.classList.toggle("show");
    event.target.parentElement.classList.toggle("show");
  }
})

/* ================================================= */

window.addEventListener("click", (event) => {
  // clicked on a button to add a filter
  if (event.target.className === "options-to-filter") {
    document.querySelectorAll(".applied-filters").forEach((e) => {
      if (e.firstElementChild.firstElementChild.value === event.target.value) {
        e.classList.toggle("active");
      }
    })
    event.target.classList.toggle("active");
  }
  // // change value and text of the button when a min price filter is applied
  // if (event.target.id = "min_price-filter-btn") {
  //   let minPriceApplied = document.getElementById("min-price-filter-applied")
  //   minPriceApplied.value = event.previousElementSibling.value;
  //   minPriceApplied.innerHTML = event.previousElementSibling.value;
  //   minPriceApplied.classList.toggle("active")
  // }
  // // change value and text of the button when a max price filter is applied
  // if (event.target.id = "max_price-filter-btn") {
  //   let maxPriceApplied = document.getElementById("max-price-filter-applied")
  //   maxPriceApplied.value = event.previousElementSibling.value;
  //   maxPriceApplied.innerHTML = event.previousElementSibling.value;
  //   maxPriceApplied.classList.toggle("active")
  // }
  
  // clicked on a button to remove a filter
  if (event.target.className === "applied-filters-btns") {
    document.querySelectorAll(".options-to-filter.active").forEach((e) => {
      if (e.value === event.target.value) {
        e.classList.toggle("active");
      }
    })
    event.target.parentElement.parentElement.classList.toggle("active");
  }
  // // clicked on button to remove min price filter applied
  // if (event.target.id === "min-price-filter-applied-btn") {
  //   let minPriceApplied = document.getElementById("min-price-filter-applied")
  //   minPriceApplied.classList.toggle("active")
  // }
  // // clicked on button to remove max price filter applied
  // if (event.target.id === "max-price-filter-applied-btn") {
  //   let maxPriceApplied = document.getElementById("max-price-filter-applied")
  //   maxPriceApplied.classList.toggle("active")
  // }

  // clicked on a button to clear all filter
  if (event.target.id === "clear_filters") {
    console.log("clicked on:   :", event.target)
    document.querySelectorAll(".applied-filters active").forEach((e) => {
      e.classList.toggle("active");
    })
    document.querySelectorAll(".options-to-filter.active").forEach((e) => {
        e.classList.toggle("active");
    })
  }
})

