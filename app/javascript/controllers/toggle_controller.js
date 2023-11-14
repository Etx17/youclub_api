import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["toggleable"]

  toggle() {
    this.toggleableTargets.forEach((el) => {
      el.classList.toggle('d-none', this.element.checked);
    });
  }
}
