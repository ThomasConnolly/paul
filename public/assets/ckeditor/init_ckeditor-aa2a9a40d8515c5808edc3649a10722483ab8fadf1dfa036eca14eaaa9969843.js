(function() {
  var ready;

  ready = function() {
    $('.ckeditor').each(function() {
      return CKEDITOR.replace($(this).attr('id'));
    });
    $(document).ready(ready);
    return $(document).on('page:load', ready);
  };

}).call(this);
