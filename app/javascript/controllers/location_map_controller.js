import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="location-map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    console.log(this.markersValue);
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });

    this.#addMarkers();
    this.#zoomMapToMarkers();
  }

  #addMarkers() {
    this.markersValue.forEach((item) => {
      const popupDetails = new mapboxgl.Popup().setHTML(item.details_on_location_html)
      const papatooMarker = document.createElement('div')
      papatooMarker.innerHTML = item.marker_on_location_html
      new mapboxgl.Marker(papatooMarker)
        .setLngLat([ item.long, item.lat ])
        .setPopup(popupDetails)
        .addTo(this.map)
    })
  }

  #zoomMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(item => bounds.extend([ item.long, item.lat ]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 10, duration: 0 });
  }
}
