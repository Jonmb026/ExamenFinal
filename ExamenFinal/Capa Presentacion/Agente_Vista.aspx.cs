using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ExamenFinal.CapaLogica; // Importa el espacio de nombres donde se encuentra la clase Agente_OP

namespace ExamenFinal.Capa_Presentacion
{
    public partial class Agente_Vista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Cargar los agentes en el GridView
                CargarAgentes();
            }
        }

        // Método para cargar los agentes en el GridView
        private void CargarAgentes()
        {
            Agente_OP agenteOp = new Agente_OP();
            GridView1.DataSource = agenteOp.ObtenerAgentes();
            GridView1.DataBind();
        }

        // Método para agregar un nuevo agente
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text;
            string email = txtEmail.Text;
            string telefono = txtTelefono.Text;
            string rol = ddlRol.SelectedValue;
            string contraseña = txtContraseñaAgregar.Text;

            Agente_OP agenteOp = new Agente_OP();
            agenteOp.AgregarAgente(nombre, email, telefono, rol, contraseña);

            // Vuelve a cargar los agentes en el GridView después de agregar uno nuevo
            CargarAgentes();

            // Limpiar el formulario después de agregar el agente
            LimpiarFormulario(pnlAgregarAgente);

            // Mostrar mensaje al usuario
            mensajeAgregar.InnerText = "Agente agregado correctamente.";
            mensajeAgregar.Attributes["class"] = "mensaje exito";
            mensajeAgregar.Visible = true;
        }

        // Método para borrar un agente
        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtIdBorrar.Text);
            string contraseña = txtContraseñaBorrar.Text;

            Agente_OP agenteOp = new Agente_OP();
            agenteOp.BorrarAgente(id, contraseña);

            // Vuelve a cargar los agentes en el GridView después de borrar uno
            CargarAgentes();

            // Limpiar el formulario después de borrar el agente
            LimpiarFormulario(pnlBorrarAgente);

            // Mostrar mensaje al usuario
            mensajeBorrar.InnerText = "Agente borrado correctamente.";
            mensajeBorrar.Attributes["class"] = "mensaje exito";
            mensajeBorrar.Visible = true;
        }

        // Método para modificar un agente
        protected void btnModificar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtIdModificar.Text);
            string nombre = txtNombreModificar.Text;
            string email = txtEmailModificar.Text;
            string telefono = txtTelefonoModificar.Text;
            string rol = ddlRolModificar.SelectedValue;
            string contraseña = txtContraseñaModificar.Text;

            Agente_OP agenteOp = new Agente_OP();
            agenteOp.ModificarAgente(id, nombre, email, telefono, rol, contraseña);

            // Vuelve a cargar los agentes en el GridView después de modificar uno
            CargarAgentes();

            // Limpiar el formulario después de modificar el agente
            LimpiarFormulario(pnlModificarAgente);

            // Mostrar mensaje al usuario
            mensajeModificar.InnerText = "Agente modificado correctamente.";
            mensajeModificar.Attributes["class"] = "mensaje exito";
            mensajeModificar.Visible = true;
        }

        // Método para limpiar los controles de un Panel
        private void LimpiarFormulario(Panel panel)
        {
            foreach (Control control in panel.Controls)
            {
                if (control is TextBox)
                {
                    ((TextBox)control).Text = string.Empty;
                }
                else if (control is DropDownList)
                {
                    ((DropDownList)control).ClearSelection();
                }
            }
        }
    }
}
