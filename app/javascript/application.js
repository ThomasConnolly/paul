// Import libraries via import maps instead
import "@hotwired/turbo-rails"
import "@hotwired/stimulus"
import "./controllers"
import "bootstrap"
import "flatpickr"
import "trix"
import "@rails/actiontext"

// Initialize components after page load
document.addEventListener("DOMContentLoaded", function() {
  // Initialize datepickers
  flatpickr(".datepicker", {
    // options
  });
});