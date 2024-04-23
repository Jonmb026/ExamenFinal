using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace ExamenFinal.CapaDatos
{
    public class ClsVentas
    {
        public int ID { get; set; }
        public int ID_Agente { get; set; }
        public int ID_Cliente { get; set; }
        public int ID_Casa { get; set; }
        public DateTime Fecha { get; set; }

        public ClsVentas(int id, int idAgente, int idCliente, int idCasa, DateTime fecha)
        {
            ID = id;
            ID_Agente = idAgente;
            ID_Cliente = idCliente;
            ID_Casa = idCasa;
            Fecha = fecha;
        }

        public static List<ClsVentas> ObtenerVentas()
        {
            List<ClsVentas> ventas = new List<ClsVentas>();

            string connectionString = "Server=DESKTOP-M28U2HU;Database=examenfinal;Integrated Security=True;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("SELECT [ID], [ID_Agente], [ID_Cliente], [ID_Casa], [Fecha] FROM [dbo].[Ventas]", connection);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        int id = Convert.ToInt32(reader["ID"]);
                        int idAgente = Convert.ToInt32(reader["ID_Agente"]);
                        int idCliente = Convert.ToInt32(reader["ID_Cliente"]);
                        int idCasa = Convert.ToInt32(reader["ID_Casa"]);
                        DateTime fecha = Convert.ToDateTime(reader["Fecha"]);

                        ClsVentas venta = new ClsVentas(id, idAgente, idCliente, idCasa, fecha);
                        ventas.Add(venta);
                    }

                    reader.Close();
                }
                catch (Exception ex)
                {
                    // Manejo de errores
                    Console.WriteLine("Error al obtener ventas: " + ex.Message);
                }
                finally
                {
                    if (connection.State == System.Data.ConnectionState.Open)
                        connection.Close();
                }
            }

            return ventas;
        }
    }
}
