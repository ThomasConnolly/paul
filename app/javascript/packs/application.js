// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import "core-js/stable";
import "regenerator-runtime/runtime";
require("@rails/ujs").start()
require("turbolinks").start()
require("trix")
require("@rails/actiontext")
var jQuery = require("jquery")

global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

require("bootstrap")
//require("@rails/activestorage").start()
//require("channels")
require("src/application.scss")


window.Rails = Rails

import { strictEqual } from "assert";


document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})

document.addEventListener("turbolinks:load",() => {
  flatpickr("[data-behavior='flatpickr']",
  )
})


//document.addEventListener("turbolinks:load", () => {
//  $('#myModal').modal('show')
//})

document.addEventListener("click", () => {
  $('#bcpModal').modal('show')
})

