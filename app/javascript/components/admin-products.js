window.addEventListener("click", (event) => {
  // open delete product modal
  if(event.target.className === "admin-products-table__delete-product-button") {
    event.target.nextElementSibling.classList.add("show");
  }

  if(event.target.className === "admin-products-table__delete-icon") {
    event.target.parentElement.nextElementSibling.classList.add("show");
  }
})

window.addEventListener("click", (event) => {
  // close delete product modal
  if(event.target.className === "admin-products-table__delete-product-popup-close") {
     event.target.parentElement.parentElement.classList.remove("show");
  }

  if(event.target.className === "admin-products-table__delete-product-popup-close-icon") {
    event.target.parentElement.parentElement.parentElement.classList.remove("show");
  }

  if(event.target.className === "admin-products-table__delete-product-popup-wrap show") {
    event.target.classList.remove("show");
  }
})

window.addEventListener("click", event => {
  // open edit input
  if(event.target.className === "admin-products-table__edit-icon set-edit") {
    event.target.parentElement.nextElementSibling.classList.add("show")
    event.target.parentElement.classList.add("hide")
  }

  // close edit input
  if(event.target.className === "set-submit" || event.keyCode === 13) {
    console.log('its here')
    event.target.parentElement.nextElementSibling.classList.remove("show")
    event.target.parentElement.classList.remove("hide")
  }
})
