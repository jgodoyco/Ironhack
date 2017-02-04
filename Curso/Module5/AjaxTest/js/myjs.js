
function send() {
	$.ajax({
		url: "https://ironhack-characters.herokuapp.com/characters",
		success: showCharacters,
		error: function(error){
			console.log("Error!");
			console.log(error.responseText);
		},
	});

}
function showCharacters(characters){
		var list= $('.character-list');
		characters.forEach( function (character) {
			var element = $('<li>')
				.append($('<h2>')
				 .text(character.name + ' - ' + character.occupation));
			list.append(element);			
		});
		console.log('Succesful!!', characters);
}

$.('form').on('submit',function(e){
	console.log(e);
	e.preventDefault();
	var data={};
	data.name = $('input[name=name]').val();
	data.occupation = $('input[name=occupation]').val();

		$.ajax({
			type: "post"
			url: "https://ironhack-characters.herokuapp.com/characters",
			success: showCharacters,
			error: function(error){
				console.log("Error!");
				console.log(error.responseText);
			},
		});
});
