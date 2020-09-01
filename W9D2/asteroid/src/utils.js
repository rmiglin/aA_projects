const Util = {};

Util.inherits = function(childClass, parentClass){
    Surrogate = function(){};
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate();
    childClass.prototype.constructor = childClass;
}

Util.randomVec = function(length){
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);    
}

Util.scale = function(vec, m){
    return [vec[0] * m, vec[1] * m];    
}

module.exports = Util;