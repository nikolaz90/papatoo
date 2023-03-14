import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="messages"
export default class extends Controller {

  static targets = ['container']
  static values = {
    userName: String,
    convo: Number
  }

  fetchedMsgs = []

  connect() {
    setInterval(() => {
      this.fetchMsgsFromServer()
    }, 5000);
    this.containerTarget.scrollTo(0, this.containerTarget.scrollHeight);
    window.scrollTo(0, document.body.scrollHeight);
  }

  fetchMsgsFromServer() {
    fetch(`/convos/${this.convoValue}/messages.json`)
      .then(response => response.json())
      .then(data => {
        this.fetchedMsgs = data.map((item) => item.html)
        this.updateAllMsgs()
      })
  }

  updateAllMsgs(){
    this.containerTarget.innerHTML = this.fetchedMsgs.join('')
  }

  afterSend() {
    console.log('sending...');
  }
}
