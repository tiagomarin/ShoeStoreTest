window.addEventListener("click", (event) => {
  // Show and hide modal for adding new brand and new category
const brandModal = document.querySelector("#brand-modal-wrapper")
const categoryModal = document.querySelector("#category-modal-wrapper")
  if (event.target.innerHTML === "New Brand") {
    brandModal.classList.toggle("show")
  }
  if (event.target.innerHTML === "New Category") {
    categoryModal.classList.toggle("show")
  }
  if (event.target.id === "brand-modal-wrapper") {
    brandModal.classList.remove("show")
  }
  if (event.target.id === "category-modal-wrapper") {
    categoryModal.classList.remove("show")
  }

  if(event.target.className === "close-modal") {
    categoryModal.classList.remove("show")
    brandModal.classList.remove("show")
  }
})


