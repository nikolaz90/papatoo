import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["overlay"]

  connect() {
  }

  toggleOverlay() {
    this.overlayTarget.classList.toggle('overlay-activated')
  }
}
