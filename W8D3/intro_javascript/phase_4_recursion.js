function myRange(start, end){
    let arr = [];
    if(start > end) return [];
    return arr = arr.concat([start].concat(myRange(start + 1, end)));
}

console.log(myRange(2, 10));

function sumRec(arr){
    if (arr.length === 0){
        return 0;
    }
    return arr[0] + sumRec(arr.slice(1));
}

console.log(sumRec([1,2,3]));

function fib(n){
    
}