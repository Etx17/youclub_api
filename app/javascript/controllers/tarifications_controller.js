import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template", "container"]

  addTarification(event) {
    event.preventDefault();
    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime());
    this.containerTarget.insertAdjacentHTML('beforeend', content);
  }

  removeTarification(event) {
    event.preventDefault();
    let wrapper = event.target.closest(".tarification-fields");
    if (wrapper) {
      wrapper.remove();
    }
  }

  toggleDestroy(event) {
    event.preventDefault();
    let wrapper = event.target.closest(".tarification-fields");
    if (wrapper) {
      if (confirm("Êtes-vous sûr de vouloir supprimer cette tarification ?")) {
        let destroyInput = wrapper.querySelector("input[type=hidden][name*='_destroy']");
        if (destroyInput) {
          destroyInput.value = destroyInput.value === "1" ? "0" : "1";
          wrapper.classList.toggle("marked-for-destruction");
          wrapper.style.display = destroyInput.value === "1" ? "none" : "block";
        }
      }
    }
  }
}
