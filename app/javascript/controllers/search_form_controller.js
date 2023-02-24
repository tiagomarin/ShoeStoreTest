import { Controller } from "@hotwired/stimulus"
import productsController from "../components/products"

// Connects to data-controller="search-form"
export default class extends Controller {
  static targets = [ "filterByColor" ]
  static values = { query: String, color_filter: String }

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.element.requestSubmit();
      productsController()
    }, 200)
  }
}
