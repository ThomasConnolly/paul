
//= require jquery3
//= require popper
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.remotipart
//= require jquery.ui.widget
//= require jquery.iframe-transport
//= require jquery.fileupload
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require bootstrap
//= require ckeditor/init
//= require ckeditor/config
//= require bootstrap-datepicker
//= require video
//= require turbolinks
//= require compatibility.coffee
//= require moment
//= require_tree .


$(document).on("click", "#display-full-sponsorship", function(){
	$("#full-sponsorship").show();
});
$(document).on("click", "#display-quarterly-sponsorship", function(){
	$("#quarterly-sponsorship").show();
});
$(document).on("click", "#display-monthly-sponsorship", function(){
	$("#monthly-sponsorship").show();
});