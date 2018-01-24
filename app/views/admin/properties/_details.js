$(document).on('submit', '#my-form', function() {
  var detail = $('#detail').val();
  var target = $('#test-target');
  target.append('<p class="id">' + detail + '</p>');
  $('#detail').val('');
  return false;
});
