const Game = require("./game.js");

function GameView(ctx){
    this.game = new Game();
    this.context = ctx;
}

GameView.prototype.start = function(){
    //debugger;
    const func1 = function() {
        //debugger;
        this.game.draw(this.context);
        this.game.moveObjects();
    }
    setInterval(func1.bind(this), 20);
}

module.exports = GameView;