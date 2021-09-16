<<<<<<< HEAD
import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static targets = ["messages"];

  connect() {
    console.log(
      'Will create subscription to: channel: "ChannelMessagesChannel" channel_id: ' +
        this.data.get("channelid")
    );

    this.channel = consumer.subscriptions.create(
      {
        channel: "ChannelMessagesChannel",
        channel_id: this.data.get("channelid"),
      },
      {
        connected: this._cableConnected.bind(this),
        disconnected: this._cableDisconnected.bind(this),
        received: this._cableReceived.bind(this),
      }
    );
  }

  _cableConnected() {
    console.log("_cableConnected");
  }

  _cableDisconnected() {
    console.log("_cableDisconnected");
  }

  _cableReceived(data) {
    console.log("_cableReceived");
    const newMessage = data.message;
    document
      .querySelector("#messages")
      .insertAdjacentHTML("beforeend", newMessage);
  }
}
=======
import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static targets = ["messages"];

  connect() {
    console.log(
      'Will create subscription to: channel: "ChannelMessagesChannel" channel_id: ' +
        this.data.get("channelid")
    );

    this.channel = consumer.subscriptions.create(
      {
        channel: "ChannelMessagesChannel",
        channel_id: this.data.get("channelid"),
      },
      {
        connected: this._cableConnected.bind(this),
        disconnected: this._cableDisconnected.bind(this),
        received: this._cableReceived.bind(this),
      }
    );
  }

  _cableConnected() {
    console.log("_cableConnected");
  }

  _cableDisconnected() {
    console.log("_cableDisconnected");
  }

  _cableReceived(data) {
    console.log("_cableReceived");
    if(data.message){
      this.messagesTarget.insertAdjacentHTML("beforeend", data.message);
    }
  }
}
>>>>>>> 52d18186cc4157bd8ff3d5c5d1751a2b4cd13a40
