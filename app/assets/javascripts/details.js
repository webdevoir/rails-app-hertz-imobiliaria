function addDetail() {
  const detail = capitalizeFirstLetter($('#detail').val().toLowerCase());
  const target = $('#detail-form #property_id');
  const template = interpolateTamplate(detail);
  const allDetails = getAddedDetails();
  $('.detail-alert').remove();
  if (detail === '') {
    displayAlert("O detalhe não pode ser vazio");
  } else if (detail.length > 19) {
    displayAlert("Não poder ser maior que 20 caracteres");
  } else if (allDetails.includes(detail.toLowerCase()))
    displayAlert("Não incluir detalhes repetidos");
  else {
    target.after(template);
  }
  $('#detail').val('');
  return false;
};

function interpolateTamplate(detail) {
  var template = `<div class="col-md-3 center"><div class="delete-detail detail"><span class="x-detail">x</span><label for="${detail.toLowerCase()}">${detail}</label> <input type="hidden" name="details[${detail.toLowerCase()}" id="details_${detail.toLowerCase()}" value="true"></div></div>`;
  return template;
}

function displayAlert(message) {
  var template = `<p class='detail-alert'>${message}</p>`
  $('#add-new-detail').append(template);
}

function getAddedDetails() {
  var allDetails = [];
  $.each($('.detail label'), function (el) {
    allDetails.push($('.detail label')[el].textContent.toLowerCase());
  });
  return allDetails;
}

function capitalizeFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

$(document).on('click', '.x-detail', function() {
  $(this).parent().parent().remove();
  return false;
});
