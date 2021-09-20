import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static targets = ["unreadCount"];

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
    console.log(data);
    let channel_id = this.data.get("id");
    if (data.channel_id == channel_id) {
      let count = parseInt(this.unreadCountTarget.textContent);

      this.unreadCountTarget.classList.remove("invisible");
      this.unreadCountTarget.classList.add("visible");
      this.unreadCountTarget.textContent = count + 1;
    }

    if (data.mentions) {
      this.notify(data.content);
    }
  }

  notify(message) {
    if (!("Notification" in window)) {
      console.error("This browser does not support desktop notification");
    } else if (Notification.permission === "granted") {
      var notification = new Notification(message);
    }
  }
}
