import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["replyBtn", "replyRoom"];

  emerge() {
    this.element.classList.toggle("bg-gray-300");
    this.replyBtnTarget.classList.toggle("invisible");
    // this.replyRoomTargrt.classList.toggle("invisible");
  }

  fade() {
    this.element.classList.toggle("bg-gray-300");
    this.replyBtnTarget.classList.toggle("invisible");
    // this.replyRoomTargrt.classList.toggle("invisible");
  }
}
