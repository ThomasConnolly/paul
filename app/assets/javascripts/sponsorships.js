document.addEventListener("turbolinks:load", function() {
	var stripe = Stripe('pk_test_i3Ry2iGGqQIXZiVwJ2eimNOM');
	var elements = stripe.elements();
});
