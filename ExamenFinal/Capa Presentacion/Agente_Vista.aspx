<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Agente_Vista.aspx.cs" Inherits="ExamenFinal.Capa_Presentacion.Agente_Vista" MasterPageFile="~/Sitio.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="/CSS/pantallas.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <h1>Gestión de Agentes</h1>

    <div class="form-container">
        <asp:Panel ID="pnlAgregarAgente" runat="server">
            <label for="nombre">Nombre:</label>
            <asp:TextBox ID="txtNombre" runat="server" required></asp:TextBox><br>
            <label for="email">Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" required></asp:TextBox><br>
            <label for="telefono">Teléfono:</label>
            <asp:TextBox ID="txtTelefono" runat="server" required></asp:TextBox><br>
            <label for="rol">Rol:</label>
            <asp:DropDownList ID="ddlRol" runat="server">
                <asp:ListItem Value="admin">Admin</asp:ListItem>
                <asp:ListItem Value="ventas">Ventas</asp:ListItem>
            </asp:DropDownList><br>
            <label for="contraseña">Contraseña:</label>
            <asp:TextBox ID="txtContraseñaAgregar" runat="server" TextMode="Password" required></asp:TextBox><br>
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar Agente" OnClick="btnAgregar_Click" />
            <div id="mensajeAgregar" class="mensaje" runat="server" visible="false"></div>
        </asp:Panel>
    </div>

    <div class="form-container">
        <asp:Panel ID="pnlBorrarAgente" runat="server">
            <label for="idBorrar">ID del Agente:</label>
            <asp:TextBox ID="txtIdBorrar" runat="server" required></asp:TextBox><br>
            <label for="contraseñaBorrar">Contraseña:</label>
            <asp:TextBox ID="txtContraseñaBorrar" runat="server" TextMode="Password" required></asp:TextBox><br>
            <asp:Button ID="btnBorrar" runat="server" Text="Borrar Agente" OnClick="btnBorrar_Click" />
            <div id="mensajeBorrar" class="mensaje" runat="server" visible="false"></div>
        </asp:Panel>
    </div>

    <div class="form-container">
        <asp:Panel ID="pnlModificarAgente" runat="server">
            <label for="idModificar">ID del Agente:</label>
            <asp:TextBox ID="txtIdModificar" runat="server" required></asp:TextBox><br>
            <label for="nombreModificar">Nuevo Nombre:</label>
            <asp:TextBox ID="txtNombreModificar" runat="server"></asp:TextBox><br>
            <label for="emailModificar">Nuevo Email:</label>
            <asp:TextBox ID="txtEmailModificar" runat="server"></asp:TextBox><br>
            <label for="telefonoModificar">Nuevo Teléfono:</label>
            <asp:TextBox ID="txtTelefonoModificar" runat="server"></asp:TextBox><br>
            <label for="rolModificar">Nuevo Rol:</label>
            <asp:DropDownList ID="ddlRolModificar" runat="server">
                <asp:ListItem Value="admin">Admin</asp:ListItem>
                <asp:ListItem Value="ventas">Ventas</asp:ListItem>
            </asp:DropDownList><br>
            <label for="contraseñaModificar">Contraseña:</label>
            <asp:TextBox ID="txtContraseñaModificar" runat="server" TextMode="Password" required></asp:TextBox><br>
            <asp:Button ID="btnModificar" runat="server" Text="Modificar Agente" OnClick="btnModificar_Click" />
            <div id="mensajeModificar" class="mensaje" runat="server" visible="false"></div>
        </asp:Panel>
    </div>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="email" HeaderText="Email" />
            <asp:BoundField DataField="telefono" HeaderText="Teléfono" />
            <asp:BoundField DataField="rol" HeaderText="Rol" />
        </Columns>
    </asp:GridView>
</asp:Content>
