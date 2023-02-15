const brandModal = document.querySelector("#brand-modal")
const categoryModal = document.querySelector("#category-modal")

document.querySelectorAll(".open-modal").forEach( button => 
  button.addEventListener( "click" , (e) => {
    if (e.target.innerHTML === "New Brand") {
      brandModal.classList.add("show")
    }
    if (e.target.innerHTML === "New Category") {
      categoryModal.classList.add("show")
    }
  })
)

document.querySelectorAll(".close-modal").forEach( button => 
  button.addEventListener( "click" , (e) => {
    if (e.target.parentElement.id === "brand-modal") {
      brandModal.classList.remove("show")
    }
    if (e.target.parentElement.id === "category-modal") {
      categoryModal.classList.remove("show")
    }
  })
)



