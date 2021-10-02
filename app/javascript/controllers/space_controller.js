import { Controller } from "stimulus";
import $ from "jquery";
import "select2";

export default class extends Controller {
  static targets = ["formselect"];
  connect() {
    $(function () {
      $("#user_select")
        .select2({
          placeholder: "輸入欲邀請成員電子信箱",
          tags: true,
        })
        .on("select2:open", function (e) {
          $(".select2-container--open .select2-dropdown--below").css(
            "display",
            "none"
          );
        });
    });
  }
}
