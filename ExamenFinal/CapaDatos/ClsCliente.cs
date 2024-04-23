using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace ExamenFinal.CapaDatos
{
    public class ClsCliente
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public string Email { get; set; }
        public string Telefono { get; set; }

        public ClsCliente(int id, string nombre, string email, string telefono)
        {
            ID = id;
            Nombre = nombre;
            Email = email;
            Telefono = telefono;
        }

        public static List<ClsCliente> ObtenerClientes()
        {
            List<ClsCliente> clientes = new List<ClsCliente>();

            string connectionString = "Server=DESKTOP-M28U2HU;Database=examenfinal;Integrated Security=True;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GestionarClientes", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@accion", "consultar");

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        int id = Convert.ToInt32(reader["ID"]);
                        string nombre = reader["Nombre"].ToString();
                        string email = reader["Email"].ToString();
                        string telefono = reader["Telefono"].ToString();

                        ClsCliente cliente = new ClsCliente(id, nombre, email, telefono);
                        clientes.Add(cliente);
                    }

                    reader.Close();
                }
                catch (Exception ex)
                {
                    // Manejo de errores
                    Console.WriteLine("Error al obtener clientes: " + ex.Message);
                }
                finally
                {
                    if (connection.State == System.Data.ConnectionState.Open)
                        connection.Close();
                }
            }

            return clientes;
        }
    }
}
