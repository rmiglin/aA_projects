const MovingObject = require("./moving_object.js");
const {Asteroid} = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./game_view.js");

// const canvas = document.getElementById('game-canvas');
// const ctx = canvas.getContext('2d');

document.addEventListener("DOMContentLoaded", function() {
    const canvas = document.getElementById('game-canvas');
    const ctx = canvas.getContext('2d');

    const flying = new GameView(ctx);
    flying.start();
});



// window.MovingObject = MovingObject;
console.log("Webpack is working!");