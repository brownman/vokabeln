$(document).ready(function() {
  // Init search field
  (function() {
    var field = $('#search-field');
    var form = field.closest('form');
    field.keyup(function() {
      form.submit();
    });
  })();
});
