$(document).ready(function (){

        function openMain() {
             $(".body").css("display", "container");
        }

        function closeMain() {
              $(".body").css("display", "none");
        }

        window.addEventListener("message", function(event){
              if (event.data.type == "enableui") {
                        $(".tlastname").html(event.data.tlastname);
                        $(".tfirstname").html(event.data.tfirstname);
                        $(".tid").html(event.data.tid);
                        openMain();
                        
                }
               else if (event.data.type == "disableui") {
                        closeMain();
                }
        })
});
