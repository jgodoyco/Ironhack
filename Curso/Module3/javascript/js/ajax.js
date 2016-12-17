window.onload= function() {

	var http= new XMLHttpRequest();
	//var resultado = http.open("GET", "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=JS",true);
	var resultado = http.open("GET", "data/friends.json",true);
	http.send();

	http.onreadystatechange = function(){

		if (http.readyState == 3){
			console.log("...loading");
		}
		if (http.readyState == 4){
			console.log("*** http.readyState:"+http.readyState);
			console.log("*** resultado:"+resultado);
			console.log("*** http.response:"+http.response);
			var objectResponse = JSON.parse(http.response);
			
			alert(objectResponse.DataFriends[0].Friend);
			console.log( "*** objectResponse:"+objectResponse);
		}
	}
	


	console.log("A ver que se ejecuta primero...")
}
