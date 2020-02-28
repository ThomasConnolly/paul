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
import jQuery from "jquery";
window.$ = window.jQuery = jQuery;

import 'bootstrap/dist/js/bootstrap';
import "src/application.scss";
//require("@rails/activestorage").start()
//require("channels")
// Make $ available on the window object
// for SJR views and jQuery plugins
// that may expect `$` to be globally available.
environment.loaders.append('expose', {
  test: require.resolve('jquery'),
  use: [
    {
      loader: 'expose-loader',
      options: 'jQuery',
    },
    {
      loader: 'expose-loader',
      options: '$',
    },
  ],
});

window.Rails = Rails

import { strictEqual } from "assert";


document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})

document.addEventListener("turbolinks:load", () => {
  flatpickr("[data-behavior='flatpickr']"
  )
})


//document.addEventListener("turbolinks:load", () => {
//  $('#myModal').modal('show')
//})

document.addEventListener("click", () => {
  $('#bcpModal').modal('show')
})

