// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import Rails from '@rails/ujs';
Rails.start();
window.Rails = Rails
import "core-js/stable";
import "regenerator-runtime/runtime";
require("turbolinks").start()
require("trix")
require("@rails/actiontext")
import jQuery from "jquery";
window.$ = window.jQuery = jQuery;
import "controllers";
import 'bootstrap';
import 'data-confirm-modal';
import "src/application.scss";
import flatpickr from "flatpickr";
require("flatpickr/dist/flatpickr.css")
require("@rails/activestorage").start()
require("channels")


document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})

document.addEventListener("turbolinks:load", () => {
  $(document).ready(function () {
    $("#myModal").modal('show')
    })
  });

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

  document.addEventListener("turbolinks:load", () => {
    const form = document.querySelector("#payment-form")
    if (form == null) { return }
    
    const public_key = document.querySelector("meta[name='stripe-key']").getAttribute("content")
    const stripe = Stripe(public_key)
    
    const elements = stripe.elements()

    var style = {
      base: {
        color: '#303238',
        fontSize: '24px',
        fontFamily: '"Open Sans", sans-serif',
        fontSmoothing: 'antialiased',
      }
    }
    
    const card = elements.create('card', {style: style})
    card.mount('#card-element')
    
    card.addEventListener("change", (event) => {
      var displayError = document.getElementById('card-errors')
      if (event.error) {
        displayError.textContent = event.error.message
      } else {
        displayError.textContent = ''
      }
    })
    
    form.addEventListener("submit", (event) => {
      event.preventDefault()
    
      let data = {
        payment_method: {
          card: card,
          billing_details: {
            name: form.querySelector("#name_on_card").value
          }
        }
      }
    
      stripe.confirmCardPayment(form.dataset.paymentIntentId, data).then((result) => {
        if (result.error) {
          var errorElement = document.getElementById('card-errors')
          errorElement.textContent = result.error.message
        } else {
          form.submit()
        }
      })
    })
  })
