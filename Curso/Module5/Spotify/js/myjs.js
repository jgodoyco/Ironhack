
$(document).ready(function(){

	$('form').on('submit',function(e){
		e.preventDefault();
		var data={};
		data.name = $('input[name=name]').val();

			$.ajax({
				url: "https://api.spotify.com/v1/search?type=artist&query='"+data.name+"'",
				success: showArtists,
				error: function(error){
					console.log("Error!");
					console.log(error.responseText);
				},
			});
	});

	$(".artist-list").on('click', ".divArtist a",function(e) {		
		e.preventDefault();
		var id=e.target.id;
		$.ajax({
			url: "https://api.spotify.com/v1/artists/"+id+"/albums",
			success: showAlbums,
			error: function(error){
				console.log("Error!");
				console.log(error.responseText);
			},
		});
	});

	$(".album-list").on('click', ".divAlbum a",function(e) {		
		e.preventDefault();
		var id=e.target.id;
		var image=e.target.name;
		$.ajax({
			url: "https://api.spotify.com/v1/albums/"+id+"/tracks",
			success: showTracks,
			error: function(error){
				console.log("Error!");
				console.log(error.responseText);
			},
		});
	});

	$(".track-list").on('click', ".divTrack a",function(e) {		
		e.preventDefault();
		console.log(e);
		var url_preview =e.target.id;
		var name_song = e.target.innerText;
		playTrack(url_preview, name_song);
	});

});

function playTrack(url_track, nameSong){

		$("#myModalLabel").text(nameSong);
		$('#myModal').modal('show');

		var audioElement = document.createElement('audio');
    audioElement.setAttribute('src', url_track);
    
    audioElement.addEventListener('ended', function() {
        this.play();
    }, false);
    
    audioElement.addEventListener("canplay",function(){
        $("#length").text("Duration:" + audioElement.duration + " seconds");
        $("#source").text("Source:" + audioElement.src);
        $("#status").text("Status: Ready to play").css("color","green");
    });
    
    audioElement.addEventListener("timeupdate",function(){
        $("#currentTime").text("Current second:" + audioElement.currentTime);
    });
    
    $('#play').click(function() {
        audioElement.play();
        $("#status").text("Status: Playing");
    });
    
    $('#pause').click(function() {
        audioElement.pause();
        $("#status").text("Status: Paused");
    });
    
    $('#restart').click(function() {
        audioElement.currentTime = 0;
    });

    $('#stop').click(function() {
        stop(audioElement);
    });

    $('#close').click(function() {
        stop(audioElement);
    });

    $('#buttonClose').click(function() {
        stop(audioElement);
    });
    

    function stop(audioEl){
      audioEl.currentTime = 0;
      audioEl.setAttribute('src', '');
      $("#status").text("Status: Stoped");
    }

}

function showArtists(artists){

	var artistList =artists.artists.items
	var list= $('.artist-list');

	artistList.forEach( function (artist) {
		var img;
		if (typeof artist.images[2] === 'undefined'){
			img = "- No Image avalaible -"
		} else {
			img = "<img src='"+artist.images[2].url+"' >";
		}

		var element = $('<li>')
			.append ($('<p>')
				.append ($("<div class='divArtist'>")
					.append ($("<a href='#' id="+artist.id+">")
			 			.text (artist.name))))
							.append(img);

		list.append(element)
	});

}

function showAlbums(albums){

	var albumsList = albums.items
	var list= $('.album-list');
	list.empty();

	albumsList.forEach( function (album) {
		var img;
		if (typeof album.images[2] === 'undefined'){
			img = "- No Image avalaible -";
		} else {
			img = "<img src='"+album.images[2].url+"' >";
		}

		var element = $('<li>')
			.append ($('<p>')
				.append ($("<div class='divAlbum'>")
					.append ($("<a href='#' id="+album.id+" name="+album.images[1].url+" >")
			 			.text (album.name))))
							.append(img);

		list.append(element)
	});	
}

function showTracks(tracks){

	var trackList = tracks.items
	var list= $('.track-list');
	list.empty();

	trackList.forEach( function (track) {
		var element = $('<li>')
			.append ($('<p>')
				.append ($("<div class='divTrack'>")
					.append ($("<a href='#' id="+track.preview_url+" >")
			 			.text (track.name))));
							
		list.append(element)
	});

	$(".divTracksFloat").show();
	$(window).resize(function(){

    $('.divTracksFloat').css({
        position:'absolute',
        left: ($(window).width() - $('.divTracksFloat').outerWidth())/2,
        top: ($(window).height() - $('.divTracksFloat').outerHeight())/2
    });

	});

	// To initially run the function:
	$(window).resize();

}


