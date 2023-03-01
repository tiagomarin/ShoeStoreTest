window.addEventListener("click", (event) => {
  // open delete product modal
  console.log("clicked on: => ",event.target);
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
