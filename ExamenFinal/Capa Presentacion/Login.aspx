<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ExamenFinal.Presentacion.Login" %>

<!DOCTYPE html>

<html lang="es" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Iniciar Sesión - Examen Final</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 300px;
            margin: 100px auto;
        }
        .login-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .login-button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .login-button:hover {
            background-color: #0056b3;
        }
        .auto-style1 {
            width: 100%;
            padding: 10px;
            background-color: #808080;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        .auto-style1:hover {
            background-color: #6d6d6d;
        }
        .user-box {
            margin-top: 20px;
            text-align: center;
        }
        .auto-style2 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            padding: 10px;
            background-color: #808080;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="loginForm" runat="server">
        <div class="container">
            <div class="login-form">
                <h2>Iniciar Sesión</h2>
                <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
                <asp:Label ID="lblLoginSuccess" runat="server" Text=""></asp:Label>
                <div>
                    <label for="txtUsername">Usuario:</label>
                    <asp:TextBox ID="txtUsername" runat="server" />
                </div>
                <div>
                    <label for="txtPassword">Contraseña:</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                </div>
                <div>
                    <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" CssClass="login-button" OnClick="btnLogin_Click" />
                    <asp:Button ID="btnMenuPrincipal" runat="server" Text="Menú Principal" CssClass="auto-style2" OnClick="btnMenuPrincipal_Click" Width="257px" title="Ir al Menú Principal" />
                </div>
                <div class="user-box" runat="server" id="userBox">
                    Usuario: <asp:Label ID="lblUsuario" runat="server"></asp:Label>
                    <br />
                    <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión" OnClick="btnCerrarSesion_Click" CssClass="auto-style1" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
