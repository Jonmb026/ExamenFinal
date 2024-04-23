using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ExamenFinal.Capa_Presentacion
{
    public partial class Reportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verificar si el usuario está autenticado y si tiene el rol de administrador
            if (!EsUsuarioAdmin())
            {
                // Si no es administrador, redirigir a la página de inicio de sesión
                Response.Redirect("Login.aspx?error=admin");
            }

            if (!IsPostBack)
            {
                // Cargar los datos de agentes, clientes, ventas y casas
                CargarDatosAgentes();
                CargarDatosClientes();
                CargarDatosVentas();
                CargarDatosCasas();
            }
        }

        private bool EsUsuarioAdmin()
        {
            // Verificar si hay una sesión activa
            if (Session["Usuario"] != null)
            {
                // Obtener el nombre de usuario de la sesión
                string username = Session["Usuario"].ToString();

                // Cadena de conexión
                string connectionString = "Server=DESKTOP-M28U2HU;Database=examenfinal;Integrated Security=True;";

                // Consulta SQL para verificar si el usuario tiene el rol de administrador
                string query = "SELECT COUNT(*) FROM Agentes WHERE Nombre = @Username AND Rol = 'admin'";

                // Crear y abrir la conexión a la base de datos
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Crear el comando SQL
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Agregar parámetros para el nombre de usuario
                        command.Parameters.AddWithValue("@Username", username);

                        // Ejecutar la consulta y obtener el resultado
                        int count = (int)command.ExecuteScalar();

                        // Devolver true si el usuario es administrador
                        return count > 0;
                    }
                }
            }
            else
            {
                return false;
            }
        }

        private void CargarDatosAgentes()
        {
            // Cadena de conexión
            string connectionString = "Server=DESKTOP-M28U2HU;Database=examenfinal;Integrated Security=True;";

            // Crear una conexión y un adaptador de datos
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GestionarAgentes", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@accion", "consultar");

                    // Abrir la conexión
                    con.Open();

                    // Ejecutar la consulta y obtener los datos en un DataTable
                    DataTable dt = new DataTable();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }

                    // Vincular los datos al GridView de Agentes
                    GridViewAgentes.DataSource = dt;
                    GridViewAgentes.DataBind();
                }
            }
        }

        private void CargarDatosClientes()
        {
            // Cadena de conexión
            string connectionString = "Server=DESKTOP-M28U2HU;Database=examenfinal;Integrated Security=True;";

            // Consulta SQL para obtener los datos de los clientes
            string query = "SELECT [ID], [Nombre], [Email], [Telefono] FROM [dbo].[Clientes]";

            // Crear una conexión y un adaptador de datos
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Abrir la conexión
                    con.Open();

                    // Ejecutar la consulta y obtener los datos en un DataTable
                    DataTable dt = new DataTable();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }

                    // Vincular los datos al GridView de Clientes
                    GridViewClientes.DataSource = dt;
                    GridViewClientes.DataBind();
                }
            }
        }

        private void CargarDatosVentas()
        {
            // Cadena de conexión
            string connectionString = "Server=DESKTOP-M28U2HU;Database=examenfinal;Integrated Security=True;";

            // Consulta SQL para obtener los datos de las ventas
            string query = "SELECT [ID], [ID_Agente], [ID_Cliente], [ID_Casa], [Fecha] FROM [dbo].[Ventas]";

            // Crear una conexión y un adaptador de datos
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Abrir la conexión
                    con.Open();

                    // Ejecutar la consulta y obtener los datos en un DataTable
                    DataTable dt = new DataTable();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }

                    // Vincular los datos al GridView de Ventas
                    GridViewVentas.DataSource = dt;
                    GridViewVentas.DataBind();
                }
            }
        }

        private void CargarDatosCasas()
        {
            // Cadena de conexión
            string connectionString = "Server=DESKTOP-M28U2HU;Database=examenfinal;Integrated Security=True;";

            // Consulta SQL para obtener los datos de las casas
            string query = "SELECT [ID], [Direccion], [Ciudad], [Precio] FROM [dbo].[Casas]";

            // Crear una conexión y un adaptador de datos
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Abrir la conexión
                    con.Open();

                    // Ejecutar la consulta y obtener los datos en un DataTable
                    DataTable dt = new DataTable();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }

                    // Vincular los datos al GridView de Casas
                    GridViewCasas.DataSource = dt;
                    GridViewCasas.DataBind();
                }
            }
        }
    }
}
