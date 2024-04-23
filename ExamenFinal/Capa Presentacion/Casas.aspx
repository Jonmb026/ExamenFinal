<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Casas.aspx.cs" Inherits="ExamenFinal.Capa_Presentacion.Casas" MasterPageFile="~/Sitio.Master" %>

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
        input[type="number"] {
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
    <!-- Aquí va el contenido específico de tu página Casas.aspx -->
    <h1>Gestión de Casas</h1>

    <div class="form-container">
        <form id="formAgregarCasa" onsubmit="agregarCasa(); return false;">
            <label for="direccion">Dirección:</label>
            <input type="text" id="direccion" name="direccion" required><br>
            <label for="ciudad">Ciudad:</label>
            <input type="text" id="ciudad" name="ciudad" required><br>
            <label for="precio">Precio:</label>
            <input type="number" id="precio" name="precio" required><br>
            <button type="submit">Agregar Casa</button>
        </form>
    </div>

    <div class="form-container">
        <form id="formBorrarCasa" onsubmit="borrarCasa(); return false;">
            <label for="idBorrar">ID de la Casa:</label>
            <input type="number" id="idBorrar" name="idBorrar" required><br>
            <button type="submit">Borrar Casa</button>
        </form>
    </div>

    <div class="form-container">
        <form id="formModificarCasa" onsubmit="modificarCasa(); return false;">
            <label for="idModificar">ID de la Casa:</label>
            <input type="number" id="idModificar" name="idModificar" required><br>
            <label for="direccionModificar">Nueva Dirección:</label>
            <input type="text" id="direccionModificar" name="direccionModificar"><br>
            <label for="ciudadModificar">Nueva Ciudad:</label>
            <input type="text" id="ciudadModificar" name="ciudadModificar"><br>
            <label for="precioModificar">Nuevo Precio:</label>
            <input type="number" id="precioModificar" name="precioModificar"><br>
            <button type="submit">Modificar Casa</button>
        </form>
    </div>

    <script>
        function agregarCasa() {
            var direccion = document.getElementById("direccion").value;
            var ciudad = document.getElementById("ciudad").value;
            var precio = document.getElementById("precio").value;

            // Aquí enviar la información de la nueva casa al servidor para agregarla a la base de datos
            console.log("Nueva casa:");
            console.log("Dirección: " + direccion);
            console.log("Ciudad: " + ciudad);
            console.log("Precio: " + precio);

            // Limpiar el formulario después de agregar la casa
            document.getElementById("formAgregarCasa").reset();
        }

        function borrarCasa() {
            var idBorrar = document.getElementById("idBorrar").value;

            // Aquí enviar la solicitud al servidor para borrar la casa con el ID proporcionado
            console.log("Borrar casa con ID: " + idBorrar);

            // Limpiar el formulario después de borrar la casa
            document.getElementById("formBorrarCasa").reset();
        }

        function modificarCasa() {
            var idModificar = document.getElementById("idModificar").value;
            var direccion = document.getElementById("direccionModificar").value;
            var ciudad = document.getElementById("ciudadModificar").value;
            var precio = document.getElementById("precioModificar").value;

            // Aquí enviar la información actualizada de la casa al servidor para modificarla en la base de datos
            console.log("Modificar casa con ID: " + idModificar);
            console.log("Nueva dirección: " + direccion);
            console.log("Nueva ciudad: " + ciudad);
            console.log("Nuevo precio: " + precio);

            // Limpiar el formulario después de modificar la casa
            document.getElementById("formModificarCasa").reset();
        }
    </script>
</asp:Content>
