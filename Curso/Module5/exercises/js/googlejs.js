  console.log('Hola')

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

		//initMap(lati,long)
		initMap(-33.92, 151.25);

	}

	function onError(error) {
		console.log(error);
	}

});

function initMap(lati,long) {
  // Create a map object and specify the DOM element for display.
  var map = new google.maps.Map(document.getElementById('map'), {
    center: new google.maps.LatLng(lati,long),
    zoom: 12,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  var locations = [
		  ['Bondi Beach', -33.890542, 151.274856, 1],
		  ['Coogee Beach', -33.923036, 151.259052, 2]
		]
		
		var infowindow = new google.maps.InfoWindow();
		var marker,i ;

		for (i=0; i <locations.length; i++){
			marker = new google.maps.Marker({
				position: new google.maps.LatLng(locations[i][1],locations[i][2]),
				map: map
			});

			google.maps.event.addListener(marker, 'click', markerInfo(marker,i));

		}

		function markerInfo(marker,i) {
			return function() {
				infowindow.setContent(locations[i][0] + '<b> ¿Te apetece venir?</b>');
				infowindow.open(map, marker);
			};
		}
}

