class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on('click','li', (event=>{
      const $square = $(event.currentTarget);
      this.makeMove($square);
    }));
  }

  makeMove($square) {
    const pos = $square.data('pos');
    try{
      this.game.playMove(pos);} catch(e){
        alert('Try Again');
        return;
      }
      $square.addClass(this.game.currentPlayer);
      $square.text(`${this.game.currentPlayer}`);
    if(this.game.winner()){
      this.$el.after(`${this.game.currentPlayer.toUpperCase()} won the game!`);
      setTimeout(function(){
        location.reload();},2000);
    }
    if(!this.game.winner() && this.game.isOver()){
      this.$el.after('it is a draw you nerds');
      setTimeout(function(){
        location.reload();},2000);
    }
    }

  setupBoard() {
    const $ul = $('<ul>');
    $ul.addClass('board');

      for(let row = 0; row < 3; row++){
        for(let col = 0; col < 3; col++){
          let $li = $('<li>');
          $li.data('pos',[row,col]);
          $ul.append($li);
        }
      }
      this.$el.append($ul);
    }

}

module.exports = View;


