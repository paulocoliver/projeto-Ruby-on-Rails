$(document).ready(function(){
	
	if($('input[name="tipo_pessoa"]:checked').val() == 'Fisica'){
		applyCPF_Mask();
	}else{
		applyCNPJ_Mask();
	}
	$("#cliente_cep").mask("99999-999");
	$("#cliente_fone_1").mask("(999)9999-9999");
	$("#cliente_fone_2").mask("(999)9999-9999");
	
	$("#estado_id").change(function(){
		
		$("#cidade_id").empty().append($('<option>').text("Selecione uma cidade..."));
		$("#cidade_id").val("");
		
		$.ajax({
			url 	 : '/load_cidades.json?estado_id='+this.value,
	    	type	 : 'GET',
	    	dataType : 'json',
	    	error: function(jqXHR, textStatus, errorThrown){
	        	$('body').append("AJAX Error: "+textStatus);
			},
	    	success: function(data, textStatus, jqXHR){
	        	$(data).each(function(){
	        		$('<option>').val(this.id).text(this.descricao).appendTo("#cidade_id");
				});
			}
   		});
	});   		
	$('input[name="tipo_pessoa"]').change(function(){
		if(this.value == 'Fisica'){
			$('label[for="cliente_CPF"]').text("CPF");
			applyCPF_Mask();
		}
		else{
			$('label[for="cliente_CPF"]').text("CNPJ");
			applyCNPJ_Mask();
		}
	});
});

function applyCPF_Mask(){
	$("#cliente_documento").mask("999.999.999-99");
}
function applyCNPJ_Mask(){
	$("#cliente_documento").mask("99.999.999/9999-99");
}

