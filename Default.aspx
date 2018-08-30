<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>
<html lang="es">

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
     
   
    
    <title>INFINITY</title>
     <!-- Bootstrap CSS2-->

    <link href="~/css2/bootstrap.min.css" rel="stylesheet"/>
    <link href="~/css2/bootstrap-responsive.min.css" rel="stylesheet"/>
    <link href="~/css2/font-awesome.css" rel="stylesheet"/>
    <link href="~/css2/font-awesome-ie7.css" rel="stylesheet"/>
    <link href="~/css2/boot-business.css" rel="stylesheet"/>
    <!-- FIN Bootstrap CSS2-->
    <!-- Bootstrap css-->
    <link href="~/css/bootstrap.min.css" rel="stylesheet"/>    
     <!-- Font awesome - iconic font with IE7 support --> 
     
    <!-- script y css fancybox// -->
   <link rel="stylesheet" href="fancybox/dist/jquery.fancybox.min.css" />
    <script src="fancybox/dist/jquery.fancybox.min.js"></script>
    <!--[endif] fancybox-->
    <link href="~/css.css" rel="stylesheet"/>
    <link rel="shortcut icon" href="~/img/favicon.ico"/>
</head>
<body>
   
   

   

    <form id="form1" runat="server">
        <!-- Inicio Frame55-->
         <div class="navbar navbar-default">
      
        <div class="navbar-header">
	    <a class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	    </a>
       
        </div>
            <!-- Menu-->
        <div class="container navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active">
            <img id="imgnav1"src="img/nav1.png" class=" imgnav" />

            </li>
            

            
          </ul>
          
          <ul class="nav navbar-nav navbar-center">            
            <li><img id="imgnav2" src="img/nav2.png" class=" imgnav"/></li>
           <!-- <li><a href="../navbar-static-top/"></a></li>-->
          </ul>
          
          <ul class="nav navbar-nav navbar-right">            

            <%--<li><a href="http://10.1.201.3:8080/INFINITY/login/index.php"  class="" ><span><img src="img/Politicas.png" class="mmk" /></span></a></li>--%>
          
              
              <li><br/><a href="#"  class="denuncia imgbav" >Reporta</a></li>
              <li><br/><a href="#"  class="denuncia imgbav" >Denuncia</a></li>
              <li><br/><a href="http://10.1.201.3:8080/INFINITY/login/index.php"  class="denuncia imgbav" >Ingresa Aqui</a></li>
            
          </ul>
        </div><!-- Fin Menu-->
    </div>


   
    
    <div class="container">

          <!-- Menu-->
        <div class="container navbar-collapse collapse menu">
          <ul class="nav navbar-nav navbar-center menuul">
            <%--  <li title="Proximamente..."><a href="#" class="menuli">CONOCENOS</a></li>--%>
              <li><a class="inline2 menuli2" href="#inline_content2"  >CAPACITATE</a></li>




              <li title="Proximamente..."><a href="#" class="menuli">COMERCIAL</a></li>
              <li title="Proximamente..."><a href="#" class="menuli2">RRHH</a></li>
              <li title="Proximamente..."><a href="#" class="menuli">VOLUNTARIO</a></li>
              <li title="Proximamente..."><a href="#" class="menuli2">COLABORADORES</a></li>
              <li title="Proximamente..."><a href="#" class="menuli">BENEFICIOS</a></li> 
          </ul>          
               
         
        </div><!-- Fin Menu-->  


   <br/>    
    <div class="row-">
    <div class="col-xs-12 col-sm-9 col-md-9">
        <!-- Carousel================================================== -->
    <div id="myCarousel" class="carousel slide">
      <!-- Indicators -->
      <ol class="carousel-indicators">
           <%   
             //public class zxcxzczxc{  };                
                                                        
     string nombre = "";
     string strCon2 = @"Server=10.1.1.199;Uid=sa;Pwd=Server01;DataBase=blog";
     string QueryTipoVacante2 = "SELECT * FROM carousel WHERE [DELETE]!=1 ";//ORDER BY id DESC
     System.Data.SqlClient.SqlDataAdapter da2 = new System.Data.SqlClient.SqlDataAdapter(QueryTipoVacante2, strCon2);
     System.Data.DataTable dt2 = new System.Data.DataTable();
     da2.Fill(dt2);
     int count = dt2.Rows.Count;
     for (int i = 0; i < count; i++)
     {
         nombre = dt2.Rows[i]["Tema"].ToString();
     
                          %>

        <li data-target="#myCarousel" data-slide-to="<% Response.Write(i); %>" class="<% if (i == 0) { Response.Write("active"); } else { } %>"></li>

          <% } %>
       

      </ol>
      <div class="carousel-inner">

          <% for (int i = 0; i < count; i++)
           {
         nombre = dt2.Rows[i]["Imagen"].ToString(); %>
        <div class="item <% if (i == 0) { Response.Write("active"); }  %>">          
          <a data-fancybox="gallery" class="" href="img/<% Response.Write(nombre); %>">
          <img src="img/<% Response.Write(nombre); %>" style="width:100%;height:100%" class="img-responsive oom"/>
          </a>
        </div>       
        <%} %>
      </div>
      <!-- Controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="icon-prev"></span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="icon-next"></span>
  </a>  
</div>
<!-- /.carousel -->
        
    </div>
    <div class="col-xs-12 col-sm-3 col-md-3 text-center">  
      <a data-fancybox="gallery" class="" href="img/img4.png"><img src="img/img4.png"class="img-responsive img-circle2"/></a>
      <p class="p-circle2">Cumpleañeros del mes.</p> 
    </div>
</div>
    
</div>

<hr class="featurette-divider">

<!-- ================================================== -->

<div class="container marketing">


  <div class="row">
 
       
             
      <%   
        //  ArrayList dddd = (ArrayList)Session["dddd"];
          string tema = "";
          string imagen = "";
          string adjunto = "";
          string contenido = "";
     string strCon = @"Server=10.1.1.199;Uid=sa;Pwd=Server01;DataBase=blog";
     string QueryTipoVacante = "SELECT  * FROM blog WHERE [DELETE]!=1 ORDER BY ID DESC ";//where id = 5 ORDER BY id DESC
     System.Data.SqlClient.SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter(QueryTipoVacante, strCon);
     System.Data.DataTable dt = new System.Data.DataTable();
     da.Fill(dt);
     count = dt.Rows.Count;
     for (int i = 0; i < count; i++)
     {
         tema = dt.Rows[i]["tema"].ToString();
         imagen = dt.Rows[i]["imagen"].ToString();
         adjunto = dt.Rows[i]["adjunto"].ToString();
         contenido = dt.Rows[i]["contenido"].ToString();

         //target="_blank"  

         Session["dddd"] = dt.Rows[i]["tema"];         
        //  String TestString = "This is a <Test String>.";
//String EncodedString = Server.HtmlEncode(TestString);
//Label1.Text = HttpUtility.HtmlDecode(dbValue);    
                                 
    %>
     
    <div class="col-xs-12 col-sm-6 col-md-4 text-center">
        <a data-fancybox="gallery" class="" href="img/<% Response.Write(imagen); %>">
             <img class="img-circle2" src="img/<% Response.Write(imagen); %>">
        </a>
        <p class="p-circle2"><% Response.Write(tema); %>  
        
            
            <!-- <a class='inline' href="#inline_content" onclick="cv('<% //Response.Write(dt.Rows[i]["id"].ToString()); %>')">ver</a>
          -->
           
        </p>     
    </div> 


   <% } %>




  </div><!-- /.row -->
    <hr class="featurette-divider">
  <!-- /END THE FEATURETTES -->

</div><!-- /.container -->
   <!-- Start: FOOTER -->
    <footer class="footer-con">      
     
      <div >
        <p class="footer-P">
          &copy; 2017 INFINITY, Inc. All Rights Reserved. 
        </p>
      </div>
    </footer>
    <!-- End: FOOTER -->
   
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <!-- iNICIO js-->
    <script src="js/bootstrap.min.js"></script>
     <script type="text/javascript" src="js2/boot-business.js"></script>
    <!-- Fin js-->
        <!-- Fin Frame-->

    
    </form>

    <%--PopUpHTML.Show();
    PopUpHTML.SetWindowContentHtml("");--%>

   
   <!-- Content blog-->
    <link rel="stylesheet" href="colorbox.css" />
	<script src="jquery.min.js"></script>
	<script src="jquery.colorbox.js"></script>

   


      

     
    <!-- Div content-->
		<div style='display:none'>
			  <div id='inline_content' style='padding:10px; background:#fff;'>
			      <asp:Label Text="0" ID="txt3" runat="server"/>
                  <asp:Label Text="21" ID="fcf" runat="server"/>
                <br />
                  <div id="txt" runat ="server">div-lol</div> 
                
                <br />

                   <!--scripts -->

    <script>
        $(document).ready(function () {            //Size de ventana
            $(".inline").colorbox({ inline: true, width: "90%", height: "90%" });
        });

        function htmlEntities(str) {
            return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
        }

        //asignando valores
        function cv(y) {
            $("#fcf").text(y);
            

            cvc2(y);
        }//fin funcion


        //cvs2

        function cvc2(y) {

            /*probando usar sql //////////////////////////////////////////////////////////////////////////*/
               <%   
       // int yy = Convert.ToInt16(y);
          string contenido = "";
     string strCon = @"Server=10.1.1.199;Uid=sa;Pwd=Server01;DataBase=blog";
     string QueryTipoVacante = "SELECT  * FROM blog WHERE id ="+fcf.Text.ToString();//where id = 5 ORDER BY id DESC
     System.Data.SqlClient.SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter(QueryTipoVacante, strCon);
     System.Data.DataTable dt = new System.Data.DataTable();
     da.Fill(dt);
    int  count = dt.Rows.Count;
    for (int i = 0; i < count; i++)
    {
        contenido = dt.Rows[i]["contenido"].ToString();
    }
    

 
                                 
   %>

            /*fin probando usar sql ----------------------------------------------------------------------------------*/

            //  $("#txt3").text(dt.Rows[i]["contenido"].ToString());//por aqui 
   
            $("#txt").html('<%= HttpUtility.JavaScriptStringEncode(contenido,false) %>');         
           

            $(".inline").colorbox({ inline: true, width: "90%", height: "90%" });
        }


        //fin cvc2

       
		</script>

  


         
    <!-- Fin scripts-->
            			
			</div>
        </div>
           <!-- fin Div content -->    









   <!-- ////////////////////////////// mmmm pal blog sql tendrias que incluir este script pa  cada pos
                                         y que cada post cargue su propio content
                                    Asi; nombre+id   = contentXX !!!-->
     <!-- Div content2-->
		<div style='display:none'>
			  <div id='inline_content2' style='padding:10px; background:#fff;'>
			      <div id="cal22" runat ="server"> 
                      <iframe src="https://calendar.google.com/calendar/embed?src=es.hn%23holiday%40group.v.calendar.google.com&ctz=America/Tegucigalpa" style="border: 0" width="1020px" height="720px" frameborder="0" scrolling="no"></iframe>
			      </div> 
              <!--scripts -->
        <script>
            $(document).ready(function () {            //Size de ventana
                $(".inline2").colorbox({ inline: true, width: "90%", height: "90%" });
            });

            function capacitate() {
                $(".inline2").colorbox({ inline: true, width: "90%", height: "90%" });
               // $("#txt").html(y);
               
            }
        </script>
<!-- Fin scripts-->           			
			</div>
        </div>
           <!-- fin Div content2 -->  
   <!-- ////////////////////////////// -->



    <!--Div Conten blogt -->
   
      


</body>
</html>
