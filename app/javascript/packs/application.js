// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"
import { Application } from 'stimulus'
const application = Application.start()
autoload(controllers, application)
import "core-js/stable"
import "regenerator-runtime/runtime"
import "channels"
require("trix")
require("@rails/actiontext")
require("@rails/activestorage").start()
import jQuery from "jquery"
window.Rails = Rails
window.$ = window.jQuery = jQuery
import "controllers"
import "bootstrap/dist/js/bootstrap"
import "../src/application.scss"
import "data-confirm-modal"
import flatpickr from "flatpickr"
require("flatpickr/dist/flatpickr.css")
Rails.start()
ActiveStorage.start()


document.addEventListener("turbo:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})

document.addEventListener("turbo:load", () => {
  $(function () {
    $("#myModal").modal('show')
    })
  });

document.addEventListener("turbo:load", () => {
  flatpickr("[data-behavior='flatpickr']"
  )
});

document.addEventListener("click", () => { 
  $('#bcpModal').modal('show')
});

$(".dropdown-toggle").dropdown();
