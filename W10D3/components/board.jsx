import React from 'react';
import Tile from './tile';



class Board extends React.Component {
    constructor(props) {
        super(props);
  
        this.renderRows = this.renderRows.bind(this);
        this.renderTiles = this.renderTiles.bind(this);
    }


    renderRows() {
        return (this.props.board.grid.map((row, i) => {
                return (
                    <div className="row" key={i}>{this.renderTiles(row)}</div>
                )
        }));
    }

    renderTiles(row) {
        return row.map((tile, j) => {
            return (
                <div className="row-tile" key={j} >
                    <Tile tile={tile} updateGame={this.props.updateGame}/>
                </div>
            )
        });
    }



    render() {
        //debugger;
        return (
            <div>
                {this.renderRows()} 
            </div>
        )
    }
}

export default Board;