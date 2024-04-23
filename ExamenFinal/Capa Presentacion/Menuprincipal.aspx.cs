using System;

namespace ExamenFinal.Presentacion
{
    public partial class Menuprincipal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            VerificarConexionBaseDatos();
        }

        private void VerificarConexionBaseDatos()
        {
            string connectionString = "Server=DESKTOP-M28U2HU;Database=examenfinal;Integrated Security=True;";
            try
            {
                using (var connection = new System.Data.SqlClient.SqlConnection(connectionString))
                {
                    connection.Open();
                    lblConexion.Text = "Conexión con la base de datos establecida correctamente";
                }
            }
            catch (Exception ex)
            {
                lblConexion.Text = "Error al conectar con la base de datos: " + ex.Message;
            }
        }
    }
}
