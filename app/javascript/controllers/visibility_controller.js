import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "hideable", "deactivateable" ]

  removeFilter(event) {
    event.target.hidden = true
    this.deactivateableTargets.forEach((el) => {
      if (el.value === event.target.value) {
        el.disabled = false
        this.element.requestSubmit();
      }
    })
  }

  unhideFilter(event) {
    this.hideableTargets.forEach((el) => {
      if (el.firstElementChild.firstElementChild.value === event.target.value) {
        el.hidden = !el.hidden
      }
    })
    event.target.disabled = true
  }
}