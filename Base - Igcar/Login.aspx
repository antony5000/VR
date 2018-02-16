<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content=" Sitio creado para visualizar los reportes relacionado con los movimientos y transacciones de los Sistemas Administrativos de la Corporación.">
    <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development">
    <meta name="author" content="Johan Villegas, Desarrollador de Aplicaciones">

    <link rel='shortcut icon' type='image/x-icon' href="Imagen/cubeAV.png" />

    <title>Visor de Reporte</title>
    <link href="css/metro.css" rel="stylesheet" />
    <link href="css/metro-icons.css" rel="stylesheet" />
     <link href="css/Fuente.css" rel="stylesheet" />
    <script src="js/jquery-2.1.3.min.js"></script>
    <script src="js/metro.js"></script>
   
    <style>
        .login-form {
            width: 400px;
            height: 300px;
            position: fixed;
            top: 50%;
            margin-top: -150px;
            left: 50%;
            margin-left: -200px;
            background-color: #ffffff;
            opacity: 0;
            -webkit-transform: scale(.8);
            transform: scale(.8);
        }

        .loginh2 {
            text-align: center;
            background: rgba(32, 134, 191, 0.08);
            margin-top: 0px;
            margin-bottom: 0px;
            padding-bottom: 10px;
            padding-top: 10px;
            color: #2086bf;
        }

        .fondo {
            background:#53556B; 
            background-image: url(Imagen/cubeIgcar.png); 
            background-size: 350px 350px;
            background-repeat:no-repeat;
            background-position: bottom right;
            font-family:'BebasNeueM';
            
         }
    </style>

    <script>

        /*
        * Do not use this is a google analytics fro Metro UI CSS
        * */
        if (window.location.hostname !== 'localhost') {

            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date(); a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-58849249-3', 'auto');
            ga('send', 'pageview');

        }


        $(function () {
            var form = $(".login-form");

            form.css({
                opacity: 1,
                "-webkit-transform": "scale(1)",
                "transform": "scale(1)",
                "-webkit-transition": ".5s",
                "transition": ".5s"
            });
        });
    </script>
</head>
<body class="fondo">
    <div class="login-form padding block-shadow">
        <img src="Imagen/IGCAR.png" style="width:45px; margin-left: 20px; float: left;padding-left: 0px;margin-top: 10px; margin-bottom: 10px; margin-right: 0px;">
        <h2 class="loginh2" style="text-align: center; background: rgba(0, 0, 0, 0.2); margin-top: 0px; margin-bottom: 0px; padding-bottom: 10px; padding-top: 10px; color: #53556B;  font-family: 'ERASBD'; font-size: 1.6rem;  padding-top:20px; padding-bottom:20px;">Igcar de Venezuela</h2>
        <form id="form1" runat="server" class="padding20" style="padding: 1rem;">

            <br />
            <div class="input-control text full-size" data-role="input">
                <label for="user_login" style="font-family:'Segoe UI';">Usuario:</label>
                <input type="text" id="txtuser" name="user_login" runat="server">
                <button class="button helper-button clear"><span class="mif-cross"></span></button>
            </div>
            <br />
            <br />
            <div class="input-control password full-size" data-role="input">
                <label for="user_password" style="font-family:'Segoe UI';">Contraseña:</label>
                <input type="password" name="user_password" id="txtpassword" runat="server">
                <button class="button helper-button reveal"><span class="mif-looks"></span></button>
            </div>
            <br />
            <br />
            <div class="form-actions">
                <asp:Button ID="IniciarSesion" runat="server" Text="Iniciar Sesión" BackColor="#53556B" ForeColor="White" OnClick="IniciarSesion_Click" />
                <button type="button" class="button link" style="color:#53556B;">Cancelar</button>
            </div>
            <br />
            <br />
            <br />
            <div>
            </div>
        </form>
    </div>
    <div class="align-right" style="bottom:0; padding-bottom: 0px;position: fixed; text-align:right; width: 100%; background: slategray; color: white; padding:2px; z-index:99;"> 
        <p style="text-align:center; width:50%; float: left; margin:0px; font-family:'TradeGothicLTStd-Bd2'; font-size:10px;"><a <%--href="http://www.mersan.com.ve" target="_blank";--%> style="color:white; text-decoration: underline; font-family: 'ERASBD'; font-size:20px; color:#B7B7B7; font-size:0.875rem; padding-left:5px;">Igcar de Venezuela</a> Todos Los Derechos Reservados © 2015  </p> 
        <p style="text-align:center; width:50%; float: left; margin:0px; font-family:'TradeGothicLTStd-Bd2'; font-size:10px; padding-top:8px;">Gestor Desarrollado 100% Por El Departamento de Sistemas</p>
    </div>
</body>
</html>
