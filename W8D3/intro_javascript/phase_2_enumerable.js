Array.prototype.myEach = function(callback){

    for ( let x = 0; x < this.length; x++ ) {
        callback(this[x]);
    }
 
}

[1, 2, 3].myEach(function(num){
    console.log(num + 1);
});

Array.prototype.myMap = function(callback) {

    res_arr = [];
    //closure 
    this.myEach((ele)=>{res_arr.push(callback(ele))});

    return res_arr;

};

Array.prototype.myReduce = function (func, initialValue){

    let arr = this; 

    if (initialValue === undefined){
        initialValue = arr[0];
        arr = arr.slice(1);
    }

    counter = initialValue;

    arr.myEach((ele)=>(counter = func(counter, ele)));
    
    return counter;

};


[1, 2, 3].myReduce(function(acc, el){return acc + el}, 25);