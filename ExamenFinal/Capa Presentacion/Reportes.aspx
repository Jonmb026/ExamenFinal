<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="ExamenFinal.Capa_Presentacion.Reportes" MasterPageFile="~/Sitio.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Reportes</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" href="/CSS/estilos.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h2, h3 {
            text-align: center;
            margin-top: 20px;
        }
        .grid-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 20px;
            justify-items: center;
            margin: 20px;
        }
        .grid-item {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .grid-item h3 {
            margin-top: 0;
        }
        .grid-item table {
            width: 100%;
            border-collapse: collapse;
        }
        .grid-item th, .grid-item td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .grid-item th {
            background-color: #007bff;
            color: white;
        }
        .grid-item td {
            color: #007bff;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Reportes</h2>

    <div class="grid-container">
        <div class="grid-item">
            <h3>Agentes</h3>
            <asp:GridView ID="GridViewAgentes" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Rol" HeaderText="Rol" />
                </Columns>
            </asp:GridView>
        </div>

        <div class="grid-item">
            <h3>Clientes</h3>
            <asp:GridView ID="GridViewClientes" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Telefono" HeaderText="Telefono" />
                </Columns>
            </asp:GridView>
        </div>

        <div class="grid-item">
            <h3>Ventas</h3>
            <asp:GridView ID="GridViewVentas" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="ID_Agente" HeaderText="ID Agente" />
                    <asp:BoundField DataField="ID_Cliente" HeaderText="ID Cliente" />
                    <asp:BoundField DataField="ID_Casa" HeaderText="ID Casa" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                </Columns>
            </asp:GridView>
        </div>

        <div class="grid-item">
            <h3>Casas</h3>
            <asp:GridView ID="GridViewCasas" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                    <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
