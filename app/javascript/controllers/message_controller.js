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
}
