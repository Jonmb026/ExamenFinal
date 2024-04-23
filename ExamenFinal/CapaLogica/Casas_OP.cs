using System;
using System.Data;
using System.Data.SqlClient;

namespace ExamenFinal.CapaLogica
{
    public class Casas_OP
    {
        private string cadenaConexion = "Server=DESKTOP-M28U2HU;Database=examenfinal;Integrated Security=True;";

        public DataTable ObtenerCasas()
        {
            DataTable tabla = new DataTable();

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "GestionarCasas";
                using (SqlCommand comando = new SqlCommand(procedimiento, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@accion", "consultar");

                    try
                    {
                        conexion.Open();
                        tabla.Load(comando.ExecuteReader());
                    }
                    catch (Exception ex)
                    {
                        // Manejo de errores
                        Console.WriteLine("Error al obtener casas: " + ex.Message);
                    }
                }
            }

            return tabla;
        }

        public void AgregarCasa(string direccion, string ciudad, decimal precio)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "GestionarCasas";
                using (SqlCommand comando = new SqlCommand(procedimiento, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@accion", "agregar");
                    comando.Parameters.AddWithValue("@direccion", direccion);
                    comando.Parameters.AddWithValue("@ciudad", ciudad);
                    comando.Parameters.AddWithValue("@precio", precio);

                    try
                    {
                        conexion.Open();
                        comando.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        // Manejo de errores
                        Console.WriteLine("Error al agregar casa: " + ex.Message);
                    }
                }
            }
        }

        public void BorrarCasa(int id)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "GestionarCasas";
                using (SqlCommand comando = new SqlCommand(procedimiento, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@accion", "borrar");
                    comando.Parameters.AddWithValue("@casa_id", id);

                    try
                    {
                        conexion.Open();
                        comando.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        // Manejo de errores
                        Console.WriteLine("Error al borrar casa: " + ex.Message);
                    }
                }
            }
        }

        public void ModificarCasa(int id, string direccion, string ciudad, decimal precio)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "GestionarCasas";
                using (SqlCommand comando = new SqlCommand(procedimiento, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@accion", "modificar");
                    comando.Parameters.AddWithValue("@casa_id", id);
                    comando.Parameters.AddWithValue("@direccion", direccion);
                    comando.Parameters.AddWithValue("@ciudad", ciudad);
                    comando.Parameters.AddWithValue("@precio", precio);

                    try
                    {
                        conexion.Open();
                        comando.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        // Manejo de errores
                        Console.WriteLine("Error al modificar casa: " + ex.Message);
                    }
                }
            }
        }
    }
}
