
document.addEventListener("turbolinks:load", function() {

  $(".steps-text-field").on("input",function (e) {
    $(".new-name-box").html($(this).val());
  });
});