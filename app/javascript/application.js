// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./components/addNewProductBrandCategoryPopUp"
import "./components/products"
import "./components/products-filter"
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

if (window.location.pathname === '/') {
  setInterval(() => {
    let headline_product_1 = document.getElementById("headline-container__product-1");
    let headline_product_2 = document.getElementById("headline-container__product-2");
    
    if (headline_product_1.style.display !== "none") {
      headline_product_1.style.display = "none";
      headline_product_2.style.display = "flex";
    } else {
      headline_product_1.style.display = "flex";
      headline_product_2.style.display = "none";
    }
  }, 3000);
}

/* ================================================= */

window.addEventListener("click", (event) => {
  /* Show and apply new coupons */
  if(event.target.className === "order-container__arrow-down-div" || event.target.className === "order-container__arrow-down-div show") {
    event.target.nextElementSibling.classList.toggle("show");
    event.target.classList.toggle("show");
  }

  if (event.target.innerHTML === "Do you have a promo code?" || event.target.className === "order-container-icon") {
    event.target.parentElement.nextElementSibling.classList.toggle("show");
    event.target.parentElement.classList.toggle("show");
  }

  /* Show coupons applied */
  if(event.target.className === "order-container__coupons-applied" || event.target.className === "order-container__coupons-applied show") {
    event.target.nextElementSibling.classList.toggle("show");
    event.target.classList.toggle("show");
  }

  if (event.target.innerHTML === "Coupons Applied" || event.target.id === "order-container__promo-icon") {
    event.target.parentElement.nextElementSibling.classList.toggle("show");
    event.target.parentElement.classList.toggle("show");
  }

  /* Show footer accordions */
  if(event.target.className === "footer-container__arrow-down-div" || event.target.className === "footer-container__arrow-down-div show") {
    event.target.nextElementSibling.classList.toggle("show");
    event.target.lastElementChild.classList.toggle("show");
  }

  if(event.target.className === "footer-container__accordion" || event.target.className === "footer-container__accordion show") {
    event.target.parentElement.nextElementSibling.classList.toggle("show");
    event.target.nextElementSibling.classList.toggle("show");
  }

  if(event.target.className === "footer-container-icon" || event.target.className === "footer-container-icon show") {
    event.target.parentElement.nextElementSibling.classList.toggle("show");
    event.target.classList.toggle("show");
  }
})

/* ------------------ */
