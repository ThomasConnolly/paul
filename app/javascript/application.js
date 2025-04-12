// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "trix"
import "@rails/actiontext"

// Initialize when the DOM is loaded
document.addEventListener("turbo:load", function() {
  console.log("Application JS loaded")
  
  // Initialize any JavaScript functionality here
  // For example, you might initialize tooltips:
  // var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  // tooltipTriggerList.forEach(function(tooltipTriggerEl) {
  //   new bootstrap.Tooltip(tooltipTriggerEl)
  // })
})
