$(document).ready(function() {

  $("#property_sale").change(function() {
    $(".property_sell_conditions").toggleClass('hidden');
  });

  $("#property_rent").change(function() {
    $(".property_rent_guarantee").toggleClass('hidden');
  });

    function limpa_formulário_cep_propriedade() {
      // Limpa valores do formulário de cep.
      $("#property_address_street").val("");
      $("#property_address_neighborhood").val("");
      $("#property_address_city").val("");
      $("#property_address_state").val("");
  }

  //Quando o campo cep perde o foco.
  $("#property_address_cep").blur(function() {

      //Nova variável "cep" somente com dígitos.
      var cep = $(this).val().replace(/\D/g, '');

      //Verifica se campo cep possui valor informado.
      if (cep != "") {

          //Expressão regular para validar o CEP.
          var validacep = /^[0-9]{8}$/;

          //Valida o formato do CEP.
          if(validacep.test(cep)) {

              //Preenche os campos com "..." enquanto consulta webservice.
              $("#property_address_street").val("...");
              $("#property_address_neighborhood").val("...");
              $("#property_address_city").val("...");
              $("#property_address_state").val("...");

              //Consulta o webservice viacep.com.br/
              $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

                  if (!("erro" in dados)) {
                      //Atualiza os campos com os valores da consulta.
                      $("#property_address_street").val(dados.logradouro);
                      $("#property_address_neighborhood").val(dados.bairro);
                      $("#property_address_city").val(dados.localidade);
                      $("#property_address_state").val(dados.uf);
                  } //end if.
                  else {
                      //CEP pesquisado não foi encontrado.
                      limpa_formulário_cep();
                      alert("CEP não encontrado.");
                  }
              });
          } //end if.
          else {
              //cep é inválido.
              limpa_formulário_cep();
              alert("Formato de CEP inválido.");
          }
      } //end if.
      else {
          //cep sem valor, limpa formulário.
          limpa_formulário_cep();
      }
    });

});
