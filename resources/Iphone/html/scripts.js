$(document).ready(function (){

        function openMain() {
             $(".container").css("display", "block");
        }

        function closeMain() {
              $(".container").css("display", "none");
        }
                        $(".tlastname").text(event.data.tlastname);
                        $(".tfirstname").text(event.data.tfirstname);
                        $(".tid").text(event.data.tid);

        window.addEventListener("message", function(event){
              if (event.data.type == "enableui") {
                        openMain();
                        $(".tlastname").text(event.data.tlastname);
                        $(".tfirstname").text(event.data.tfirstname);
                        $(".tid").text(event.data.tid);
                        
                }
               else if (event.data.type == "disableui") {
                        closeMain();
                }
        })
});
