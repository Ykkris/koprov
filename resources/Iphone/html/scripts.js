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
                        $(".tlastname").html(event.data.tlastname);
                        $(".tfirstname").html(event.data.tfirstname);
                        $(".tid").html(event.data.tid);
                }
               else if (event.data.type == "disableui") {
                        closeMain();
                }
        })
});
