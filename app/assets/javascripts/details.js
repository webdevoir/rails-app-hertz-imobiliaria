function addDetail() {
  const detail = $('#detail').val();
  const target = $('#detail-form #property_id');
  if (detail === '') {
    alert('Por favor escreva um detalhe do imovel');
  } else if (detail.length > 19) {
    alert('menor que 20 c');
  } else {
    target.after('<div class="col-md-3 center"><div class="delete-detail detail"><span class="x-detail">x</span><label for="' + detail.toLowerCase() +'">'+ detail +'</label> <input type="hidden" name="details['+ detail.toLowerCase() + ']" id="details_'+ detail.toLowerCase() + '" value="true"></div></div>');
    $('#detail').val('');
  }
  return false;
};




$(document).on('click', '.x-detail', function() {
  $(this).parent().parent().remove();
  return false;
});
