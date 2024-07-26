/* Libreria de funciones para pagina pricipal de la UMDI-Sisal (C)2024 */
$.ajaxSetup ({  
    cache: false  
});

function checkClima(){
    $.ajax({
        url: 'adds/php/clima.php',
        data: { token: token, h: "check" },
        type: 'POST',
        dataType: 'json',
        success: function (datos){
            token = datos["token"];
            if (datos["s"] == "NA"){
                //Los datos no se han solicitado aun
                getClimaData();
            }else{
                temp = datos['temp'];
                pro = datos['pro'];
                img = datos['img'];
                st = datos['st'];
                hr = datos['hr'];
                uv = datos['uv'];
                printClima();
            }
        }
    });
}

function getClimaData(){
    $.ajax({
        url: 'https://api.weatherapi.com/v1/current.json',
        data: { key: "7c8d2375a1bd4a248d2204039231209", q: "Sisal", aqi: "no", lang: "es" },
        type: 'GET',
        dataType: 'json',
        success: function (ndatos){
            //tratamiento de los datos
            var t = ndatos['current']['temp_c'].toString();
            var f = ndatos['current']['last_updated'].split(" ")[0];
            var l = ndatos['current']['last_updated'].split(" ")[1];
            var p = ndatos['current']['condition']['text'];
            var i = ndatos['current']['condition']['icon'].split("/");
            var g = i[5] + "/" +i[6].split(".")[0];
            var h = ndatos['current']['humidity'].toString();
            var s = ndatos['current']['feelslike_c'].toString();
            var u = ndatos['current']['uv'].toString();
            setClima(f, l, t, p, g, h, s, u);
        }
    });
}

function setClima(afx, alx, atx, apx, agx, ahx, asx, aux ){
    $.ajax({
        url: 'adds/php/clima.php',
        data: { token: token, af: afx, al: alx, at: atx, ap: apx, ag: agx, ah: ahx, as: asx, au: aux, h: "set" },
        type: 'POST',
        dataType: 'json',
        success: function (datos){
            token = datos["token"];
            if (datos["s"] == "OK"){
                temp = atx;
                pro = apx;
                img = agx;
                st = asx;
                hr = ahx;
                uv = aux;
                printClima();
            }
        }
    });
}

function printClima(){
    $("#img_pronostico").attr("src","imagenes/clima/"+img+".svg");
    $("#temp").html(temp);
    $("#pronostico").html(pro);
    $('#st').html(st);
    $('#hr').html(hr);
    $("#guv").attr("src","imagenes/uv/uv-index-"+uv+".svg");
    checkAstro();
}