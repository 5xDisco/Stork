import consumer from "./consumer";

consumer.subscriptions.create("OnlineChannel", {
  connected() {
    console.log("OnlineChannel is connecting...");
  },

  received(data) {
    let el = document.querySelector(`[data-id='${data.id}']`);
    if (data.status == "online") {
      el.classList.remove("bg-gray-300");
      el.classList.add("bg-green-500");
    } else if (data.status == "offline") {
      el.classList.remove("bg-green-500");
      el.classList.add("bg-gray-300");
    }
  },
});
