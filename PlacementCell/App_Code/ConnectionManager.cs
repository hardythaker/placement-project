using System;
using MySql.Data.MySqlClient;
using PlacementCell.Properties;
using PlacementCell.Models;
using System.Web;
using System.Web.Http;
using System.Configuration;

namespace PlacementCell
{
        internal class ConnectionManager
        {

        //object settings = Settings.Default;
        //FOR LOCAL DATABASE CONNECTION
        
            
         /*
            MAKE SURE TO CHANGE THE DATABASE CONNECTION IN PROPERTIES SETINGS ALSO FOR ADMIN PANNEL TO WORK
            TILL WE USING JQUERY EDITOR.
         */
        //private string connectionString = "Server=localhost;Database=db_9fa4a3_hardyt;Uid=tpcsks;Pwd=123456789;";

        private string connectionString = "Server=MYSQL5016.Smarterasp.net;Database=db_9fa4a3_hardyt;Uid=9fa4a3_hardyt;Pwd=pass@123;";
        //private string connectionString = Settings.Default.DbConnection;

        private MySqlConnection dbcon { get; set; }
            public MySqlConnection GetDatabaseConnection()
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
            //public static void CloseDatabaseConnection()
            //{
            //    dbcon.Close();   
            //}
        }
}