require("@rails/ujs").start()
global.Rails = Rails;
require("turbolinks").start()
//require("@rails/activestorage").start()
//require("channels")
require("trix")
require("@rails/actiontext")

import "css/application";
import "bootstrap/dist/js/bootstrap";
import flatpickr from "flatpickr";
require("flatpickr/dist/flatpickr.css")

$(document).on("turbolinks:load", () => {
  
  // $('[data-toggle="tooltip"]').tooltip()
  // $('[data-toggle="popover"]').popover()
  $('#myModal').modal()
})

document.addEventListener("turbolinks:load", () => {
  flatpickr("[data-behavior='flatpickr']"
  )
})


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

