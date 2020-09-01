const COLOR = "gray";
const RADIUS = 10;

const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");
Util.inherits(Asteroid, MovingObject);
function Asteroid (options){
    options.color = COLOR;
    options.radius = RADIUS; 
    options.vel = Util.randomVec(10);
    MovingObject.call(this, options);
}

module.exports = {Asteroid, COLOR, RADIUS}; 


