using System;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace PlacementCell
{
        public class ConnectionManager
        {
            private static MySqlConnection dbcon = new MySqlConnection(Convert.ToString(ConfigurationManager.ConnectionStrings["dbConnectionString"]));
            public static MySqlConnection GetDatabaseConnection()
            {
                try {
                    dbcon.Open();
                }catch(Exception){
                    throw;
                }
                return dbcon;
            }
            public static void CloseDatabaseConnection()
            {
                dbcon.Close();   
            }
        }
}