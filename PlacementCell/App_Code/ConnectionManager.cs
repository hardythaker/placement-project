using System;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace PlacementCell
{
        internal class ConnectionManager
        {
            private static string connectionString = "Server=MYSQL5014.myASP.NET;Database=db_9f3130_tis;Uid=9f3130_tis;Pwd=123456789;";
            private static MySqlConnection dbcon = null;
            public static MySqlConnection GetDatabaseConnection()
            {
                if (dbcon == null)
                {
                    dbcon = new MySqlConnection(connectionString);
                }
                if (dbcon != null)
                {
                    dbcon.Close();
                    dbcon = new MySqlConnection(connectionString);
                }
            return dbcon;
        }
            public static void CloseDatabaseConnection()
            {
                dbcon.Close();   
            }
        }
}