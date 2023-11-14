import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toggleable", "checkbox"]

  connect() {
    this.updateVisibility();
  }

  toggle() {
    this.updateVisibility();
  }

  updateVisibility() {
    const isChecked = this.checkboxTarget.checked;
    this.toggleableTargets.forEach((el) => {
      el.classList.toggle('d-none', isChecked);
    });
  }
}
