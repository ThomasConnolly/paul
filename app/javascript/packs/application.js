// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import "core-js/stable";
import "regenerator-runtime/runtime";
require("turbolinks").start()
require("trix")
require("@rails/actiontext")
import jQuery from "jquery";
window.$ = window.jQuery = jQuery;
import "controllers";
import 'bootstrap';
//import 'bootstrap/dist/js/bootstrap';
import "src/application.scss";
import flatpickr from "flatpickr";
require("flatpickr/dist/flatpickr.css")
//require("@rails/activestorage").start()
//require("channels")
import Rails from '@rails/ujs';
Rails.start();
window.Rails = Rails


document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})

document.addEventListener("turbolinks:load", () => {
  $(document).ready(function(){
    $("#myModal").modal('show');
});
})

document.addEventListener("turbolinks:load", () => {
  flatpickr("[data-behavior='flatpickr']"
  )
});

document.addEventListener("click", () => { 
  $('#bcpModal').modal('show')
});

$(document).ready(function(){
  $(".dropdown-toggle").dropdown();
})
import "controllers"
