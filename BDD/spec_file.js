describe("City", function() {

    it("check call of the printBefore() function", function() {
        var printStatement = new MyCity();
        
        spyOn(printStatement, "printBefore");
       
        
        printStatement.whichCity("Pune");
        
        expect(printStatement.printBefore).toHaveBeenCalled();
        
        
        
  });
  
  it("check argument of whichCity function", function () {
  
  var checkArgument = new MyCity();
  
   spyOn(checkArgument, "whichCity");
   
   checkArgument.whichCity("Pune");
   
   expect(checkArgument.whichCity).toHaveBeenCalledWith("Pune");
   
    expect(checkArgument.whichCity).not.toHaveBeenCalledWith("Mumbai");
  
  });
  
  
  it("check for return string of function " , function (){
  
  expect(checkReturnString()).toEqual("This is return string");
  
  
  });
});
