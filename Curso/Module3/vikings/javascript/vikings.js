//
// THE VIKINGs ADVENTURE!!!
//
var minHealth = 50;
var minStrength =10;

//  Warrior base class
var Warrior = function(maxHealth, maxStrength){
	this.health= this._calculateRandom(minHealth, maxHealth);
	this.strength= this._calculateRandom(minStrength, maxStrength);
}

Warrior.prototype._calculateRandom = function(min, max){	
	return generalCalculateRandom(min,max);
};
Warrior.prototype.setDamage = function(damage){
	this.health -= damage;
	console.log('--> I am '+ this.name+', I recived this Damage :'+damage + ", My Health NOW is:"+ this.health);
	if (this.health<0){
		console.log('--> I DIE!!! Pray for MEEEEE !!!' );
	}
};

// Viking class from Warrior class
var Viking = function(maxHealth, maxStrength, nameViking){
	Warrior.call(this, maxHealth, maxStrength);
	this.name = nameViking;
	console.log('CREATE VIKING ['+ this.name+'], with health '+this.health+ '& strength '+ this.strength);
};
// Si no haces esto NO SE CREA una instancia del Objeto sino Apuntarian TODOS al mismo Objeto
Viking.prototype = Object.create(Warrior.prototype);
Viking.prototype.constructor = Viking;

// Saxon class from Warrior class
var Saxon = function(maxHealth, maxStrength){
	Warrior.call(this, maxHealth, maxStrength);
	this.name = "Anonimus Saxon Id["+generalCalculateRandom(2000,5000)+"]";
	console.log('CREATE SAXON ['+ this.name+'], with health '+this.health+ '& strength '+ this.strength);
};
Saxon.prototype = Object.create(Warrior.prototype);
Saxon.prototype.constructor = Saxon;

// The PIT of the HONOR
var PitTraining = function(numTurns){
	var pit1MaxHealth = 100
	var thor = new Viking (pit1MaxHealth, 20, "Thor");
	var odin = new Viking (pit1MaxHealth, 20, "Odin");

	var stopCombat = false;
	console.log('*** Attention !! there is a training combat and there will not be DEATH !!');
	while (numTurns>0 && !stopCombat) {
		var damageThorToOdin = _getDamage();
		var damageOdinToThor = _getDamage();

		if ((damageOdinToThor>thor.health)||(damageThorToOdin>odin.health)){
			stopCombat=true;
		} else {
			console.log('TURN '+numTurns+ ' GO!')
			thor.setDamage(damageOdinToThor);
			odin.setDamage(damageThorToOdin);
		}

		numTurns -= 1;
	}
	console.log(_getWinner(numTurns,thor,odin));

	function _getWinner(turnsLeave,thor,odin){
		var winner;
		if ((turnsLeave<0)||(thor.health == odin.health)){
			winner = 'NOBODY Wins in this Pit';
		} else if (thor.health < odin.health){
			winner = 'ODIN Wins in this Pit';
		} else{
			winner = 'THOR Wins in this Pit';
		}
		return winner;
	}
	function _getDamage(){
		return generalCalculateRandom(1, ((pit1MaxHealth * 10) /100) );
	}
}

//var trainingCombat = new PitTraining(20);

// The city Assault
var PitAssault = function(numVikings, numSaxons){

	var nombresEslavos = ['Axel','Odin','Thor','Axel','Hans','Igor','Scol','Saga','Bjorn','Ainar','Eero','Einar','Axll','Boden','Bodin','Eric','Kallan','Krister','Majken','Oglavee','Rolf','Vidar','Kingle'];
	var numberOfTurns = generalCalculateRandom(5,8);
	var maxHealthViking = 100;
	var maxHealthSaxon = 70;
	var allSaxonsCaput = false;

	var vikings = _createHorde('V',numVikings);
	var saxons = _createHorde('S',numSaxons); //Poors.. they are farmers!!

	while (numberOfTurns>0 && !allSaxonsCaput){
		console.log('*************************************');
		console.log('******* TURNO DE COMBATE '+numberOfTurns +'*******');
		console.log('*************************************');
		console.log('   GO!!! ');

		allSaxonsCaput = _vikingAtack(vikings, saxons);
		--numberOfTurns;
	}

	console.log('			************');
	console.log('		*********************');
	console.log('	******************************');
	console.log(' ***********************************');
	console.log('*************************************');
	console.log('*************************************');
	console.log('******* FIN DEL COMBATE *************');;
	if (allSaxonsCaput) {
		console.log('******* NO More alive Saxons. VIKINGS Wins !!!');
	} else {
		var vikingsCasualtiesPercentage = _checkCasualties(vikings)/numVikings;
		var saxonsCasualtiesPercentage = _checkCasualties(saxons)/numSaxons;

		if (vikingsCasualtiesPercentage == saxonsCasualtiesPercentage){
			console.log('******* NO WINNERS - NO LOSSERS ['+vikingsCasualtiesPercentage+'% Casualties % ]');
		} else if (vikingsCasualtiesPercentage < saxonsCasualtiesPercentage) {
			console.log('******* VIKINGS Wins ['+vikingsCasualtiesPercentage+'% Vik Casualties %  Vs '+saxonsCasualtiesPercentage+'% Sax Casualties % ]');
		} else {
			console.log('******* SAXONS Wins ['+saxonsCasualtiesPercentage+'% Sax Casualties %  Vs '+vikingsCasualtiesPercentage+'% Vik Casualties % ]');
		}
	}
	console.log('*************************************');
	console.log('*************************************');
	console.log(' ***********************************');
	console.log('	******************************');
	console.log('		*********************');
	console.log('			************');

	function _checkCasualties(warriors){
		var numberOfCasualties=0;
		warriors.forEach( function(warrior, index) {
			// statements
			if (warrior.health<0) ++numberOfCasualties;
		});
		return numberOfCasualties;
	}

	function _vikingAtack(vikings, saxons){
		var chosedSaxonEnemy;
		var allSaxonsWereDie =false;
		var index=0;

		while (!allSaxonsWereDie && index < vikings.length) {
		 	chosedSaxonEnemy = _findAliveSaxon(saxons);

			if(chosedSaxonEnemy!="No More alive"){
				viking = vikings[index];
			    console.log('Running Singular Combat -> ' +viking.name+'- Vs -'+chosedSaxonEnemy.name);
			    console.log('Initial Conditions -> '+viking.health+'['+viking.strength+'] Vs '+chosedSaxonEnemy.health+'['+chosedSaxonEnemy.strength+']');
			    console.log('['+viking.name+'] ¡Huh! .....');
			    viking.setDamage(chosedSaxonEnemy.strength);
				chosedSaxonEnemy.setDamage(viking.strength);
				console.log('Final Result -> '+viking.health+' Vs '+chosedSaxonEnemy.health );
			} else {				 
				 allSaxonsWereDie =true;
			}
			++index;
		};

		function _findAliveSaxon(saxons){
			var chosedAliveSaxon = "No More alive";
			var continueFinding = false;
			var index=0;
			// is there any saxon alive??
			while (index < saxons.length && !continueFinding ) {
			    continueFinding = saxons[index].health>0
			    ++index;
			}
			// if exist i find one alive
			while (continueFinding) {
				chosedAliveSaxon = saxons[generalCalculateRandom(0,saxons.length-1)];
				continueFinding = chosedAliveSaxon.health<0;
			}
			return chosedAliveSaxon
		}

		return allSaxonsWereDie;
	}

	function _createHorde(warriorType,numberOfWarrior){
		var warriors =[];
		while (numberOfWarrior>0){
			numberOfWarrior -=1;
			if (warriorType==='V') {
				warriors[numberOfWarrior] = new Viking(maxHealthViking, 20, _getVikingName());
			} else {
				warriors[numberOfWarrior] = new Saxon(maxHealthSaxon, 15);
			}
		}
		return warriors;
	}

	function _getVikingName(){		
		var nom1= nombresEslavos[generalCalculateRandom(0,22)];
		var nom2= nombresEslavos[generalCalculateRandom(0,22)];
		return nom1+' hijo de '+nom2;
	}

}

function generalCalculateRandom(min, max){
	return Math.floor(Math.random() * (max - min + 1)) + min;
};

var assaultCombat = new PitAssault(20, 30);



