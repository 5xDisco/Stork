jQuery(function () {
  $(".steps-one-text-field").on("input", function (e) {
    $(".new-name").html($(this).val());
  });
});
