var ngrok = require("ngrok"),
    port = 9292;

ngrok.connect(port, function(err, url) {
   if (err !== null) {
       console.log(err);
       return;
   }
    
    console.log(url);
});