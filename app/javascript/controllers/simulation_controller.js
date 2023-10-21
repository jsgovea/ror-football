import { Controller } from "@hotwired/stimulus"
import consumer from '../channels/consumer'

// Connects to data-controller="simulation"
export default class extends Controller {

  static targets = ["updates", "input", "messages"]

  connect() {
    this.channel = consumer.subscriptions.create("SimulationChannel", {
      connected: this._cableConnected.bind(this),
      disconnected: this._cableDisconnected.bind(this),
      received: this._cableReceived.bind(this)
    })
  }

  clearInput() {
    this.inputTarget.value = '';
  }

  _cableConnected() {
    // Called when the subscription is ready for use on the server
  }

  _cableDisconnected() {
    // Called when the subscription has been terminated by the server
  }

  _cableReceived(data) {
    // Called when there's incoming data on the websocket for this channel
    this.messagesTarget.innerHTML += data.message;
  }
}
