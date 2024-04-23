<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Venta_View.aspx.cs" Inherits="ExamenFinal.Capa_Presentacion.Venta_View" MasterPageFile="~/Sitio.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Puedes agregar aquí cualquier contenido que quieras en el head -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
        }
        .form-container {
            width: 300px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Aquí va el contenido específico de tu página Venta_View.aspx -->
    <h1>Gestión de Ventas</h1>

    <div class="form-container">
        <form id="formAgregarVenta" onsubmit="agregarVenta(); return false;">
            <label for="agente_id">ID del Agente:</label>
            <input type="number" id="agente_id" name="agente_id" required><br>
            <label for="cliente_id">ID del Cliente:</label>
            <input type="number" id="cliente_id" name="cliente_id" required><br>
            <label for="casa_id">ID de la Casa:</label>
            <input type="number" id="casa_id" name="casa_id" required><br>
            <label for="fecha">Fecha:</label>
            <input type="date" id="fecha" name="fecha" required><br>
            <button type="submit">Agregar Venta</button>
        </form>
    </div>

    <div class="form-container">
        <form id="formBorrarVenta" onsubmit="borrarVenta(); return false;">
            <label for="idBorrar">ID de la Venta:</label>
            <input type="number" id="idBorrar" name="idBorrar" required><br>
            <button type="submit">Borrar Venta</button>
        </form>
    </div>

    <div class="form-container">
        <form id="formModificarVenta" onsubmit="modificarVenta(); return false;">
            <label for="idModificar">ID de la Venta:</label>
            <input type="number" id="idModificar" name="idModificar" required><br>
            <label for="agente_idModificar">Nuevo ID del Agente:</label>
            <input type="number" id="agente_idModificar" name="agente_idModificar" required><br>
            <label for="cliente_idModificar">Nuevo ID del Cliente:</label>
            <input type="number" id="cliente_idModificar" name="cliente_idModificar" required><br>
            <label for="casa_idModificar">Nuevo ID de la Casa:</label>
            <input type="number" id="casa_idModificar" name="casa_idModificar" required><br>
            <label for="fechaModificar">Nueva Fecha:</label>
            <input type="date" id="fechaModificar" name="fechaModificar" required><br>
            <button type="submit">Modificar Venta</button>
        </form>
    </div>

    <script>
        function agregarVenta() {
            var agente_id = document.getElementById("agente_id").value;
            var cliente_id = document.getElementById("cliente_id").value;
            var casa_id = document.getElementById("casa_id").value;
            var fecha = document.getElementById("fecha").value;

            // Aquí enviar la información de la nueva venta al servidor para agregarla a la base de datos
            console.log("Nueva venta:");
            console.log("ID del Agente: " + agente_id);
            console.log("ID del Cliente: " + cliente_id);
            console.log("ID de la Casa: " + casa_id);
            console.log("Fecha: " + fecha);

            // Limpiar el formulario después de agregar la venta
            document.getElementById("formAgregarVenta").reset();
        }

        function borrarVenta() {
            var idBorrar = document.getElementById("idBorrar").value;

            // Aquí enviar la solicitud al servidor para borrar la venta con el ID proporcionado
            console.log("Borrar venta con ID: " + idBorrar);

            // Limpiar el formulario después de borrar la venta
            document.getElementById("formBorrarVenta").reset();
        }

        function modificarVenta() {
            var idModificar = document.getElementById("idModificar").value;
            var agente_id = document.getElementById("agente_idModificar").value;
            var cliente_id = document.getElementById("cliente_idModificar").value;
            var casa_id = document.getElementById("casa_idModificar").value;
            var fecha = document.getElementById("fechaModificar").value;

            // Aquí enviar la información actualizada de la venta al servidor para modificarla en la base de datos
            console.log("Modificar venta con ID: " + idModificar);
            console.log("Nuevo ID del Agente: " + agente_id);
            console.log("Nuevo ID del Cliente: " + cliente_id);
            console.log("Nuevo ID de la Casa: " + casa_id);
            console.log("Nueva Fecha: " + fecha);

            // Limpiar el formulario después de modificar la venta
            document.getElementById("formModificarVenta").reset();
        }
    </script>
</asp:Content>
