$(document).ready(function(){
	
	$("#ordem_servico_cliente_id").change(function(){
		
		$("#veiculo_id").empty().append($('<option>').text("Selecione um veiculo..."));
		$("#veiculo_id").val("");
		
		$.ajax({
			url 	 : '/load_veiculos.json?cliente_id='+this.value,
	    	type	 : 'GET',
	    	dataType : 'json',
	    	error: function(jqXHR, textStatus, errorThrown){
	        	$('body').append("AJAX Error: "+textStatus);
			},
	    	success: function(data, textStatus, jqXHR){
	        	$(data).each(function(){
	        		$('<option>').val(this.id).text(this.marca+' - '+this.modelo).appendTo("#veiculo_id");
				});
			}
   		});
	});   		
});