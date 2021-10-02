import { Controller } from "stimulus";
import consumer from "../channels/consumer";
import axios from "../lib/http/axios";

export default class extends Controller {
  static targets = ["replyBox", "replyCount", "replyNum", "input"];

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

  _cableConnected() {}

  _cableDisconnected() {}

  _cableReceived(data) {
    if (data.message) {
      this.replyBoxTarget.insertAdjacentHTML("beforeend", data.message);

      let count = parseInt(this.replyNumTarget.textContent);
      this.replyCountTarget.classList.remove("invisible");
      this.replyCountTarget.classList.add("visible");
      this.replyNumTarget.textContent = count + 1;

      let id = this.data.get("id");
      const replyBox = document.querySelector(`div[value="${id}"]`);
      let countReply = document.querySelector(`span[value="${id}"]`);
      replyBox.classList.remove("invisible");
      replyBox.classList.remove("visible");
      let countNum = parseInt(countReply.textContent);
      countReply.textContent = countNum + 1;
    }
    this.scrollToBottom();
  }

  sendReply(e) {
    e.preventDefault();
    const messageId = this.data.get("id");
    if (e.target[1].value != "") {
      const params = { content: e.target[1].value };
      axios.post(`/messages/${messageId}/replies`, params);
      this.inputTarget.value = "";
    }
  }

  closeReplyRoom() {
    this.element.remove();

    const storkPanel = document.querySelector(".stork-panel");
    storkPanel.classList.remove("w-2/3");
    storkPanel.classList.add("flex-1");
  }

  scrollToBottom() {
    const { scrollHeight, clientHeight } = this.replyBoxTarget;
    if (scrollHeight >= clientHeight) {
      this.replyBoxTarget.scrollTop = scrollHeight - clientHeight;
    }
  }
}
