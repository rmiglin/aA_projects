Function.prototype.inherits = function(){

}

// const Surrogate = function(){};

// Surrogate.prototype = SuperClass.prototype;

// Subclass.prototype = new Surrogate();
// Subclass.prototype.constructor = Subclass;


Function.prototype.inherits = function(parentclass) {
    const Surrogate = function() {};

    Surrogate.prototype = parentclass.prototype;

    this.prototype = new Surrogate();   
    this.prototype.constructor = this;
}

// ------------------------------------
function MovingObject() { }

function Ship() { }
Ship.inherits(MovingObject);

function Asteroid() { }
Asteroid.inherits(MovingObject);

//Object.create

Function.prototype.inherits = function (parentclass) {
    this.prototype = Object.create(parentclass.prototype);
    this.prototype.constructor = this;
}



