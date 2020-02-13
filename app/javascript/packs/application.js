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
//require("@rails/activestorage").start()
//require("channels")

window.Rails = Rails

import 'bootstrap/dist/js/bootstrap';
import "src/application";

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})


document.addEventListener("turbolinks:load", () => {
  $('#myModal').modal('show')
})

