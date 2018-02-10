$(document).ready(function() {

  $("#property_sale").change(function() {
    $(".property_sell_conditions").toggleClass('hidden');
  });

  $("#property_rent").change(function() {
    $(".property_rent_guarantee").toggleClass('hidden');
  });

});
