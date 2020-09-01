const {Asteroid, COLOR, RADIUS} = require("./asteroid");

const DIM_X = 1200;
const DIM_Y = 900;
const NUM_ASTEROIDS = 10;

function Game(){
    this.asteroids = [];
    this.addAsteroids();
}

Game.prototype.addAsteroids = function(){
    for(i = 0; i < NUM_ASTEROIDS; i ++){
        this.asteroids.push(new Asteroid({pos : this.randomPosition() }));
    }
}

  
Game.prototype.randomPosition = function(){
    let randX = Math.floor(Math.random() * (DIM_X - RADIUS));
    let randY = Math.floor(Math.random() * (DIM_Y - RADIUS));
    return [randX, randY];
}

Game.prototype.draw = function(ctx){
    console.log(this.asteroids);
    ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
    //this.asteroids.forEach((ele) => ele.draw(ctx));
    for(i = 0; i < NUM_ASTEROIDS; i ++){
        this.asteroids[i].draw(ctx);
    }

}

Game.prototype.moveObjects = function(){
    for (i = 0; i < NUM_ASTEROIDS; i++) {
        this.asteroids[i].move();
    }    
}



module.exports = Game;