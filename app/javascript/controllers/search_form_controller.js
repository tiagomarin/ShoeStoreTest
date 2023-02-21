import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-form"
export default class extends Controller {
  static targets = [ "filterByColor" ]
  static values = { query: String, color_filter: String }

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.element.requestSubmit();
    }, 200)
  }
  
  submit() {
    this.formTarget.requestSubmit()
  }
}
