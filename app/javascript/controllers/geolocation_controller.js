import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Si j'ai déja la geolocation, ne pas la redemander
    if (sessionStorage.getItem("geolocation") === "true") {
      return;
    }
    this.requestGeolocation();
  }

  requestGeolocation() {
    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(this.successCallback, this.errorCallback.bind(this));
    } else {
      alert("Geolocation is not supported by your browser.");
    }
  }

  successCallback(position) {
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;
    console.log(`Latitude: ${latitude}, Longitude: ${longitude}`);
    sessionStorage.setItem("geolocation", "true");
    // You can also send this data to your Rails server or use it in any other way you need.
  }

  errorCallback(error) {
    switch (error.code) {
      case error.PERMISSION_DENIED:
        alert("Nous avons besoin d'utiliser votre position afin de lister les clubs et activités autour de vous. Veuillez autoriser l'accès à votre position.");
        break;
      case error.POSITION_UNAVAILABLE:
        alert("Location information is unavailable.");
        break;
      case error.TIMEOUT:
        alert("The request to get user location timed out.");
        break;
      case error.UNKNOWN_ERROR:
        alert("An unknown error occurred.");
        break;
    }
  }
}
