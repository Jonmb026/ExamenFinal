using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace ExamenFinal.CapaDatos
{
    public class ClsAgente
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public string Email { get; set; }
        public string Telefono { get; set; }

        public string Rol { get; set; }

        public ClsAgente(int id, string nombre, string email, string telefono)
        {
            ID = id;
            Nombre = nombre;
            Email = email;
            Telefono = telefono;
        }

        public static List<ClsAgente> ObtenerAgentes()
        {
            List<ClsAgente> agentes = new List<ClsAgente>();

            string connectionString = "Server=DESKTOP-M28U2HU;Database=examenfinal;Integrated Security=True;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Comando para llamar al procedimiento almacenado
                using (SqlCommand command = new SqlCommand("GestionarAgentes", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Parámetro para indicar la acción a realizar
                    command.Parameters.AddWithValue("@accion", "consultar");

                    try
                    {
                        connection.Open();
                        // Ejecutar el comando y leer los datos
                        SqlDataReader reader = command.ExecuteReader();

                        while (reader.Read())
                        {
                            // Obtener los datos del agente
                            int id = Convert.ToInt32(reader["ID"]);
                            string nombre = reader["Nombre"].ToString();
                            string email = reader["Email"].ToString();
                            string telefono = reader["Telefono"].ToString();

                            // Crear objeto ClsAgente y agregarlo a la lista
                            ClsAgente agente = new ClsAgente(id, nombre, email, telefono);
                            agentes.Add(agente);
                        }

                        reader.Close();
                    }
                    catch (Exception ex)
                    {
                        // Manejo de errores
                        Console.WriteLine("Error al obtener agentes: " + ex.Message);
                    }
                }
            }

            return agentes;
        }
    }
}
