import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="greenbg"
export default class extends Controller {
  static targets = ["title"]
  connect() {
  }

  moveBG(e) {
    // let x = Math.round(e.clientX / 50)
    // let y = Math.round(e.clientY / 50)
    // this.titleTargets.forEach((item) => item.style.opacity = `${ y / 10}` )
  }
}
