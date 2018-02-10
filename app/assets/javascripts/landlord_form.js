


$(document).ready(function() {
  $('[data-behaviour~=datepicker]').datepicker({"format": "yyyy-mm-dd", "weekStart": 1, "startDate": "-100y", "endDate": "-15y", "startView": "decades", autoclose: true});

  function limpa_formulário_cep() {
      // Limpa valores do formulário de cep.
      $("#landlord_street").val("");
      $("#landlord_neighborhood").val("");
      $("#landlord_city").val("");
      $("#landlord_state").val("");
  }

  //Quando o campo cep perde o foco.
  $("#landlord_cep").blur(function() {

      //Nova variável "cep" somente com dígitos.
      var cep = $(this).val().replace(/\D/g, '');

      //Verifica se campo cep possui valor informado.
      if (cep != "") {

          //Expressão regular para validar o CEP.
          var validacep = /^[0-9]{8}$/;

          //Valida o formato do CEP.
          if(validacep.test(cep)) {

              //Preenche os campos com "..." enquanto consulta webservice.
              $("#landlord_street").val("...");
              $("#landlord_neighborhood").val("...");
              $("#landlord_city").val("...");
              $("#landlord_state").val("...");

              //Consulta o webservice viacep.com.br/
              $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

                  if (!("erro" in dados)) {
                      //Atualiza os campos com os valores da consulta.
                      $("#landlord_street").val(dados.logradouro);
                      $("#landlord_neighborhood").val(dados.bairro);
                      $("#landlord_city").val(dados.localidade);
                      $("#landlord_state").val(dados.uf);
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
