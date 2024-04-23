using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace ExamenFinal.CapaDatos
{
    public class ClsCasas
    {
        public int ID { get; set; }
        public string Direccion { get; set; }
        public string Ciudad { get; set; }
        public decimal Precio { get; set; }

        public ClsCasas(int id, string direccion, string ciudad, decimal precio)
        {
            ID = id;
            Direccion = direccion;
            Ciudad = ciudad;
            Precio = precio;
        }

        public static List<ClsCasas> ObtenerCasas()
        {
            List<ClsCasas> casas = new List<ClsCasas>();

            string connectionString = "Server=DESKTOP-M28U2HU;Database=examenfinal;Integrated Security=True;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Comando para llamar al procedimiento almacenado
                using (SqlCommand command = new SqlCommand("GestionarCasas", connection))
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
                            // Obtener los datos de la casa
                            int id = Convert.ToInt32(reader["ID"]);
                            string direccion = reader["Direccion"].ToString();
                            string ciudad = reader["Ciudad"].ToString();
                            decimal precio = Convert.ToDecimal(reader["Precio"]);

                            // Crear objeto ClsCasas y agregarlo a la lista
                            ClsCasas casa = new ClsCasas(id, direccion, ciudad, precio);
                            casas.Add(casa);
                        }

                        reader.Close();
                    }
                    catch (Exception ex)
                    {
                        // Manejo de errores
                        Console.WriteLine("Error al obtener casas: " + ex.Message);
                    }
                }
            }

            return casas;
        }
    }
}
