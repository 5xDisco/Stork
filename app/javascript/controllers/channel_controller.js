import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static targets = ["messages", "newMessage"];

  connect() {
    console.log(
      'Will create subscription to: channel: "MessageChannel" channel_id: ' +
        this.data.get("channelid")
    );

    this.channel = consumer.subscriptions.create(
      {
        channel: "MessageChannel",
        channel_id: this.data.get("channelid"),
      },
      {
        connected: this._cableConnected.bind(this),
        disconnected: this._cableDisconnected.bind(this),
        received: this._cableReceived.bind(this),
      }
    );
  }

  disconnect() {
    consumer.subscriptions.remove(this.subscription);
  }

  _cableConnected() {
    console.log("_cableConnected");
  }

  _cableDisconnected() {
    console.log("_cableDisconnected");
  }

  _cableReceived(data) {
    console.log("_cableReceived");
    console.log(data.message);
    if (data.message) {
      this.messagesTarget.insertAdjacentHTML("beforeend", data.message);
    }
  }
  clearMessage(event) {
    this.newMessageTarget.value = "";
  }
}
