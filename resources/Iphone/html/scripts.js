$(document).ready(function (){

        function openMain() {
             $(".body").css("display", "block");
        }

        function closeMain() {
              $(".body").css("display", "none");
        }

        window.addEventListener("message", function(event){
              if (event.data.type == "enableui") {
                        openMain();
                        $(".tlastname").html("");
                        $(".tfirstname").html("");
                        $(".tid").html("");
                }
               else if (event.data.type == "disableui") {
                        closeMain();
                }
        })
});
