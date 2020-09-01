Array.prototype.bubblesort = function(){

    //
    let sorted = false;


    while (!sorted){
        let i = 0;
        sorted = true;
        while(i<this.length - 1){
            if (this[i] > this[i + 1]){
                temp = this[i];
                this[i] = this[i + 1];
                this[i + 1] = temp;
                sorted = false;
            }
            i++;
        } 
    }

    return this;


}

[2, 5, 3, 8, 1, 7].bubblesort();

String.prototype.substrings = function(){
    let substrings = [];
    for(let i = 0; i <= this.length -1; i ++){
        for(let j = i + 1; j <= this.length; j ++){
            substrings.push(this.slice(i, j));
        }
    }
    return substrings;
};

"hello".substrings();