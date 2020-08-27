Array.prototype.unique = function() {
    
    let i = 0;
    let res_arr = [];

    while (i < this.length) {
        
        if (!res_arr.includes(this[i])) {
            res_arr.push(this[i]);
        }

        i++;
    }

    return res_arr; 
    
}

Array.prototype.twoSum = function() {

    let i = 0;
    let res_arr = [];

    while (i < this.length - 1){

        let j = i + 1;

        while(j < this.length){

            if (this[i] + this[j] === 0){
                res_arr.push([i, j]);
            }

            j++;
        }

        i++;
    }

    return res_arr;

}

Array.prototype.transpose = function() {

    let res_arr = [];

    for (x = 0; x < this.length; x++ ) {

            res_arr[x] = [];

        for (y = 0; y < this.length; y++ ) {

            res_arr[x].push(this[y][x]);

        }

    }

    return res_arr; 
}


