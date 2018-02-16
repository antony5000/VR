<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

        <script type="text/javascript">
        function reporte(ruta) {
            location.href = "default.aspx?p=" + ruta;
        }
    </script>
    
   <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>
<body>
 <form id="form1" runat="server">

<nav class="white" role="navigation">
    <div class="nav-wrapper container">
      <a id="logo-container" href="#" class="brand-logo">MERINO</a>
      <ul class="right hide-on-med-and-down">
        <li><a href="#">MERSAN</a></li>
        <li><a href="#">SOLUCIONES</a></li>
        <li><a href="#">IGCAR</a></li>
      </ul>

      <ul id="nav-mobile" class="side-nav">
          <li><a href="#">MERSAN</a></li>
          <li><a href="#">SOLUCIONES</a></li>
          <li><a href="#">IGCAR</a></li>
      </ul>
      <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>
  </nav>

<div id="Panel" visible="false" runat="server">
  <div id="index-banner" class="parallax-container">
    <div class="section no-pad-bot">
      <div class="container">
        <br><br>
        <h1 class="header center teal-text text-lighten-2">VISOR DE REPORTE 3.0</h1>
        <div class="row center">
          <h5 class="header col s12 light" style="color: #795548">Gestor compuesto por un conjunto de técnica y herramientas para transformar
              los datos en informacion util para el analisis de negocio empresarial</h5>
        </div>
        <!--<div class="row center">
          <a href="http://materializecss.com/getting-started.html" id="download-button" class="btn-large waves-effect waves-light teal lighten-1">Get Started</a>
        </div>-->
        <br><br>

      </div>
    </div>
    <div class="parallax"><img src="image/IMAGE2.jpg" alt="Unsplashed background img 1"></div>
  </div>

  <div class="container">
    <div class="section">

      <!--   Icon Section   -->
      <div class="row">
        <div class="col s12 m4">
          <div class="icon-block">  
            <h2 class="center brown-text"><i class="material-icons">open_with</i></h2>
            <h5 class="center">Accesibilidad a la información</h5>

            <p class="light center">Los datos son la fuente principal de este concepto. Lo primero que deben garantizar este tipo de herramientas y técnicas será el acceso de los usuarios a los datos con independencia de la procedencia de estos.</p>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center brown-text"><i class="material-icons">flash_on</i></h2>
            <h5 class="center">Apoyo en la toma de decisiones</h5>

            <p class="light center">Se busca ir más allá en la presentación de la información, de manera que los usuarios tengan acceso a herramientas de análisis que les permitan seleccionar y manipular sólo aquellos datos que les interesen.</p>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center brown-text"><i class="material-icons">group</i></h2>
            <h5 class="center">Mejorar la experiencia del usuario</h5>

            <p class="light center">Se busca mejorar los elementos relativos a la interacción del usuario con el dispositivo, con la finalidad de generar una perceptiva positiva y a la ves retroalimentar el sistema con los aporte de los usuarios finales.</p>
          </div>
        </div>
      </div>

    </div>
  </div>

  <div class="parallax-container valign-wrapper">
    <div class="section no-pad-bot">
      <div class="container">
        <div class="row center">
          <h5 class="header col s12 light"> Sigamos Mejorando Nuestro Modelo de Negocio</h5>
        </div>
      </div>
    </div>
    <div class="parallax"><img src="image/IMAGE3.png" alt="Unsplashed background img 3"></div> 
  </div>
</div>

<div id="ReportServices" visible="true" runat="server" class="container" style="background-color: white; float:none; margin: 0 auto;">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
         <rsweb:ReportViewer ID="ReportViewerRV" runat="server" SizeToReportContent="True" ShowToolBar="False" ShowPrintButton="False" ShowRefreshButton="False" ShowZoomControl="False" WaitMessageFont-Names="Calibri" WaitMessageFont-Size="14pt" Style="z-index:99;" Height="" Width="" BackColor="White" SplitterBackColor="White" ToolBarItemHoverBackColor="Azure" WaitMessageFont-Underline="True" BorderColor="White">     
         </rsweb:ReportViewer> 
</div>
  </form>
      <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>   
</body>
</html>
