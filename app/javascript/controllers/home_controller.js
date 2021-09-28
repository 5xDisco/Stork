import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["more", "lessmore"];
  click() {
    if (this.lessmoreTarget && this.moreTarget) {
      if (this.lessmoreTarget.style.display === "none") {
        this.lessmoreTarget.style.display = "inline";

        this.moreTarget.style.display = "none";
      } else {
        this.lessmoreTarget.style.display = "none";

        this.moreTarget.style.display = "inline";
      }
    }
  }
}
