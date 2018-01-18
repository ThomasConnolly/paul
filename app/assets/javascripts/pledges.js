document.addEventListener("turbolinks:load", function() {
  var public_key = document.querySelector("meta[name='stripe-public-key']").content;
  var stripe = Stripe(public_key);
  var elements = stripe.elements();

  var style = {
    base: {
      fontSize: '24px'
    },
    invalid: {
      color: 'red'
    }
  };

//Create an instance of the card Element

var card = elements.create('card', {style: style});
  
//Add an instance of the card Elemenet into the 'card-element div'    
card.mount('#card-element');

card.addEventListener('change', function(event) {
  var displayError = document.getElementById('card-errors');
  if (event.error) {
    displayError.textContent = event.error.message;
  } else {
    displayError.textContent = '';
  }
});

//Create a token or display an error when form is submitted
var form = document.getElementById('pledge-payment-form');
form.addEventListener('submit', function(event) {
  event.preventDefault();

    stripe.createToken(card).then(function(result) {
      if (result.error) {
        // Inform the user if there was an error
        var errorElement = document.getElementById('card-errors');
        errorElement.textContent = result.error.message;
      } else {
        // Send the token to your server
        stripeTokenHandler(result.token);
      }
    });
  });
});

// Create a token when the form is submitted.
function stripeTokenHandler(token) {
  // Insert the token ID into the form so it gets submitted to the server
  var form = document.getElementById('pledge-payment-form');
  var hiddenInput = document.createElement('input');
  hiddenInput.setAttribute('type', 'hidden');
  hiddenInput.setAttribute('name', 'stripeToken');
  hiddenInput.setAttribute('value', token.id);
  form.appendChild(hiddenInput);


  ["brand", "exp_month", "exp_year", "last4"].forEach(function(field) {
    addFieldToForm(form, token, field);
});

// Submit the form
form.submit();
}

function addFieldToForm(form, token, field) {
 var hiddenInput = document.createElement('input');
 hiddenInput.setAttribute('type', 'hidden');
 hiddenInput.setAttribute('name', "card_" + field);
 hiddenInput.setAttribute('value', token.card[field]);
 form.appendChild(hiddenInput);

}
