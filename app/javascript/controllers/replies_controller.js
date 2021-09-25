import { Controller } from "stimulus";
import consumer from "../channels/consumer";
import axios from "../lib/http/axios";

export default class extends Controller {
  static targets = ["replyBox"];

  connect() {
    console.log(
      'Will create subscription to: channel: "ReplyChannel" channel_id: ' +
        this.data.get("id")
    );

    this.channel = consumer.subscriptions.create(
      {
        channel: "ReplyChannel",
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
    console.log("hi");
  }

  _cableDisconnected() {}

  _cableReceived(data) {
    console.log(data);
    if (data.message) {
      this.replyBoxTarget.insertAdjacentHTML("beforeend", data.message);
    }
  }

  sendReply(e) {
    e.preventDefault();
    const messageId = this.data.get("id");
    if (e.target[1].value != "") {
      const params = { content: e.target[1].value };
      axios.post(`/messages/${messageId}/replies`, params);
      e.target[1].value = "";
    }
  }
}
