function addDetail() {
  const detail = $('#detail').val();
  const target = $('#detail-form #property_id');
  const template = interpolateTamplate(detail);
  $('detil-alert').remove();
  if (detail === '') {
    $('#add-new-detail').append("<p class='detail-alert'>Por favor escreva um detalhe do imovel</p>");
  } else if (detail.length > 19) {
    alert('menor que 20 caracteres');
  } else {
    target.after(template);
  }
  $('#detail').val('');
  return false;
};

function interpolateTamplate(detail) {
  const template = '<div class="col-md-3 center"><div class="delete-detail detail"><span class="x-detail">x</span><label for="' + detail.toLowerCase() +'">'+ detail +'</label> <input type="hidden" name="details['+ detail.toLowerCase() + ']" id="details_'+ detail.toLowerCase() + '" value="true"></div></div>';
  return template;
}



$(document).on('click', '.x-detail', function() {
  $(this).parent().parent().remove();
  return false;
});
