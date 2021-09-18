jQuery(function () {
  $(".steps-text-field").on("input", function (e) {
    $(".new-name-box").html($(this).val());
  });
});

// document.addEventListener("turbolinks:load", () => {
//   const form = document.querySelector(".stepsForm");
//   console.log(form);
//   const error = document.querySelector(".steps-error-explanation");
//   form.addEventListener("submit", (e) => {
//     const name = e.target[1].innerHTML;
//     if (!name) {
//       error.classList.remove("invisible");
//       error.classList.add("visible");
//     } else {
//       error.classList.remove("visible");
//       error.classList.add("invisible");
//     }
//   });
// });
