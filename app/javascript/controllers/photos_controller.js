import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo"
export default class extends Controller {
  static targets = ["photo", "input", "deleteButton"];

  connect() {
    this.toggleElements();
  }

  toggleElements() {
    const photoAttached = this.photoTarget.src !== '';
    this.photoTarget.style.display = photoAttached ? 'block' : 'none';
    this.inputTarget.style.display = photoAttached ? 'none' : 'block';
  }

  deletePhoto(event) {
    event.preventDefault(); // Prevent default form submission
    const photoId = this.data.get("id"); // Assuming you have the photo's ID
    fetch(`/activities/${photoId}/remove_image`, {
      method: 'DELETE',
      headers: {
        'X-CSRF-Token': document.querySelector("[name='csrf-token']").content,
        'Content-Type': 'application/json'
      },
      credentials: 'same-origin'
    }).then(response => {
      if (response.ok) {
        this.deleteSuccess();
      } else {
        // Handle errors
        console.error('Deletion failed');
      }
    }).catch(error => console.error('Error:', error));
  }

  deleteSuccess() {
    this.photoTarget.src = '';
    this.toggleElements();
  }
}
