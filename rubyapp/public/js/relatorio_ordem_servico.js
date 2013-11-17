$(document).ready(function(){
	
	$("#oficina_fone").mask("(999)9999-9999");
	
	var html = $( $('#relatorio_ordem_servico').html() ).clone();
	console.log(html.find("#estado_id").val());
	
	$("#relatorio_ordem_servico").submit(function(event){
		event.preventDefault();
		
		var myWindow = window.open("","Ordem de Serviço","width=1200,height=750");
		
		myWindow.document.write(this.outerHTML);
		$(myWindow.document).find("#oficina").val($("#oficina").val());
		$(myWindow.document).find("#oficina_fone").val($("#oficina_fone").val());
		$(myWindow.document).find("#oficina_endereco").val($("#oficina_endereco").val());
		$(myWindow.document).find("#estado_id").replaceWith($('<input>').val($("#estado_id option:selected").text()).css('width','152px'));
		$(myWindow.document).find("#cidade").replaceWith($('<input>').val($("#cidade option:selected").text()).css('width','152px'));
		$(myWindow.document).find('input[type="submit"]').remove();
		myWindow.print();
		myWindow.close();
	});
	
	$("#estado_id").change(function(){
		
		$("#cidade").empty().append($('<option>').text("Selecione uma cidade..."));
		$("#cidade").val("");
		
		$.ajax({
			url 	 : '/load_cidades.json?estado_id='+this.value,
	    	type	 : 'GET',
	    	dataType : 'json',
	    	error: function(jqXHR, textStatus, errorThrown){
	        	$('body').append("AJAX Error: "+textStatus);
			},
	    	success: function(data, textStatus, jqXHR){
	        	$(data).each(function(){
	        		$('<option>').val(this.id).text(this.descricao).appendTo("#cidade");
				});
			}
   		});
	});
});