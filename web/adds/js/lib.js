/* Libreria de funciones para pagina pricipal de la UMDI-Sisal (C)2024 */
let to;

function rand() { // min and max included 
    return Math.floor(Math.random() * 8 + 1);
}

function getContent(p){
    $.ajax({
        url: 'adds/php/getcontent.php',
        data: { token: token, h: "check", page: p },
        type: 'POST',
        dataType: 'json',
        success: function (datos){
            token = datos["token"];
            if (datos["s"] == "NA"){
                displayUayPage();
            }else{
                $("#ruta").html(datos['ruta']);
                $("#bgct").css("background-image", "url('"+datos['bg']+"')");
                $("#introc").html(datos['tit']);
                $("#data").html(datos['cont']);
            }
        }
    });
}

$(function(){
    let r = rand();
    let loc = window.location.pathname;
    if(loc == "/UMDI-Sisal/" || loc == "/UMDI-Sisal/index.php"){
        $("#bgc").css("background-image", "url('imagenes/f0"+r+"e.png')");
    }
    
    checkClima();

    $("#mtext").css("height",($(document).height()-180)+"px");

    $(window).resize(function() {
        $("#mtext").css("height",($(document).height()-180)+"px");
    });

    $("#iw").on("click", function(){
        $("#cwa").css("right", "0px");
        to = setTimeout(()=>{ clearTimeout(to); $("#cwa").css("right", "-370px"); }, 3000);
    });

    for (let i = 1; i<12; i++){
        $("#m"+i).on("mouseover", ()=>{
            $("#mtext").css("left", "65px");
            $("#m"+i+" img").addClass("svg-color-blanco");
            $("#m"+i+" img").css("background-color", "#947346 !important;");
            $("#mt"+i).addClass("tblanco");
        });
        $("#m"+i).on("mouseout", ()=>{
            $("#mtext").css("left", "-200px")
            if (activo != i){
                $("#m"+i+" img").removeClass("svg-color-blanco");
                $("#mt"+i).removeClass("tblanco");
            }
        });
        $("#m"+i).on("click", function(){
            $("#mt"+i)[0].click();
        })    
    }

    $("#tm").on("click",()=>{
        $("#formacompleta").removeClass("zmenosuno");
    });
});