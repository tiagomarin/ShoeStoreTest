// set value of size
window.addEventListener("click", (event) => {
  if (event.target.classList.contains("products-show-container__size-available")) {
    console.log("clicked")
    document.querySelectorAll(".products-show-container__size-available.active").forEach((item) => {
      item.classList.remove("active")
    })
    event.target.classList.add("active")
    document.getElementById("order_item_size").value = event.target.innerHTML
  }
})

// update quantity
window.addEventListener("click", (event) => {
  if (event.target.classList.contains("products-show-container__quantity-btn")) {
    const quantity = document.getElementById("order_item_quantity")
    const quantityInput = document.querySelector(".products-show-container__quantity-input")
    if (event.target.id === "products-show-container__quantity-btn-minus") {
      if (parseInt(quantity.value) > 1) {
        quantity.value = parseInt(quantity.value) - 1
        quantityInput.value = parseInt(quantityInput.value) - 1
      }
    } else {
      quantity.value = parseInt(quantity.value) + 1
      quantityInput.value = parseInt(quantityInput.value) + 1
    }
  }
})

// ask to login if not logged in
window.addEventListener("click", (event) => {
  if (event.target.id === "add-to-cart-btn-unlogged") {
    if (confirm("You need to login to add item to your cart. Log in now?")) {
      window.location.href = "/users/sign_in"
    }
  }
  if (event.target.id === "add-to-favorites-btn-unlogged") {
    if (confirm("You need to login to add item to your favorite list. Log in now?")) {
      window.location.href = "/users/sign_in"
    }
  }
})

// add to favorite list

window.addEventListener("click", (e) => {
  const addForm = document.getElementById("add-to-favorites-form")
  const unFavoriteDiv = document.getElementById("products-show-container__unfavorite-div")
  unFavoriteDiv.classList.add("show")
  const favoriteDiv = document.getElementById("products-show-container__favorite-div")
  favoriteDiv.classList.remove("show")
  addForm.subtmit()
})

// event.preventDefault()
window.addEventListener("click", (e) => {
  const removeForm = document.getElementById("remove-from-favorites-form")
  const favoriteDiv = document.getElementById("products-show-container__favorite-div")
  favoriteDiv.classList.add("show")
  const unFavoriteDiv = document.getElementById("products-show-container__unfavorite-div")
  unFavoriteDiv.classList.remove("show")
  removeForm.submit()
})



