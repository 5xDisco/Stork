import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["replyBtn"];

  emerge() {
    this.element.classList.toggle("bg-gray-300");
    this.replyBtnTarget.classList.toggle("invisible");
  }

  fade() {
    this.element.classList.toggle("bg-gray-300");
    this.replyBtnTarget.classList.toggle("invisible");
  }

  reply() {
    const storkPanel = document.querySelector(".stork-panel");
    const messageReplies = document.querySelector(".message-replies");

    storkPanel.classList.remove("flex-1");
    storkPanel.classList.add("w-2/3");
    messageReplies.classList.remove("hidden");
    messageReplies.classList.remove("absolute");
  }
}
