function helloWord() {

	alert ('HelloWord');
}

// Clase
var Car = function (model, noise){
	this.model = model;
	this.noise = noise;
	this.wheelNumber = 4;

	Car.prototype.makeNoise = function() {
		console.log('Model: '+this.model+": "+this.noise+" !!!!");
	}
}

// Instanciación
var car1= new Car("Renault","fffffrfrrf");
car1.makeNoise();