import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="location-form"
export default class extends Controller {
  static targets = ["form"]
  connect() {
  }

  openForm() {
    console.log("open form");
    this.formTarget.style.display = "block"
  }
}
