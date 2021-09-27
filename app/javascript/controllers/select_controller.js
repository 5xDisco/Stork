import { Controller } from "stimulus";
import $ from "jquery";
import "select2";

export default class extends Controller {
  static targets = ["formselect"];

  connect() {
    $(function () {
      $("#user_select").select2({
        placeholder: "輸入欲邀請成員電子信箱",
      });
    });
  }
}
