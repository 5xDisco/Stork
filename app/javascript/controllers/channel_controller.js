import { Controller } from "stimulus";
import consumer from "../channels/consumer";
import axios from "../lib/http/axios";

export default class extends Controller {
  static targets = ["messages", "input"];

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
        connected: this.cableConnected.bind(this),
        disconnected: this.cableDisconnected.bind(this),
        received: this.cableReceived.bind(this),
      }
    );
  }

  disconnect() {
    consumer.subscriptions.remove(this.channel);
  }

  cableConnected() {
    console.log("_cableConnected");
  }

  cableDisconnected() {
    console.log("_cableDisconnected");
  }

  cableReceived(data) {
    console.log("_cableReceived");
    console.log(data.message);
    if (data.message) {
      this.messagesTarget.insertAdjacentHTML("beforeend", data.message);
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
