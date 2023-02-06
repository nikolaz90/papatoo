import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="location-map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });

    this.map.on('click', (e) => {
      this.#addTempMarker(e.lngLat)
      // `e.lngLat` is the longitude, latitude geographical position of the event.

      document.getElementById('info').innerHTML =
        JSON.stringify(e.lngLat.wrap());
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

  #addTempMarker(coordinates){
    // removes the previous markers (only on client side)
    this.map._markers.forEach((i) => i.remove())
    // creates temp marker on map (only on client side)
    const papatooMarker = document.createElement('div')
    papatooMarker.innerHTML = "<div class='papatoo-marker'><h3>?</h3></div>"
    new mapboxgl.Marker(papatooMarker)
      .setLngLat([ coordinates.lng, coordinates.lat ])
      .addTo(this.map)
  }

  #zoomMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(item => bounds.extend([ item.long, item.lat ]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 10, duration: 0 });
  }
}
