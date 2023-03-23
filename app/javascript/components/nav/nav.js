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