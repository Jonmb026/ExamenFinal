<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clientes_View.aspx.cs" Inherits="ExamenFinal.Capa_Presentacion.Clientes_View" MasterPageFile="~/Sitio.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="/CSS/pantallas.css" />
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Gestión de Clientes</h1>

    <div class="form-container">
        <asp:GridView ID="gvClientes" runat="server" AutoGenerateColumns="False" OnRowEditing="gvClientes_RowEditing" OnRowCancelingEdit="gvClientes_RowCancelingEdit" OnRowUpdating="gvClientes_RowUpdating">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" />
                <asp:TemplateField HeaderText="Nombre">
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Teléfono">
                    <ItemTemplate>
                        <asp:Label ID="lblTelefono" runat="server" Text='<%# Eval("Telefono") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTelefono" runat="server" Text='<%# Bind("Telefono") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
    </div>

    <div class="form-container">
        <h2>Agregar Cliente</h2>
        <label for="nombre">Nombre:</label>
        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" required></asp:TextBox><br>
        <label for="email">Email:</label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" required></asp:TextBox><br>
        <label for="telefono">Teléfono:</label>
        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" required></asp:TextBox><br>
        <asp:Button ID="btnAgregar" runat="server" Text="Agregar Cliente" CssClass="btn btn-primary" OnClick="btnAgregar_Click" />
    </div>

    <div class="form-container">
        <h2>Borrar Cliente</h2>
        <label for="idBorrar">ID del Cliente:</label>
        <asp:TextBox ID="txtIdBorrar" runat="server" CssClass="form-control" required></asp:TextBox><br>
        <asp:Button ID="btnBorrar" runat="server" Text="Borrar Cliente" CssClass="btn btn-danger" OnClick="btnBorrar_Click" />
    </div>
</asp:Content>
