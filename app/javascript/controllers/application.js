import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

// Flatpickr initialization
document.addEventListener("DOMContentLoaded", function() {
    // Initialize all flatpickr elements
    const datepickers = document.querySelectorAll('.datepicker');
    if (datepickers.length > 0) {
      datepickers.forEach(function(el) {
        flatpickr(el, {
          dateFormat: "Y-m-d"
        });
      });
      console.log("Flatpickr initialized on", datepickers.length, "elements");
    }
  });
