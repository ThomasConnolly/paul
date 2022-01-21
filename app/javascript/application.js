// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "trix"
import "@rails/actiontext"
import * as bootstrap from "bootstrap"

document.addEventListener("turbo:load", () => {

  <script type="text/javascript">
  $(window).on('load', function() {
    $('#ticketModal').modal('show');
  });
</script>

  var myModal = new bootstrap.Modal (document.getElementById ('ticketModal'), {
  myModal(show)
})
  

  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })

  let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))  
  let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {  
    return new bootstrap.Popover(popoverTriggerEl)  
  })

 
})    