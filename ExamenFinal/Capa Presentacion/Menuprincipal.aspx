<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menuprincipal.aspx.cs" Inherits="ExamenFinal.Presentacion.Menuprincipal" MasterPageFile="~/Sitio.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Menú Principal</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" href="/CSS/estilos.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Página de Inicio</h2>
    <div class="menu">
      <input type="checkbox" id="toggle" />
      <label id="show-menu" for="toggle">
        <div class="btn">
          <i class="material-icons md-36 toggleBtn menuBtn">menu</i>
          <i class="material-icons md-36 toggleBtn closeBtn">close</i>
        </div>
        <div class="btn">
          <a href="Menuprincipal.aspx" title="Inicio">
            <i class="material-icons md-36">home</i>
          </a>
        </div>
        <div class="btn">
          <a href="Agente_Vista.aspx" title="Agentes">
            <i class="material-icons md-36">people</i>
          </a>
        </div>
        <div class="btn">
          <a href="Clientes_View.aspx" title="Clientes">
            <i class="material-icons md-36">person</i>
          </a>
        </div>
        <div class="btn">
          <a href="Venta_View.aspx" title="Ventas">
            <i class="material-icons md-36">shopping_cart</i>
          </a>
        </div>
        <div class="btn">
          <a href="Casas.aspx" title="Casas">
            <i class="material-icons md-36">house</i>
          </a>
        </div>
        <div class="btn">
          <a href="Login.aspx" title="Iniciar Sesión">
            <i class="material-icons md-36">login</i>
          </a>
        </div>
          <div class="btn">
  <a href="Reportes.aspx" title="Reportes">
    <i class="material-icons md-36">description</i>
  </a>
</div>
      </label>
    </div>
    <div class="msg">
        <asp:Label ID="lblConexion" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="lblLoginSuccess" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
