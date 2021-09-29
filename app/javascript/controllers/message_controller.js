import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["replyBtn", "replyRoom"];

  emerge() {
    this.replyBtnTarget.classList.toggle("invisible");
  }

  fade() {
    this.replyBtnTarget.classList.toggle("invisible");

  }
}
