var MyCity = function() {};

MyCity.prototype.whichCity = function(city) {
    return this.printBefore() + " " + city;
};

MyCity.prototype.printBefore = function() {
    return "Name Of My City is ";
};

function checkReturnString() {
  return "This is return string";
}

