<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Functions.aspx.cs" Inherits="Functions" %>

 <div  id="descripcion" class="bg-warning">dfgdfgddgdgdfg </div>
<!-- scripts-->
 <span class="text-muted">Ayuda </span>
<script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.js"></script>
   <script type="text/javascript"src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<script type="text/javascript">
    
    /*Prueba de Conflicto*/
    function GM_main($) {
        alert('jQuery is installed with no conflicts! The version is: ' + $.fn.jquery);
    }

    add_jQuery(GM_main, "1.7.2");

    function add_jQuery(callbackFn, jqVersion) {
        jqVersion = jqVersion || "1.7.2";
        var D = document;
        var targ = D.getElementsByTagName('head')[0] || D.body || D.documentElement;
        var scriptNode = D.createElement('script');
        scriptNode.src = 'http://ajax.googleapis.com/ajax/libs/jquery/'
                        + jqVersion
                        + '/jquery.min.js'
        ;
        scriptNode.addEventListener("load", function () {
            var scriptNode = D.createElement("script");
            scriptNode.textContent =
                'var gm_jQuery  = jQuery.noConflict (true);\n'
                + '(' + callbackFn.toString() + ')(gm_jQuery);'
            ;
            targ.appendChild(scriptNode);
        }, false);
        targ.appendChild(scriptNode);
    }

 /*Fin Prueba de conclicto*/

  
        function openNav() { document.getElementById('myNav').style.height = '100%'; }
        function closeNav() { document.getElementById('myNav').style.height = '0%'; }

        function limpiarT() {

            $('.text-muted').text("LOL LIMIAR T");
        }


        $('.text-muted').click(function () {
            $('.text-muted').text("textLOLX3333333");
        });
        $('#descripcion').click(function () {
            $('#descripcion').text("descripcionLOLX3333333");
            limpiarT();
        });
   
</script>

 




<!-- FIN ESTILOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO -->