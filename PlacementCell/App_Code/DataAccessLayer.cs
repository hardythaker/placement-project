using System;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PlacementCell
{
    public class DataAccessLayer
    {
        public static DataSet DisplayAllUsers()
        {
            DataSet dSet = new DataSet();
            using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection())
            {
                try
                {
                    MySqlCommand command = new MySqlCommand("spDisplayAll", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    MySqlDataAdapter adapter = new MySqlDataAdapter();
                    adapter.SelectCommand = command;
                    adapter.Fill(dSet);
                    connection.Close();
                }
                catch (Exception)
                {
                    throw;
                }
                return dSet;
            }
        }
        public static bool isMemberExits(string un,string encPass)
        {
            //DataSet dSet = new DataSet();
            using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection())
            {
                try
                {
                    MySqlCommand command = new MySqlCommand("sp_isMemberExits", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@u", MySqlDbType.VarChar).Value = un;
                    command.Parameters.Add("@p", MySqlDbType.VarChar).Value = encPass;
                    MySqlDataAdapter adapter = new MySqlDataAdapter();
                    adapter.SelectCommand = command;
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    connection.Close();
                    if (dt.Rows.Count > 0)
                    {
                        return true;
                    }
                    else return false;
                    
                }
                catch (Exception)
                {
                    connection.Close();
                    return false;
                }
                
            }
        }
        public static bool isMemRegSuccessful(string un, string encPwd)
        {
            using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection())
            {
                try
                {
                    MySqlCommand command = new MySqlCommand("sp_regMembers", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@un", MySqlDbType.VarChar).Value = un;
                    command.Parameters.Add("@p", MySqlDbType.VarChar).Value = encPwd;

                    //command.Parameters.AddWithValue("@username", username);
                    //command.Parameters.AddWithValue("@encPass", encPass);

                    //MySqlDataAdapter adapter = new MySqlDataAdapter();
                    //adapter.InsertCommand = command;
                    int affectedrows = command.ExecuteNonQuery();
                    connection.Close();
                    if (affectedrows == 1)
                    {
                        return true;
                    }
                    else return false;
                }
                catch (Exception)
                {
                    connection.Close();
                    return false;
                }
            }
        }

        public static bool isStudentRegSuccessful(string fname, string lname, string stream, string gender, string email, string hashval)
        {
            using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection())
            {
                try
                {
                    MySqlCommand command = new MySqlCommand("sp_regStudents", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@f", MySqlDbType.VarChar).Value = fname;
                    command.Parameters.Add("@l", MySqlDbType.VarChar).Value = lname;
                    command.Parameters.Add("@s", MySqlDbType.VarChar).Value = stream;
                    command.Parameters.Add("@g", MySqlDbType.Text).Value = gender;
                    command.Parameters.Add("@e", MySqlDbType.VarChar).Value = email;
                    command.Parameters.Add("@p", MySqlDbType.VarChar).Value = hashval;
                    int affectedrows = command.ExecuteNonQuery();
                    connection.Close();
                    if (affectedrows == 1)
                    {
                        return true;
                    }
                    else return false;
                }
                catch (Exception)
                {
                    connection.Close();
                    return false;
                }
            }
        }

        public static bool isStudentExits(string email, string hashval)
        {
            using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection())
            {
                try
                {
                    MySqlCommand command = new MySqlCommand("sp_isStudentExits", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@e", MySqlDbType.VarChar).Value = email;
                    command.Parameters.Add("@p", MySqlDbType.VarChar).Value = hashval;
                    MySqlDataAdapter adapter = new MySqlDataAdapter();
                    adapter.SelectCommand = command;
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    connection.Close();
                    if (dt.Rows.Count > 0)
                    {
                        return true;
                    }
                    else return false;

                }
                catch (Exception)
                {
                    connection.Close();
                    return false;
                }

            }
        }

        public static bool isPageUploaded(string title, string pagename, string place)
        {
            using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection())
            {
                using (MySqlCommand command = new MySqlCommand("sp_addNewPage", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@t", MySqlDbType.VarChar).Value = title;
                    command.Parameters.Add("@pn", MySqlDbType.VarChar).Value = pagename;
                    command.Parameters.Add("@pl", MySqlDbType.VarChar).Value = place;
                    int affectedRows = command.ExecuteNonQuery();
                    if (affectedRows == 1)
                    {
                        return true;
                    }
                    return false;
                }
            }
        }

        public static string fetchFname(string email) {
            using (MySqlConnection con = ConnectionManager.GetDatabaseConnection()) {
                using (MySqlCommand cmd = new MySqlCommand("sp_fetchFname", con)) {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@e", MySqlDbType.VarChar).Value = email;
                    MySqlDataReader reader = cmd.ExecuteReader();
                    reader.Read();
                    string fname = reader.GetString("fname");
                    //MySqlDataAdapter adapter = new MySqlDataAdapter();
                    //adapter.SelectCommand = cmd;
                    //string fname;
                    //adapter.Fill(fname);
                    return fname;
                }
            }
        }
        public static DataTable fetchClass() {
            using (MySqlConnection con = ConnectionManager.GetDatabaseConnection()) {
                using (MySqlCommand cmd = new MySqlCommand("sp_fetchClassName",con)) {
                    cmd.CommandType = CommandType.StoredProcedure;
                    MySqlDataAdapter adapter = new MySqlDataAdapter();
                    adapter.SelectCommand = cmd;
                    con.Close();
                    DataSet ds = new DataSet();
                    adapter.Fill(ds);
                    DataTable dt = ds.Tables[0];
                    return dt;
                }
            }
        }

        public static DataTable fetchDivision()
        {
            using (MySqlConnection con = ConnectionManager.GetDatabaseConnection())
            {
                using (MySqlCommand cmd = new MySqlCommand("sp_fetchDivision", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    MySqlDataAdapter adapter = new MySqlDataAdapter();
                    adapter.SelectCommand = cmd;
                    con.Close();
                    DataSet ds = new DataSet();
                    adapter.Fill(ds);
                    DataTable dt = ds.Tables[0];
                    return dt;
                }
            }
        }

        public static DataTable fetchSemester()
        {
            using (MySqlConnection con = ConnectionManager.GetDatabaseConnection())
            {
                using (MySqlCommand cmd = new MySqlCommand("sp_fetchSemester", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    MySqlDataAdapter adapter = new MySqlDataAdapter();
                    adapter.SelectCommand = cmd;
                    con.Close();
                    DataSet ds = new DataSet();
                    adapter.Fill(ds);
                    DataTable dt = ds.Tables[0];
                    return dt;
                }
            }
        }

    }
}
