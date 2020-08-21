import flatpickr from "flatpickr";
document.addEventListener('turbolinks:load', function() {
  const pickers = document.querySelectorAll(".datepicker")
  if(pickers != null) {
    flatpickr(".datepicker", {});
  }
});
