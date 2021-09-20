import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  connect() {
    console.log(
      'Will create subscription to: channel: "UnreadsChannel" channel_id: ' +
        this.data.get("id")
    );

    this.channel = consumer.subscriptions.create(
      {
        channel: "UnreadsChannel",
        channel_id: this.data.get("id"),
      },
      {
        connected: this._cableConnected.bind(this),
        disconnected: this._cableDisconnected.bind(this),
        received: this._cableReceived.bind(this),
      }
    );
  }

  disconnect() {
    consumer.subscriptions.remove(this.channel);
  }

  _cableConnected() {
    console.log("_cableConnected");
  }

  _cableDisconnected() {
    console.log("_cableDisconnected");
  }

  _cableReceived(data) {
    console.log("_cableReceived");
    this.element.classList.remove("invisible");
    this.element.classList.add("visible");
    this.element.innerHTML = +this.element.innerHTML + 1;
  }
}
