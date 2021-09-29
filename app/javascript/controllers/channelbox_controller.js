import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["page"];
  close() {
    this.pageTarget.remove();
    console.log(`destory self`);
  }
}
