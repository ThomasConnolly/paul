

document.addEventListener('turbolinks:load', function() {
  var stripe = Stripe('pk_test_i3Ry2iGGqQIXZiVwJ2eimNOM');
  var elements = stripe.elements();
  var style = {
    base: {
      color: '#32325d',
      lineHeight: '18px',
      fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
      fontSmoothing: 'antialiased',
      fontSize: '16px',
      '::placeholder': {
        color: '#aab7c4'
      }
    },
    invalid: {
      color: '#fa755a',
      iconColor: '#fa755a'
    }
  };
  var card = elements.create('card', {style: style});
  card.mount('#card-element');
  card.addEventListener('change', function(event) {
    var displayError;
    displayError = document.getElementById('card-errors');
      if (event.error) {
        displayError.textContent = event.error.message;
      } else {
        displayError.textContent = '';
    }
  });

  var form = document.getElementById('payment-form');
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
  var form = document.getElementById('payment-form');
  var hiddenInput = document.createElement('input');
  hiddenInput.setAttribute('type', 'hidden');
  hiddenInput.setAttribute('name', 'stripeToken');
  hiddenInput.setAttribute('value', 'token.id');
  form.appendChild(hiddenInput);

  ["brand", "exp_month", "exp_year", "last4"].forEach(function(field) {
    addFieldToForm(form, token, field);
  });
  form.submit();
}

function addFieldToFormm(form, token, field){
  var hiddenInput = document.createElement('input');
  hiddenInput.setAttribute('card_type', 'hidden');
  hiddenInput.setAttribute('name', "user[card_" + field + "]");
  hiddenInput.setAttribute('value', token.card[field]);
  form.appendChild(hiddenInput);
}
