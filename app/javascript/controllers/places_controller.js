// This controller's purpose is to handle addresses suggestions on adress forms.
// Refer to https://gorails.com/episodes/google-maps-places-autocomplete-with-rails for usage tutorial
// Google's documentation: https://developers.google.com/maps/documentation/javascript/places-autocomplete#style_autocomplete

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "field", "latitude", "longitude", "zipcode", "city", "country", "map" ]
  static values = ["latitude", "longitude"]

  connect() {
    if (typeof(google) !== 'undefined') {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
          (position) => {
            this.initMap(position.coords.latitude, position.coords.longitude);
          },
          () => {
            this.initMap(); // Fallback to default if user denies geolocation
          }
        );
      } else {
        // Geolocation is not supported by this browser, use default location
        this.initMap();
      }
    }
  }

  initMap(lat = 48.8566, lng = 2.3522) { // Default to Paris coordinates
    console.log("initiating map");

    const mapOptions = {
      center: new google.maps.LatLng(lat, lng),
      zoom: 15,
      styles: [
        // ... your styles here ...
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


  // placeChanged() {
  //   let place = this.autocomplete.getPlace()

  //   if (!place.geometry) {
  //     window.alert(`No details available for input: ${place.name}`)
  //     return
  //   }

  //   if (place.geometry.viewport) {
  //     this.map.fitBounds(place.geometry.viewport)
  //   } else {
  //     this.map.setCenter(place.geometry.location)
  //     this.map.setZoom(15)
  //   }

  //   this.marker.setPosition(place.geometry.location)
  //   this.marker.setVisible(true)

  //   this.latitudeTarget.value = place.geometry.location.lat()
  //   this.longitudeTarget.value = place.geometry.location.lng()
  //   this.fieldTarget.value = place.name
  //   for (let component of place.address_components) {
  //     if (component.types[0] == "postal_code") {
  //       this.zipcodeTarget.value = component.long_name;
  //     }
  //     if (component.types[0] == "locality") {
  //       this.cityTarget.value = component.long_name;
  //     }
  //     if (component.types[0] == "country") {
  //       this.countryTarget.value = component.long_name;
  //     }
  //   }
  // }

  // keydown(event) {
  //   if (event.key == "Enter") {
  //     event.preventDefault()
  //   }
  // }
}
