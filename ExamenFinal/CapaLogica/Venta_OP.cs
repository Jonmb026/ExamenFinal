using System;
using System.Data;
using System.Data.SqlClient;

namespace ExamenFinal.CapaLogica
{
    public class Venta_OP
    {
        private string cadenaConexion = "Server=DESKTOP-M28U2HU;Database=examenfinal;Integrated Security=True;";

        public DataTable ObtenerVentas()
        {
            DataTable tabla = new DataTable();

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "GestionarVentas";
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
                        Console.WriteLine("Error al obtener ventas: " + ex.Message);
                    }
                }
            }

            return tabla;
        }

        public void AgregarVenta(int agente_id, int cliente_id, int casa_id, DateTime fecha)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "GestionarVentas";
                using (SqlCommand comando = new SqlCommand(procedimiento, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@accion", "agregar");
                    comando.Parameters.AddWithValue("@agente_id", agente_id);
                    comando.Parameters.AddWithValue("@cliente_id", cliente_id);
                    comando.Parameters.AddWithValue("@casa_id", casa_id);
                    comando.Parameters.AddWithValue("@fecha", fecha);

                    try
                    {
                        conexion.Open();
                        comando.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        // Manejo de errores
                        Console.WriteLine("Error al agregar venta: " + ex.Message);
                    }
                }
            }
        }

        public void BorrarVenta(int id)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "GestionarVentas";
                using (SqlCommand comando = new SqlCommand(procedimiento, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@accion", "borrar");
                    comando.Parameters.AddWithValue("@venta_id", id);

                    try
                    {
                        conexion.Open();
                        comando.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        // Manejo de errores
                        Console.WriteLine("Error al borrar venta: " + ex.Message);
                    }
                }
            }
        }

        public void ModificarVenta(int id, int agente_id, int cliente_id, int casa_id, DateTime fecha)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "GestionarVentas";
                using (SqlCommand comando = new SqlCommand(procedimiento, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@accion", "modificar");
                    comando.Parameters.AddWithValue("@venta_id", id);
                    comando.Parameters.AddWithValue("@agente_id", agente_id);
                    comando.Parameters.AddWithValue("@cliente_id", cliente_id);
                    comando.Parameters.AddWithValue("@casa_id", casa_id);
                    comando.Parameters.AddWithValue("@fecha", fecha);

                    try
                    {
                        conexion.Open();
                        comando.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        // Manejo de errores
                        Console.WriteLine("Error al modificar venta: " + ex.Message);
                    }
                }
            }
        }
    }
}
