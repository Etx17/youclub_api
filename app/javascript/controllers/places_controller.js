// This controller's purpose is to handle addresses suggestions on adress forms.
// Refer to https://gorails.com/episodes/google-maps-places-autocomplete-with-rails for usage tutorial
// Google's documentation: https://developers.google.com/maps/documentation/javascript/places-autocomplete#style_autocomplete

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "field", "latitude", "longitude", "zipcode", "city", "country", "map" ]
  static values = ["latitude", "longitude"]

  connect() {
    if (typeof(google) !== 'undefined') {
      // Check if the user has already visited and submitted their location
      if (!localStorage.getItem('locationSubmitted')) {
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(
            (position) => {
              this.reverseGeocodeAndSubmit(position.coords.latitude, position.coords.longitude);
            },
            () => {
              this.initMap(); // Fallback to default if user denies geolocation
            }
          );
        } else {
          // Geolocation is not supported by this browser, use default location
          this.initMap();
        }
      } else {
        this.initMap(); // Initialize the map normally if location has already been submitted
      }
    }
  }

  initMap(lat = 48.8566, lng = 2.3522) { // Default to Paris coordinates
    console.log("initiating map");

    const mapOptions = {
      center: new google.maps.LatLng(lat, lng),
      zoom: 12,
      styles: [
        {
          featureType: "poi",
          stylers: [{ visibility: "off" }]  // Hides points of interest
        },
        {
          featureType: "transit",
          stylers: [{ visibility: "off" }]  // Hides transit lines and stations
        },
      ]
    };

    this.map = new google.maps.Map(this.mapTarget, mapOptions);

    this.marker = new google.maps.Marker({
      map: this.map,
      visible: false // The marker will be made visible after a click event
    });

    console.log("map initiated");

    this.map.addListener('click', (event) => {
      this.geocodeLatLng(event.latLng);
    });
  }

  reverseGeocodeAndSubmit(lat, lng) {
    const geocoder = new google.maps.Geocoder();
    geocoder.geocode({ 'location': { lat: lat, lng: lng } }, (results, status) => {
      if (status === 'OK') {
        if (results[0]) {
          let postalCode = this.extractPostalCode(results);
          if (postalCode) {
            this.setZipcodeAndFlag(postalCode);
          } else {
            console.error('No postal code found');
          }
        } else {
          console.error('No results found');
        }
      } else {
        console.error('Geocoder failed due to: ' + status);
      }
    });
  }

  extractPostalCode(results) {
    for (const component of results[0].address_components) {
      if (component.types.includes('postal_code')) {
        return component.long_name;
      }
    }
    return null;
  }

  setZipcodeAndFlag(postalCode) {
    this.zipcodeTarget.value = postalCode;
    localStorage.setItem('locationSubmitted', 'true');
    this.submitForm();
  }

  submitForm() {
    const form = this.zipcodeTarget.closest('form');
    if (form) {
      form.submit();
    }
  }

  geocodeLatLng(latLng) {
    const geocoder = new google.maps.Geocoder();
    geocoder.geocode({ 'location': latLng }, (results, status) => {
      if (status === 'OK') {
        if (results[0]) {
          let postalCode = null;
          // Loop through the address components to find the postal code
          for (const component of results[0].address_components) {
            if (component.types.includes('postal_code')) {
              postalCode = component.long_name;
              break;
            }
          }
          if (postalCode) {
            console.log('Postal Code:', postalCode);
            this.zipcodeTarget.textContent = postalCode; // Assuming you want to display the postal code in a div or span
            this.zipcodeTarget.value = postalCode;
            // Set the marker position and make it visible
            this.marker.setPosition(latLng);
            this.marker.setVisible(true);

          } else {
            console.log('No postal code found');
            this.marker.setVisible(false); // Hide the marker if no postal code is found
          }
        } else {
          console.log('No results found');
          this.marker.setVisible(false); // Hide the marker if no results are found
        }
      } else {
        console.log('Geocoder failed due to: ' + status);
        this.marker.setVisible(false); // Hide the marker if geocoder fails
      }
    });
  }
}