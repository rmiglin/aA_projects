Array.prototype.myEach = function(callback){

    for ( let x = 0; x < this.length; x++ ) {
        callback(this[x]);
    }
 
}

[1, 2, 3].myEach(function(num){
    console.log(num + 1);
});

Array.prototype.myMap = function(callback) {

    res_arr = []
    //closure 
    this.myEach(callback)

}


[1, 2, 3].myMap(function (num) {
    console.log(num + 1);
});