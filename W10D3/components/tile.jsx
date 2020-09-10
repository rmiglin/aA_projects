import React from 'react';

class Tile extends React.Component {
    constructor(props) {
        super(props);
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e){
        //debugger;
        //alert("it's working");
        e.preventDefault();
        let flagged = e.altKey ? true : false;
        // let bombed = e.onClick ? true : false;
        this.props.updateGame(this.props.tile, flagged);
        // this.props.updateGame(this.props.tile, bombed);
    }
    
    render() {
        //let tileState = this.props.tile;
        let tileState;
        let status;


        if(this.props.tile.flagged){
            tileState = "🚩";
            status = "flagged";
        } else if(this.props.tile.explored){
            if (this.props.tile.bombed) {
                tileState = "💣";
                status = "bombed";
            } else {
                let count = this.props.tile.adjacentBombCount();
                tileState = count > 0 ? count : "";
                status = "explored";
            }
        } else {
            tileState = "";
            status = "unexplored";
        }

        return(
        <div className='tile'id={status} onClick={this.handleClick}> {tileState} </div> 
        )
    }
}


export default Tile;