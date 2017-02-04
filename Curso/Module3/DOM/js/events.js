
console.log("JavaScript log");

$(document).ready(function () {
	/*$( "#buttonOcultar" ).click(function() {
	  alert( "Handler for .click() called." );
	  $( "#imagen1" ).remove();
	  $( "#imagen2" ).remove();
	  $( "#imagen3" ).remove();
	});*/

	/*$( "#buttonUnicornio" ).click(function() {
		alert( "Handler for .click() called." );
		$('a').addClass('colorRojo');
	});*/
	
	var i;
	var fecha = new Date();
	var ano = fecha.getFullYear();
	var selector = $("#mySelect");

	for (i = 1950; i < ano+1 ; i++) { 
		selector.append('<option value="'+i+'">'+i+'</option>');
	}

	/*$("#mySelect").change(function() {
	  	var anoNacimiento = $("#mySelect option:selected").val();
	  	var edad =ano-anoNacimiento;
	  	alert ("AÑO NACIMIENTO:"+ anoNacimiento +", TIENES: "+edad);
	  	if (edad>18) {
	  		alert ("USTED ES MAYOR DE EDAD ...");
	  	} else {
	  		alert ("USTED ES MENOR DE EDAD ...");
	  	}
	});*/

	//$("#buttonSubmit").click(function(e) {
	$("#myForm").on('submit', function(e) {

		$("#myForm *").removeClass('focoError');

		var anoNacimiento = $("#mySelect option:selected").val();
		var edad =ano-anoNacimiento;

	  	alert ("AÑO NACIMIENTO:"+ anoNacimiento +", TIENES: "+edad);
	  	if (edad<18) {
	  		alert ('DEBE SER MAYOR DE EDAD PARA ENVIAR EL FORMULARIO');
			$("#divEdad").addClass('focoError');
			e.preventDefault();
	  	} 
	  	if ($("#nombreTipo").val() == "") {
			alert ('DEBE RELLENAR EL NOMBRE ANTES DE ENVIARLO');
			$("#nombreTipo").addClass('focoError');
			e.preventDefault();
		}

	});

})

