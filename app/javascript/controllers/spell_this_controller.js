import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="spell-this"
export default class extends Controller {
  connect() {
    console.log('spell this is ok')
  }
}
