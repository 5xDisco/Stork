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

  _cableConnected() {}

  _cableDisconnected() {}

  _cableReceived(data) {
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
      const params = { content: e.target[1].value };
      axios.post(`/spaces/${spaceId}/channels/${channelId}/messages`, params);

      console.log(this.inputTarget.value)
      this.inputTarget.value = "";
    }
  }

  scrollToBottom() {
    const { scrollHeight, clientHeight } = this.messagesTarget;
    if (scrollHeight >= clientHeight) {
      this.messagesTarget.scrollTop = scrollHeight - clientHeight;
    }
  }
}
