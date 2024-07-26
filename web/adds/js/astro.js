/* Libreria de funciones para pagina pricipal de la UMDI-Sisal (C)2024 */
$.ajaxSetup ({  
    cache: false  
});

function checkAstro(){
    $.ajax({
        url: 'adds/php/astro.php',
        data: { token: token, h: "check" },
        type: 'POST',
        dataType: 'json',
        success: function (datos){
            token = datos["token"];
            if (datos["s"] == "NA"){
                //Los datos no se han solicitado aun
                getAstroData();
            }else{
                am = datos['am'];
                at = datos['at'];
                printAstro();
            }
        }
    });
}

function getAstroData(){
    $.ajax({
        url: 'https://api.weatherapi.com/v1/astronomy.json',
        data: { key: "7c8d2375a1bd4a248d2204039231209", q: "sisal", dt: mdate},
        type: 'GET',
        dataType: 'json',
        success: function (ndatos){
            setAstro(ndatos['astronomy']['astro']['sunrise'].split(" ")[0], ndatos['astronomy']['astro']['sunset'].split(" ")[0]);
        }
    });
}

function setAstro(amx, atx){
    $.ajax({
        url: 'adds/php/astro.php',
        data: { token: token, am: amx, at: atx, dt: mdate, h: "set" },
        type: 'POST',
        dataType: 'json',
        success: function (datos){
            token = datos["token"];
            if (datos["s"] == "OK"){
                am = amx;
                at = atx;
                printAstro();
            }
        }
    });
}

function printAstro(){
    $("#am").html(am);
    $("#at").html(at);

    let loc = window.location.pathname;
    if (loc == "/UMDI-Sisal/contenidos.php"){
        let p = window.location.href.split("?")[1].split("=")[1];
        getContent(p);
    }
}