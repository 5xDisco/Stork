import consumer from "./consumer";

consumer.subscriptions.create("OnlineChannel", {
  connected() {
    console.log("OnlineChannel is connecting...");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data);
    let el = document.querySelector(`[data-id='${data.id}']`);
    console.log(el);

    if (data.status == "online") {
      el.classList.add("bg-green-500");
      el.classList.remove("bg-gray-300");
    } else if (data.status == "offline") {
      el.classList.add("bg-gray-300");
      el.classList.remove("bg-green-500");
    }
  },
});
