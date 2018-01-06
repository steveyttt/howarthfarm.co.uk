//add in express
var express = require("express");
var app = express();
var router = express.Router();
//__dirname sets the current dir then adds /views to the end
var path = __dirname + '/'

//This logs the request method to the terminal
router.use(function (req,res,next) {
  console.log("/" + req.method);
  console.log(__dirname)
  // console.log(req.baseU)
  next();
});

router.get("/",function(req,res){
    //send.file is a built in express function for passing a web request to a file
  res.sendFile(path + "index.html");
});

//app.use tells express to use the routes above
app.use("/",router);
app.use(express.static(__dirname + '/'));

app.listen(3000,function(){
  console.log("Live at Port 3000");
});
