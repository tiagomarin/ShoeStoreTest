// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "./components/popUp"

let lastScrollTop = 32;
const nav = document.querySelector("nav")

window.addEventListener("scroll", () => {
  const currentScrollTop = window.pageYOffset || document.documentElement.scrollTop;

  if (currentScrollTop > lastScrollTop) {
    nav.classList.add("sticky", window.scrollY > 0);
  } else {
    nav.classList.remove("sticky", window.scrollY > 0);
  }
  
  lastScrollTop = currentScrollTop <= 32 ? 32 : currentScrollTop;
});
