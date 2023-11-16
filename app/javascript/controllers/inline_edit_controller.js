import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="inline-edit"
export default class extends Controller {
  static targets = ["display", "edit"]

  toggleEdit(event) {
    event.preventDefault();
    this.displayTarget.style.display = 'none';
    this.editTarget.style.display = 'block';
  }

  toggleDisplay(event) {
    event.preventDefault();
    this.displayTarget.style.display = 'block';
    this.editTarget.style.display = 'none';
  }
}
