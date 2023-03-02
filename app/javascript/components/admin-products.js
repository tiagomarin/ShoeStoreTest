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
  // open edit product name input
  if(event.target.className === "admin-products-table__edit-icon name-edit") {
    event.target.parentElement.nextElementSibling.classList.add("show")
    event.target.parentElement.classList.add("hide")
  }

  // close edit product name input
  if(event.target.className === "name-submit" || event.keyCode === 13) {
    console.log('its here')
    event.target.parentElement.nextElementSibling.classList.remove("show")
    event.target.parentElement.classList.remove("hide")
  }

  // open edit product gender input
  if(event.target.className === "admin-products-table__edit-icon gender-edit") {
    event.target.parentElement.nextElementSibling.classList.add("show")
    event.target.parentElement.classList.add("hide")
  }

  // close edit product gender input
  if(event.target.className === "gender-submit") {
    event.target.parentElement.nextElementSibling.classList.remove("show")
    event.target.parentElement.classList.remove("hide")
  }

  // open edit product size input
  if(event.target.className === "admin-products-table__edit-icon size-edit") {
    event.target.parentElement.nextElementSibling.classList.add("show")
    event.target.parentElement.classList.add("hide")
  }

  // close edit product size input
  if(event.target.className === "size-submit") {
    event.target.parentElement.nextElementSibling.classList.remove("show")
    event.target.parentElement.classList.remove("hide")
  }

  // open edit product color input
  if(event.target.className === "admin-products-table__edit-icon color-edit") {
    event.target.parentElement.nextElementSibling.classList.add("show")
    event.target.parentElement.classList.add("hide")
  }

  // close edit product color input
  if(event.target.className === "size-submit") {
    event.target.parentElement.nextElementSibling.classList.remove("show")
    event.target.parentElement.classList.remove("hide")
  }

  // open edit product quantity input
  if(event.target.className === "admin-products-table__edit-icon quantity-edit") {
    event.target.parentElement.nextElementSibling.classList.add("show")
    event.target.parentElement.classList.add("hide")
  }

  // close edit product quantity input
  if(event.target.className === "quantity-submit" || event.keyCode === 13) {
    event.target.parentElement.nextElementSibling.classList.remove("show")
    event.target.parentElement.classList.remove("hide")
  }

  // open edit product price input
  if(event.target.className === "admin-products-table__edit-icon price-edit") {
    event.target.parentElement.nextElementSibling.classList.add("show")
    event.target.parentElement.classList.add("hide")
  }

  // close edit product price input
  if(event.target.className === "price-submit" || event.keyCode === 13) {
    event.target.parentElement.nextElementSibling.classList.remove("show")
    event.target.parentElement.classList.remove("hide")
  }

  // open edit product brand input
  if(event.target.className === "admin-products-table__edit-icon brand-edit") {
    event.target.parentElement.nextElementSibling.classList.add("show")
    event.target.parentElement.classList.add("hide")
  }

  // close edit product brand input
  if(event.target.className === "brand-submit") {
    event.target.parentElement.nextElementSibling.classList.remove("show")
    event.target.parentElement.classList.remove("hide")
  }

  // open edit product image input
  if(event.target.className === "admin-products-table__img image-image") {
    event.target.parentElement.nextElementSibling.classList.add("show")
  }
})
