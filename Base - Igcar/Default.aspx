<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel='shortcut icon' type='image/x-icon' href="Imagen/cubeAV.png" />
    <link href="css/metro.css" rel="stylesheet" />
    <link href="css/metro-icons.css" rel="stylesheet" />
    <script src="js/jquery-2.1.3.min.js"></script>
    <script src="js/metro.js"></script>
    <link href="css/Style.css" rel="stylesheet" />
    <link href="css/Fuente.css" rel="stylesheet" />
    <title>Visor de Reporte</title>

    <script type="text/javascript">
        function reporte(ruta) {
            location.href = "default.aspx?p=" + ruta;
        }
    </script>
    <script type="text/javascript">
        window.onload = function () {
            var reportViewer = window.frames['ReportFramectl00_cphData_rvReporte'];
            if (reportViewer != null) {
                reportViewer.window.frames['report'].document.getElementById('oReportCell').style.width = '100%';
            }
        }
    </script>
    <style>
        #canvas-wrap {
            position: relative;
        }
        /* Make this a positioned parent */
        #overlay {
            position: absolute;
            top: 20px;
            left: 30px;
        }

        #canvas-wrap {
            position: relative;
            width: 800px;
            height: 600px;
        }

            #canvas-wrap canvas {
                position: absolute;
                top: 0;
                left: 0;
                z-index: 0;
            }
        .reporte {
        margin: 0 auto;
        }

        table {
        float: none;
margin: 0 auto;
        }

    </style>

</head>
<body style="background-color: #EFEAE3;">
    <form id="form1" runat="server">
        <div class="">
            <%--Encabezado--%>
            <div class="grid condensed" style="margin: 0px; background: #56586B;">
                <div class="row cells4">
                    <div class="cell colspan2" style="color: #ffffff;">
                        <img src="Imagen/IGCAR.png" style="width:65px; margin-left:20px; float: left;"/>
                        <h2 style="font-family: 'ERASBD'; font-size:3rem; margin: 0px; float: left; margin-top: 25px; font-size: 1.8rem;">Igcar de Venezuela</h2>
                    </div>
                    <div class="cell colspan2">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Cerrar_Click"><span class="mif-cross" style="color: #ffffff; float: right; background: #c75050; font-size: 0.5rem; padding: 6px 2px;"></span> </asp:LinkButton>
                        <h5 style="float: right; margin-left: 10px; margin-right: 10px; color: #ffffff; margin-top: 14px; margin-bottom: 14px;">
                         <asp:Label ID="LbUsuario" runat="server" Text="Antony Barreto" style="font-family:Calibri,Calibri,Calibri"></asp:Label></h5>
                        <span class="mif-user mif-2x" style="color: white; float: right; padding: 6px 2px; background: darkgray;"></span>
                    </div>
                </div>
            </div>
            <%--Menu--%>
            <ul class="m-menu" style="background: #56586B;">
                  <%--Inicio--%>
                <li>
                    <a href="Default.aspx">Inicio</a>
                    <div class="m-menu-container" data-role="dropdown"></div>
                </li>
                <%--Compras--%>
                <%--<li>
                    <a href="#" class="dropdown-toggle">Compras</a>
                    <div class="m-menu-container" data-role="dropdown">
                        <asp:Panel ID="pnCompra" runat="server" Visible="false">
                            <div style="padding-top:10px;">
                            <ul class="t-menu">
                                    <li id="pnCompraI" runat="server" visible="false"><a href="#" class="dropdown-toggle">Recepción</a>
                                        <ul class="t-menu" data-role="dropdown">
                                            <li><a href="#" class="dropdown-toggle" style="width: 190px;">Por Articulo</a>
                                                <ul class="t-menu" data-role="dropdown">
                                                    <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Recepcion/Recepcion Dia')">Dia</a></li>
                                                    <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Recepcion/Recepcion Semana')">Semana</a></li>
                                                    <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Recepcion/Recepcion Mes')">Mes</a></li>
                                                    <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Recepcion/Recepcion Ano')">Año</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#" style="width: 190px; cursor:pointer;" onclick="reporte('Operativo/Recepcion/OC Estatus')">Ordenes de Compras</a></li>
                                        </ul>
                                    </li>
                                    <li id="pnCompraII" runat="server" visible="false">
                                        <a href="#" class="dropdown-toggle">Cuentas Por Pagar</a>
                                        <ul class="t-menu" data-role="dropdown" style="top: -100%;">
                                            <li class="disabled"><a href="#" style="width: 190px;">Proveedor Por Vencer</a></li>
                                            <li><a href="#" style="width: 190px;">Proveedor Vencidos</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </asp:Panel>
                        <div style="width: 100%; height: 4px; top: 98%; background-color: rgba(27, 161, 226, 0.82);"></div>
                    </div>
                </li>--%>
                <%--Ventas--%>
                <%-- <li>
                    <a href="#" class="dropdown-toggle">Ventas</a>
                    <div class="m-menu-container" data-role="dropdown">
                        <asp:Panel ID="pnVenta" runat="server" Visible="false">
                            <div style="padding-top:10px;">
                            <ul class="t-menu">           
                                <li id="pnVentaI" runat="server" visible="false"><a href="#" class="dropdown-toggle">Despacho </a>
                                 <ul class="t-menu" data-role="dropdown">   
                              
                                        <li><a href="#" class="dropdown-toggle" style="width: 180px;">Por Producto</a>
                                            <ul class="t-menu" data-role="dropdown">
                                                <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Despacho/Despacho Dia')">Dia</a></li>
                                                <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Despacho/Despacho Semana')">Semana</a></li>
                                                <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Despacho/Despacho Mes')">Mes</a></li>
                                                <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Despacho/Despacho Ano')">Año</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#" class="dropdown-toggle" style="width: 180px;">Por Clientes</a>
                                            <ul class="t-menu" data-role="dropdown" style="top: -100%;">
                                                <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Despacho/Despacho Dia Cliente')">Dia</a></li>
                                                <li><a href="#" class="dropdown-toggle" style="width: 180px;">Semanal Clases</a>
                                                    <ul class="t-menu" data-role="dropdown" style="top: -100%;">
                                                        <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Despacho/Despacho Semana Cliente VI')">VIP</a></li>
                                                        <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Despacho/Despacho Semana Cliente I')">Granja</a></li>
                                                        <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Despacho/Despacho Semana Cliente V')">Vinculado</a></li>
                                                        <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Despacho/Despacho Semana Cliente III')">Agrotienda</a></li>
                                                        <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Despacho/Despacho Semana Cliente II')">Distribuidor</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Despacho/Despacho Mes Cliente')">Mes</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Despacho/Despacho Cliente Anual Mejor')">10 Mejores Clientes</a></li>
                                      </ul>
                                </li>                                
                                <li id="pnVentaII" runat="server" visible="false">                           
                                  <a href="#" class="dropdown-toggle">Cuentas Por Cobrar </a>
                                  <ul class="t-menu" data-role="dropdown" style="top: -100%;">
                                        <li><a href="#" style="width: 180px;">Clientes Por Vencer</a></li>
                                        <li><a href="#" style="width: 180px;">Clientes Vencidos</a></li>
                                    </ul>
                                </li>      
                            </ul>
                            </div>
                        </asp:Panel>
                        <div style="width: 100%; height: 4px; top: 98%; background-color: rgba(27, 161, 226, 0.82);"></div>
                    </div>
                </li>--%>
                <%--Inventario--%>
                <li>
                    <a href="#" class="dropdown-toggle">Inventario</a>
                    <div class="m-menu-container" data-role="dropdown">
                        <asp:Panel ID="pnInv" runat="server" Visible="false">
                               <div style="padding-top:10px;">
                            <ul class="t-menu">
                               <%-- <li id="pnInvI" runat="server" visible="false"><a href="#" class="dropdown-toggle">Consumo</a>
                                    <ul class="t-menu" data-role="dropdown">
                                        <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Inventario/Consumo Dia')">Dia</a></li>
                                        <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Inventario/Consumo Semana')">Semana</a></li>
                                        <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Inventario/Consumo Mes')">Mes</a></li>
                                        <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Inventario/Consumo Ano')">Año</a></li>
                                    </ul>
                                </li>--%>
                                <li id="pnInvII" runat="server" visible="false"><a href="#" class="dropdown-toggle">Stock</a>
                                    <ul class="t-menu" data-role="dropdown" style="">
                                        <li><a href="#" style="width: 240px; cursor:pointer;" onclick="reporte('Igcar/Inventario/Inventario Actual MP Sitio')">Articulos</a></li>
                                        <li><a href="#" style="width: 240px; cursor:pointer;" onclick="reporte('Igcar/Inventario/Inventario medicado')">Aminoacidos y Pre-mezclado</a></li>
<%--                                        <li><a href="#" style="width: 190px; cursor:pointer;" onclick="reporte('Operativo/Inventario/Inventario Actual Categorias')">Material de Empaque</a></li>
                                        <li><a href="#" style="width: 190px; cursor:pointer;" onclick="reporte('Operativo/Inventario/Inventario Actual PT')">Producto Terminado</a></li>
                                        <li><a href="#" style="width: 190px; cursor:pointer;" onclick="reporte('Operativo/Inventario/Inventario Actual Insumo Sitio LOTE')">Insumos de Seguridad</a></li>--%>
                                    </ul>
                                </li>
                            </ul>
                                   </div>
                        </asp:Panel>
                        <div style="width: 100%; height: 4px; top: 98%; background-color: rgba(27, 161, 226, 0.82);"></div>
                    </div>
                </li>
                 <%--Produccion--%>
              <%--  <li>
                    <a href="#" class="dropdown-toggle">Produccion</a>
                    <div class="m-menu-container" data-role="dropdown">
                        <asp:Panel ID="pnProd" runat="server" Visible="false">
                        <div style="padding-top:10px;">
                            <ul class="t-menu">
                                <li id="pnProdI" runat="server" visible="false"><a href="#" class="dropdown-toggle">Dynamics GP</a>
                                    <ul class="t-menu" data-role="dropdown">
                                  
                                        <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Produccion/Proyeccion Mes')"><p style="float:left; margin: 0px;">Mes</p> <p style="float: right; margin: 0px;">Proyección</p></a></li>
                                        <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Produccion/Produccion Ano GP')">Año</a></li>
                                    </ul>
                                </li>
                                <li id="pnProdII" runat="server" visible="false"><a href="#" class="dropdown-toggle">Sicbatch</a>
                                    <ul class="t-menu" data-role="dropdown" style="top: -100%;">
                                        <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Produccion/Produccion Dia')">Dia</a></li>
                                        <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Produccion/Produccion Semana')">Semana</a></li>
                                        <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Produccion/Produccion Mes')">Mes</a></li>
                                        <li><a href="#" style="width: 180px; cursor:pointer;" onclick="reporte('Operativo/Produccion/Produccion Ano')">Año</a></li>
                                    </ul>
                                </li>
                                <li id="pnProdIII" runat="server" visible="false"><a href="#" class="dropdown-toggle">Control Parada</a>
                                    <ul class="t-menu" data-role="dropdown" style="top: -200%;">
                                        <li><a href="#" style="width: 190px; cursor:pointer;" onclick="reporte('Operativo/Mantenimiento/Paradas de Produccion')"><p style="float:left; margin: 0px;">Mes</p> <p style="float: right; margin: 0px;">Incidencias</p> </a></li>
                                    </ul>
                                </li>
                                <li id="pnProIV" runat="server" visible="false"><a href="#" class="dropdown-toggle">Comparación</a>
                                    <ul class="t-menu" data-role="dropdown" style="top: -300%;">
                                        <li><a href="#" style="width: 190px; cursor:pointer; " onclick="reporte('Operativo/Produccion/Produccion Turno Dia')"><p style="float:left; margin: 0px;">Dia</p><p style="float: right; margin: 0px;">Turnos</p></a></li>
                                    
                                        <li><a href="#" style="width: 190px; cursor:pointer;" onclick="reporte('Operativo/Produccion/Produccion Mes SICBvsGP')"> <p style="float:left; margin: 0px;">Mes</p> <p style="float: right; margin: 0px;">GP vs SICB</p></a></li>
                                  
                                    </ul>
                                </li>
                            </ul>
                         </div>
                        </asp:Panel>
                        <div style="width: 100%; height: 4px; top: 98%; background-color: rgba(27, 161, 226, 0.82);"></div>
                    </div>
                </li>--%>
            </ul>     
             <%--CUERPO DE PAGINA VISUALIZADOR DE REPORTE--%>
            <div class="main-content clear-float" style="background-color: white; float:none; margin: 0 auto; overflow: auto;"> 
                <asp:Image ID="Imagen1" runat="server" ImageUrl="~/Imagen/buque6.png" Style="width:100%; height:auto;"/>
                <asp:Panel ID="Panel1" runat="server" Visible="false" Style="background-color: #ffffff; padding:17px;"></asp:Panel>
                <asp:ScriptManager ID="ScriptManager1" runat="server" OnLoad="bt_Click" OnUnload="bt_Click"></asp:ScriptManager>  
                <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="420000"></asp:Timer>
               <%-- <rsweb:ReportViewer ID="ReportViewerRV" runat="server" SizeToReportContent="True" ShowToolBar="False" ZoomPercent="80" ShowPrintButton="False" ShowRefreshButton="False" ShowZoomControl="False" WaitMessageFont-Names="Calibri" WaitMessageFont-Size="14pt" Style="z-index:99;" OnInit="bt_Click" OnLoad="bt_Click" BackColor="White" SplitterBackColor="White" ToolBarItemHoverBackColor="Azure" WaitMessageFont-Underline="True" BorderColor="White">
                </rsweb:ReportViewer> --%>    
                    <rsweb:ReportViewer ID="ReportViewerRV" runat="server" SizeToReportContent="True" ShowToolBar="False" ZoomPercent="80" ShowPrintButton="False" ShowRefreshButton="False" ShowZoomControl="False" WaitMessageFont-Names="Calibri" WaitMessageFont-Size="14pt" Style="z-index:99;" Height="" OnInit="bt_Click" OnLoad="bt_Click" Width="" BackColor="White" SplitterBackColor="White" ToolBarItemHoverBackColor="Azure" WaitMessageFont-Underline="True" BorderColor="White">
                </rsweb:ReportViewer> 
                 <asp:Panel ID="Panel2" runat="server" Visible="false" Style="background-color: #ffffff; padding:19px;"></asp:Panel>    
                <div style="padding:1px;"></div>   
               </div>
            <%--Herramienta del zoom--%>
            <div class="cell" style="width:172px; padding:5px; background:none; float: right; box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.25);">
                <asp:Button ID="bt" runat="server" Text="Ok" OnClick="bt_Click" CssClass="bt" Style="padding: 0px; margin:0px; height: 24px; width: 30px; float: right; z-index:99;" />
                <input type="text" id="slider_input" name="user_login" runat="server" style="height:24px; width:32px; float: right; border:0px; padding:0px; background:#56586B; color:white;" readonly="true" />
            <div class="slider large" 
                data-on-change="dropValueToInput";
                data-role="slider";
                data-max-value="100"; 
                data-min-value="50"; 
                float: right; 
                style="width:100px; margin:0px; background-color:#56586B;">
                </div>
            </div>               
            <script>
                function dropValueToInput(value, slider) {
                    $("#slider_input").val(value);
                }
                </script>   
        </div>
      
        <%--PIE DE PAGINA--%>
        <footer style="padding-bottom: 30px;">
            <div class="container">
                <div class="padding2">
                    <div class="grid responsive" style="margin-bottom: 0px;">
                        <div class="row cells4">
                            <div class="cell">
                                <img src="Imagen/cubeAV.png" style="width: 120px; height: 120px; float: right;" />
                            </div>
                            <div class="cell colspan2 padding2 no-padding-top no-padding-bottom">
                                <h3 style="color:slategray; float:left;">Visor de Reporte </h3>
                                <h6 style="color:slategray; float: left; margin-top: 24px; margin-left: 7px;margin-top: 26px;margin-bottom: 0px;">Version 2.0</h6>
                                <p class="text-secondary" style="color:slategray; clear:both;">
                                    Sitio privado diseñado para visualizar las actividades, movimientos y transacciones de los sistemas de control internos de nuestra organización. 
                                  <%--  Sitio creado para visualizar los reportes relacionado con los movimientos y transacciones de los Sistemas Administrativos de la Corporación.--%>
                                </p>
                                <div>
                                    <span class="tag info" style="background:#1f497d;">Propiedad:</span>
                                    <span class="tag success">Seguridad</span>
                                    <span class="tag success">Flexibilidad</span>
                                    <span class="tag success">Rapidez</span>
                                    <span class="tag success">Innovación</span>
                                </div>
                               <%-- <div>
                            <a href="https://www.jetbrains.com/phpstorm/" title="license for PhpStorm"><img src="images/jetbrains.png" style="width: 100px" ></a>
                            <a href="http://www.microsoft.com/bizspark/default.aspx" title="Bizspark Startup"><img src="images/MSFT_logo_png.png" style="width: 100px" ></a>
                        </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>       
        </footer>
    </form> 
       <%--PIE DE PAGINA Fijo---%>
    <div class="align-right" style="bottom:0; padding-bottom: 0px;position: fixed; text-align:right; width: 100%; background: #56586B; color: white; padding:2px; z-index:99;"> 
        <p style="text-align:center; width:50%; float: left; margin:0px; font-family:'TradeGothicLTStd-Bd2'; font-size:10px;"><a <%--href="http://www.mersan.com.ve" target="_blank";--%> style="color:white; text-decoration: underline; font-family: 'ERASBD'; font-size:20px; color:#B7B7B7; font-size:0.875rem; padding-left:5px;">Igcar de Venezuela</a> Todos Los Derechos Reservados © 2015  </p> 
        <p style="text-align:center; width:50%; float: left; margin:0px; font-family:'TradeGothicLTStd-Bd2'; font-size:10px; padding-top:8px;">Gestor Desarrollado 100% Por El Departamento de Sistemas</p>
    </div>
</body>
</html>
