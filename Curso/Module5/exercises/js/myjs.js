
$(document).ready(function(){

	if ("geolocation" in navigator){
		console.log("Geo is ON!!!");
	}else{
		console.log("Geo is OFF!!!");
	}

	var options ={ enableHighAccuracy: true };
	navigator.geolocation.getCurrentPosition(onLocation, onError, options);
	

	function onLocation (position) {
		lati = position.coords.latitude;
		long = position.coords.longitude;
		console.log('Lattitude :'+ lati);
		console.log('Longitude :'+ long);
		document.getElementById('position').innerHTML = 'Lat: '+ lati + ', long: '+long;

		showMap(lati,long)
		
	}

	function onError(error) {
		console.log(error);
	}


	function showMap(lati,long){
		var url = "https://maps.googleapis.com/maps/api/staticmap?center="+lati+","+long+"&zoom=13&size=400x300&markers=color:blue|label:x|"+lati+","+long;;

		document.getElementById('position').innerHTML = url;
		document.getElementById('mapa').src = url

	}
});



