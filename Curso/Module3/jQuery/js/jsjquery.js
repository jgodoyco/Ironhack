window.onload = function() {


	console.log("Primer texto");

	$.get("data/friends.json", function(data){
		console.log(data);
		console.log("Ejecución asincrona terminada ...");
	});

	console.log("Otro texto");
}