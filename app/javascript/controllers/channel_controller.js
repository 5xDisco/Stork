import { Controller } from "stimulus";
import consumer from "../channels/consumer";
import axios from "../lib/http/axios";

export default class extends Controller {
  static targets = ["messages"];

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
    this.scrollToBottom();
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
    console.log(data);
    console.log("_cableReceived");
    if (data.message) {
      this.messagesTarget.insertAdjacentHTML("beforeend", data.message);

      if (!document.hidden) {
        this.channel.perform("touch");
      }
    }
    this.scrollToBottom();
  }

  sendMessage(e) {
    e.preventDefault();
    const channelId = this.data.get("channelid");
    const spaceId = this.data.get("spaceid");

    if (e.target[1].value != "") {
      console.log(e.target[1].value);
      const params = { content: e.target[1].value };
      axios.post(`/spaces/${spaceId}/channels/${channelId}/messages`, params);

      setTimeout(() => {
        e.target[2].removeAttribute("disabled");
      }, 200);

      e.target[1].value = "";
    } else {
      e.target[2].getAttribute("disabled");
    }
  }

  scrollToBottom() {
    const { scrollHeight, clientHeight } = this.messagesTarget;
    if (scrollHeight >= clientHeight) {
      this.messagesTarget.scrollTop = scrollHeight - clientHeight;
    }
  }
}
