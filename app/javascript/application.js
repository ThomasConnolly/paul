// Entry point for build script in package.json
import "@hotwired/turbo-rails"
import "trix"
import "@rails/actiontext"
import * as bootstrap from "bootstrap"
import "./controllers"

document.addEventListener("turbo:load", () => {

  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })

  let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
  let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
  })
})