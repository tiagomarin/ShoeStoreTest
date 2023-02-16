// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "./components/popUp"

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
  var div1 = document.getElementById("headline-container__product-1");
  var div2 = document.getElementById("headline-container__product-2");
  
  if (div1.style.display !== "none") {
    div1.style.display = "none";
    div2.style.display = "flex";
  } else {
    div1.style.display = "flex";
    div2.style.display = "none";
  }
}

setInterval(toggleDivs, 3000);