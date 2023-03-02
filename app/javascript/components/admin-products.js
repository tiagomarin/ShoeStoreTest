window.addEventListener("click", (event) => {
  // open delete product modal
  if(event.target.id === "admin-products-table__delete-product-button" || 
     event.target.className === "admin-products-table__delete-icon") {
    document.getElementById("admin-products-table__delete-product-popup-wrap").classList.add("show");
  }
})

window.addEventListener("click", (event) => {
  // open delete product modal
  if( (event.target.id === "admin-products-table__delete-product-popup-wrap" &&
       event.target.id !== "admin-products-table__delete-product-popup") || 
       event.target.id === "admin-products-table__delete-product-popup-close" ||
       event.target.id === "admin-products-table__delete-product-popup-close-icon") {
    document.getElementById("admin-products-table__delete-product-popup-wrap").classList.remove("show");
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

  // open image selector
  if(event.target.className === "admin-products-table__img image-image") {
    event.target.parentElement.nextElementSibling.classList.add("show")
  }
})
