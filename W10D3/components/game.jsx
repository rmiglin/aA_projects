import React from 'react';
import * as Minesweeper from '../minesweeper';
import Board from './board';
// import 

class Game extends React.Component {
    constructor(props) {
        super(props);
 
        this.state = { board: new Minesweeper.Board(8, 10) };
        this.updateGame = this.updateGame.bind(this);
    }

    updateGame(tile, flagged) {
        flagged ? tile.toggleFlag() : tile.explore();
        this.setState({ board: this.state.board });
    }

    restartGame() {

    }

    render() {
        //debugger;
        let status;
        if (this.state.board.won()) {
            alert("You Win!");
        } else if (this.state.board.lost()) {
            alert("You Lose!");
        }
        //this is how we pass props
        return(
        <h1>
            <Board board={this.state.board} updateGame={this.updateGame}/>
        </h1>);
    }


    // return Board(this.state.board, this.updateGame)
}


export default Game;