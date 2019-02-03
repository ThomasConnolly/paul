$( document ).on('ready, turbolinks:load', function() {
  var stripe = Stripe('pk_test_i3Ry2iGGqQIXZiVwJ2eimNOM');
  var elements = stripe.elements();

  document.addEventListener("turbolinks:load", function() {
    if (!document.querySelector("#card-element")) {
        return;
  }

  var style = {
    base: {
      fontSize: '24px'
    }
  };
  var card = elements.create('card', {style: style});
  card.mount('#card-element');

  card.addEventListener('change', function(event) {
    var displayError = document.getElementById('card-errors');
    if (event.error) {
      displayError.textContent = event.error.message;
    } else {
      displayError.textContent = '';
     }
  });

  var form = document.getElementById('albergue-payment-form');
  form.addEventListener('submit', function(event) {
    event.preventDefault();

    stripe.createToken(card).then(function(result) {
      if (result.error) {
      var errorElement = document.getElementById('card-errors');
      errorElement.textContent = result.error.message;
    } else {
      stripeTokenHandler(result.token);
      }
    });
  });
});

function stripeTokenHandler(token) {
  var form = document.getElementById('albergue-payment-form');
  var hiddenInput = document.createElement('input');
  hiddenInput.setAttribute('type', 'hidden');
  hiddenInput.setAttribute('name', 'stripeToken');
  hiddenInput.setAttribute('value', token.id);
  form.appendChild(hiddenInput);

  ["brand", "exp_month", "exp_year", "last4"].forEach(function(field) {
    addFieldToForm(form, token, field);
  });

  form.submit();
}

 function addFieldToForm(form, token, field){
   var hiddenInput = document.createElement('input');
   hiddenInput.setAttribute('type', 'hidden');
   hiddenInput.setAttribute('name', "[card_" + field + "]");
   hiddenInput.setAttribute('value', token.card[field]);
   form.appendChild(hiddenInput);
 }
});
