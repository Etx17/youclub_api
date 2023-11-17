import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="club-card"
export default class extends Controller {
  static values = { url: String }

  connect() {
    this.element.style.transition = 'transform 0.2s';
  }

  hover() {
    this.element.style.transform = 'scale(1.03)';
  }

  reset() {
    this.element.style.transform = 'scale(1)';
  }

  goToClub() {
    window.location.href = this.urlValue;
  }
}
