import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="messages"
export default class extends Controller {

  static values = {
    userName: String,
    convo: Number
  }
  connect() {
    let fetchedMsgs = []
    setInterval(() => {
      fetch(`/convos/${this.convoValue}/messages.json`)
        .then(response => response.json())
        .then(data => {
          fetchedMsgs = data
        })
        console.log(fetchedMsgs);
      }, 5000);
  }

  afterSend() {
    console.log('sending...');
  }
}
