# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#delivered_on').datepicker({dateFormat: 'yy-mm-dd'})

  $('#sermon_body').wysihtml5()
