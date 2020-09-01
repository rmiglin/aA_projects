function sum1(){
    let acc = 0;
    for(let i = 0; i < arguments.length; i++){
        acc += arguments[i];
    }
    return acc;
}

function sum2(...args) {
    let acc = 0;
    for (let i = 0; i < args.length; i++) {
        acc += args[i];
    }
    return acc;
}

Function.prototype.myBind = function(context, ...bindArgs){
    const arr = [];
    let that = this;
    return function(...callArgs){
        return that.apply(context, bindArgs.concat(callArgs));
    }
}



function curriedSum(numArgs){
    const numbers = [];
    function _curried(num) {
        if(numbers.length === numArgs) {
            const sum = numbers.reduce((acc, el) => acc + el);
            return sum;
        }
        numbers.push(num);
        return _curried; //return itself but does not invoke itself, so not recursion
    }
    return _curried;
}

Function.prototype.curry = function(numArgs){
    let args = 0;
    let that = this;
    function _curried(num) {
        args++;
        console.log(`number is: ${num}`);
        console.log(`number of arguments =${args}`);
        console.log(`context is ${that}`);
        if(args === numArgs) {
            return that();
        }
        return _curried;
    }
    
    return _curried;
}

// let x = function() {
//     console.log('The function worked!');
// }

// x.curry(3)(2)(3)(1);


// .apply version of curry
Function.prototype.curry = function (numArgs) {
    let arr = [];
    let that = this;
    function _curried(num) {
        arr.push(num);
        console.log(`number is: ${num}`);
        console.log(`number of arguments =${arr.length}`);
        console.log(`context is ${that}`);
        if (arr.length === numArgs) {
            console.log(arr);
            return that.apply(null, arr);
        }
        return _curried;
    }

    return _curried;
}

let aa = function() {

    let newArr = Array.from(arguments);
    const sum = newArr.reduce((acc, el) => acc + el);
    return sum;
}
aa(1, 4,2)

aa([1,4,2])
//aa.curry(3)(1)(4)(2);
//[1,4,2]