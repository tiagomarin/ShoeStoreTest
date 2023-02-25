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
