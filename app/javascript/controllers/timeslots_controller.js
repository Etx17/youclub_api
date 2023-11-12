import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template", "container"]

  addTimeSlot(event) {
    event.preventDefault();
    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime());
    this.containerTarget.insertAdjacentHTML('beforeend', content);
  }

  removeTimeSlot(event) {
    event.preventDefault();
    let wrapper = event.target.closest(".time-slot-fields");
    if (wrapper) {
      wrapper.remove();
    }
  }

  toggleDestroy(event) {
    event.preventDefault();
    let wrapper = event.target.closest(".time-slot-fields");
    if (wrapper && confirm("Êtes-vous sûr de vouloir supprimer ce créneau horaire ?")) {
      let destroyInput = wrapper.querySelector("input[type=hidden][name*='_destroy']");
      if (destroyInput) {
        destroyInput.value = destroyInput.value === "1" ? "0" : "1";
        wrapper.classList.toggle("d-none", destroyInput.value === "1");
        console.log("Toggled _destroy for:", destroyInput.name, "New value:", destroyInput.value);
      }
    }
  }



}
