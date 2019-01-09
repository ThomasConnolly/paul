

document.addEventListener('turbolinks:load', function() {
  var card, elements, form, stripe, stripeTokenHandler, stripe_public_key, style;
  stripe = Stripe('pk_test_i3Ry2iGGqQIXZiVwJ2eimNOM');
  elements = stripe.elements();
  /*style = {
    base: {
      fontSize: '24px',
      color: "#32325d",
    }
  };*/
  card  = elements.create('card');
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

  form = document.getElementById('pledge-payment-form');
  return form.addEventListener('submit', function(event) {
    event.preventDefault();
    return stripe.createToken(card).then(function(result) {
    var errorElement;
      if (result.error) {
        errorElement = document.getElementById('card-errors');
            errorElement.textContent = result.error.message;
          } else {
            stripeTokenHandler(result.token);
        }
      });
  });
});
function stripeTokenHandler(token) {
  var form = document.getElementById('pledge-payment-form');
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
