window.addEventListener("load", function(){
  QUnit.testDone = function(result){
    console.log('test Done');
    Lyndon.exit();
    // result.name
    // result.failed
    // result.passed
    // result.total
  };
});