using System;
using System.Data;
using System.Data.SqlClient;

namespace ExamenFinal.CapaLogica
{
    public class Agente_OP
    {
        private string cadenaConexion = "Server=DESKTOP-M28U2HU;Database=examenfinal;Integrated Security=True;";

        public DataTable ObtenerAgentes()
        {
            DataTable tabla = new DataTable();

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "GestionarAgentes";
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
                        Console.WriteLine("Error al obtener agentes: " + ex.Message);
                    }
                }
            }

            return tabla;
        }

        public bool VerificarContraseña(string contraseña)
        {
            // Aquí podrías implementar la lógica para verificar la contraseña.
            // Por ejemplo, podrías tener una contraseña almacenada en tu base de datos y verificarla aquí.
            // Por ahora, simplemente devolveré true para simular que la contraseña es correcta.
            return true;
        }

        public void AgregarAgente(string nombre, string email, string telefono, string rol, string contraseña)
        {
            // Verificar la contraseña antes de realizar la acción
            if (!VerificarContraseña(contraseña))
            {
                Console.WriteLine("Contraseña incorrecta. No se pudo agregar el agente.");
                return;
            }

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "GestionarAgentes";
                using (SqlCommand comando = new SqlCommand(procedimiento, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@accion", "agregar");
                    comando.Parameters.AddWithValue("@agente_nombre", nombre);
                    comando.Parameters.AddWithValue("@agente_email", email);
                    comando.Parameters.AddWithValue("@agente_telefono", telefono);
                    comando.Parameters.AddWithValue("@agente_rol", rol);

                    try
                    {
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        Console.WriteLine("Agente agregado correctamente.");
                    }
                    catch (Exception ex)
                    {
                        // Manejo de errores
                        Console.WriteLine("Error al agregar agente: " + ex.Message);
                    }
                }
            }
        }

        public void BorrarAgente(int id, string contraseña)
        {
            // Verificar la contraseña antes de realizar la acción
            if (!VerificarContraseña(contraseña))
            {
                Console.WriteLine("Contraseña incorrecta. No se pudo borrar el agente.");
                return;
            }

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "GestionarAgentes";
                using (SqlCommand comando = new SqlCommand(procedimiento, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@accion", "borrar");
                    comando.Parameters.AddWithValue("@agente_id", id);

                    try
                    {
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        Console.WriteLine("Agente borrado correctamente.");
                    }
                    catch (Exception ex)
                    {
                        // Manejo de errores
                        Console.WriteLine("Error al borrar agente: " + ex.Message);
                    }
                }
            }
        }

        public void ModificarAgente(int id, string nombre, string email, string telefono, string rol, string contraseña)
        {
            // Verificar la contraseña antes de realizar la acción
            if (!VerificarContraseña(contraseña))
            {
                Console.WriteLine("Contraseña incorrecta. No se pudo modificar el agente.");
                return;
            }

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "GestionarAgentes";
                using (SqlCommand comando = new SqlCommand(procedimiento, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@accion", "modificar");
                    comando.Parameters.AddWithValue("@agente_id", id);
                    comando.Parameters.AddWithValue("@agente_nombre", nombre);
                    comando.Parameters.AddWithValue("@agente_email", email);
                    comando.Parameters.AddWithValue("@agente_telefono", telefono);
                    comando.Parameters.AddWithValue("@agente_rol", rol);

                    try
                    {
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        Console.WriteLine("Agente modificado correctamente.");
                    }
                    catch (Exception ex)
                    {
                        // Manejo de errores
                        Console.WriteLine("Error al modificar agente: " + ex.Message);
                    }
                }
            }
        }
    }
}
