import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="trainers"
export default class extends Controller {
  static targets = ["template", "container"]

  addTrainer(event) {
    event.preventDefault();
    // Remplacez NEW_RECORD par un timestamp pour créer un index unique
    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime());
    this.containerTarget.insertAdjacentHTML('beforeend', content);
  }

  removeTrainer(event) {
    event.preventDefault();
    let wrapper = event.target.closest(".trainer-fields");
    if (wrapper) {
      wrapper.remove();
    }
  }


  toggleDestroy(event) {
    event.preventDefault();
    let wrapper = event.target.closest(".trainer-fields");
    if (wrapper && confirm("Êtes-vous sûr de vouloir supprimer cet entraîneur ?")) {
      let destroyInput = wrapper.querySelector("input[type=hidden][name*='_destroy']");
      if (destroyInput) {
        destroyInput.value = destroyInput.value === "1" ? "0" : "1";
        wrapper.classList.toggle("d-none", destroyInput.value === "1");
      }
    }
  }
}
