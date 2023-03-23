window.addEventListener("click", (event) => {
  // Show and hide modal for adding new brand and new category
const brandModal = document.querySelector("#brand-modal")
const categoryModal = document.querySelector("#category-modal")
  if (event.target.innerHTML === "New Brand") {
    brandModal.classList.toggle("show")
  }
  if (event.target.innerHTML === "New Category") {
    categoryModal.classList.toggle("show")
  }
  if (event.target.parentElement.id === "brand-modal") {
    brandModal.classList.remove("show")
  }
  if (event.target.parentElement.id === "category-modal") {
    categoryModal.classList.remove("show")
  }
})


