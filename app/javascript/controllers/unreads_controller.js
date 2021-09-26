import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  connect() {
    this.username = document
      .querySelector("meta[name='nickname']")
      .getAttribute("content");

    console.log(
      'Will create subscription to: channel: "UnreadsChannel" channel_id: ' +
        this.data.get("channelid")
    );

    this.channel = consumer.subscriptions.create(
      {
        channel: "UnreadsChannel",
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
    consumer.subscriptions.remove(this.channel);
  }

  _cableConnected() {}

  _cableDisconnected() {}

  _cableReceived(data) {
    console.log(data);

    let channelId = this.data.get("channelid");
    let userId = this.data.get("userid");

    if (data.channel_id == channelId && data.user_id != userId) {
      let count = parseInt(this.element.textContent);
      this.element.classList.remove("invisible");
      this.element.classList.add("visible");
      this.element.textContent = count + 1;
    }

    if (data.mentions && data.mentions.includes(this.username)) {
      this.notify(data.content);
    }
  }

  notify(message) {
    if (!("Notification" in window)) {
    } else if (Notification.permission === "granted") {
      var notification = new Notification(message);
    } else {
      console.log("Can't call this mathod");
    }
  }
}
