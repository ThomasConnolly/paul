$( document ).on('ready, turbolinks:load', function() {
  var stripe = Stripe('pk_test_i3Ry2iGGqQIXZiVwJ2eimNOM');
  var elements = stripe.elements();
  var card = elements.create('card');
  card.mount('#card-element');

  function stripeTokenHandler(token) {
    var form = document.getElementById('payment-form');
    var hiddenInput = document.createElement('input');
    hiddenInput.setAttribute('type', 'hidden');
    hiddenInput.setAttribute('name', 'stripeToken');
    hiddenInput.setAttribute('value', token.id);
    form.appendChild(hiddenInput);

    form.submit();
  }
  function createToken() {
    stripe.createToken(card).then(function(result) {
      if (result.error) {
      var errorElement = document.getElementById('card-errors');
      errorElement.textContent = result.error.message;
    } else {
      stripeTokenHandler(result.token);
      }
    });
  }

  var form = document.getElementById('payment-form');
  form.addEventListener('submit', function(e) {
    e.preventDefault();
    createToken();
  });

  card.addEventListener('change', function(event) {
    var displayError = document.getElementById('card-errors');
    if (event.error) {
      displayError.textContent = event.error.message;
    } else {
      displayError.textContent = '';
     }
  });




  // ["brand", "exp_month", "exp_year", "last4"].forEach(function(field) {
  //   addFieldToForm(form, token, field);


});
//
// function addFieldToForm(form, token, field){
//   var hiddenInput = document.createElement('input');
//   hiddenInput.setAttribute('card_type', 'hidden');
//   hiddenInput.setAttribute('name', "user[card_" + field + "]");
//   hiddenInput.setAttribute('value', token.card[field]);
//   form.appendChild(hiddenInput);
// }
