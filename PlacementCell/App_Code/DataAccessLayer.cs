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

        public static bool isMemberExits(string un,string encPass,out string error)
        {
            using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection())
            {
                try
                {
                    MySqlCommand command = new MySqlCommand("sp_isMemberExits", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@u", MySqlDbType.VarChar).Value = un;
                    command.Parameters.Add("@p", MySqlDbType.VarChar).Value = encPass;
                    MySqlDataAdapter adapter = new MySqlDataAdapter();
                    DataTable dt = new DataTable();
                    connection.Open();
                    adapter.SelectCommand = command;
                    adapter.Fill(dt);
                    connection.Close();
                    if (dt.Rows.Count > 0)
                    {
                        error = null;
                        return true;
                    }
                    else {
                        error = null;
                        return false;
                    }

                }
                catch (Exception ex)
                {
                    //connection.Close();
                    error = ex.Message;
                    return false;
                }
                finally {
                    connection.Close();
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
                    connection.Open();
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

        public static bool isStudentRegSuccessful(string fname, string lname, string stream, string gender, string email, string hashval,out string error)
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
                    connection.Open();
                    int affectedRows = command.ExecuteNonQuery();
                    connection.Close();
                    if (affectedRows == 1)
                    {
                        error = null;
                        return true;
                    }
                    else {
                        error = null;
                        return false;
                    }
                }
                catch (Exception ex)
                {
                    connection.Close();
                    error = ex.Message;
                    return true;
                }
            }
        }

        public static bool isStudentSuccessfullyVerified(string id, out string error) {
            try
            {
                using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection())
                {
                    using (MySqlCommand command = new MySqlCommand("sp_studentVeriFied", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@id", MySqlDbType.Int32).Value = id;
                        // MySqlDataAdapter adapter = new MySqlDataAdapter();
                        connection.Open();
                        int affectedRows = command.ExecuteNonQuery();
                        connection.Close();
                        if (affectedRows == 1)
                        {
                            error = null;
                            return true;
                        }
                        else
                        {
                            error = null;
                            return false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                error = ex.Message;
                return true;
            }
        }
        public static bool isStudentExits(string email, string hashval,out string verified)
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
                    DataTable dt = new DataTable();
                    connection.Open();
                    adapter.SelectCommand = command;
                    adapter.Fill(dt);
                    connection.Close();
                    if (dt.Rows.Count == 1)
                    {
                        verified = dt.Rows[0].ItemArray[7].ToString();
                        return true;
                    }
                    else {
                        verified = null;
                        return false;
                    }

                }
                catch (Exception)
                {
                    verified = null;
                    //connection.Close();
                    return false;
                }

            }
        }

        public static bool isStudentDeleted(string stdEmail, out string error) {
            try
            {
                using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection())
                {
                    using (MySqlCommand command = new MySqlCommand("sp_deleteStudent", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@i", MySqlDbType.Int32).Value = stdEmail;
                        // MySqlDataAdapter adapter = new MySqlDataAdapter();
                        connection.Open();
                        int affectedRows = command.ExecuteNonQuery();
                        connection.Close();
                        if (affectedRows == 1)
                        {
                            error = null;
                            return true;
                        }
                        else
                        {
                            error = null;
                            return false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                error = ex.Message;
                return true;
            }
        }

        public static bool isStdEmailVerificationPending(string stdEmailId, out string verificationStatus, out string error) {
            try
            {
                using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection())
                {
                    using (MySqlCommand command = new MySqlCommand("sp_fetchStudentLogInDetails", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@e", MySqlDbType.VarChar).Value = stdEmailId;
                        MySqlDataAdapter adapter = new MySqlDataAdapter();
                        DataTable dt = new DataTable();
                        connection.Open();
                        adapter.SelectCommand = command;
                        adapter.Fill(dt);
                        connection.Close();
                        adapter.Dispose();
                        if (dt.Rows.Count == 1)
                        {
                            error = null;
                            verificationStatus = dt.Rows[0].ItemArray[7].ToString();
                            return true;
                        }
                        else {
                            error = null;
                            verificationStatus = null;
                            return false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                error = ex.Message;
                verificationStatus = null;
                return true;
            }
        }

        public static bool isNoticeCreated(string noticeCardTitle, string noticeCardDesc, string noticeCardLink, string noticeCardType)
        {
            using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection())
            {
                using (MySqlCommand command = new MySqlCommand("sp_addNewNotice", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@t", MySqlDbType.VarChar).Value = noticeCardTitle;
                    command.Parameters.Add("@d", MySqlDbType.VarChar).Value = noticeCardDesc;
                    command.Parameters.Add("@l", MySqlDbType.VarChar).Value = noticeCardLink;
                    command.Parameters.Add("@ty", MySqlDbType.VarChar).Value = noticeCardType;
                    connection.Open();
                    int affectedRows = command.ExecuteNonQuery();
                    connection.Close();
                    if (affectedRows == 1)
                    {
                        return true;
                    }
                    return false;
                }
            }
        }
        public static DataTable fetchNotices()
        {
            using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection()) {
                using (MySqlCommand command = new MySqlCommand("sp_fetchNotices", connection)) {
                    command.CommandType = CommandType.StoredProcedure;
                    //MySqlDataReader reader = command.ExecuteReader();
                    //DataSet ds = new DataSet();
                    //reader.
                    MySqlDataAdapter adapter = new MySqlDataAdapter();
                    DataSet ds = new DataSet();
                        connection.Open();
                    adapter.SelectCommand = command;
                    adapter.Fill(ds);
                    connection.Close();
                    DataTable dt = ds.Tables[0];
                    connection.Close();
                    return dt;
                }
            }
        }
        public static bool deleteNotices(int id , out string error) {
            try
            {
                using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection())
                {
                    using (MySqlCommand command = new MySqlCommand("sp_deleteEvent", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@i", MySqlDbType.Int32).Value = id;
                        // MySqlDataAdapter adapter = new MySqlDataAdapter();
                        connection.Open();
                        int affectedRows = command.ExecuteNonQuery();
                        connection.Close();
                        if (affectedRows == 1)
                        {
                            error = null;
                            return true;
                        }
                        else
                        {
                            error = null;
                            return false;
                        }
                    }
                }
            }
            catch (Exception ex) {
                error = ex.Message;
                return true; 
            }
        }
        public static bool isNoticeEdited(string id, string noticeCardTitle, string noticeCardDesc, string noticeCardLink, string noticeCardType, out string error) {
            try {
                using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection()) {
                    using (MySqlCommand command = new MySqlCommand("sp_isEditNotice", connection)) {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@i", MySqlDbType.Int32).Value = Convert.ToInt32(id);
                        command.Parameters.Add("@t", MySqlDbType.VarChar).Value = noticeCardTitle;
                        command.Parameters.Add("@d", MySqlDbType.VarChar).Value = noticeCardDesc;
                        command.Parameters.Add("@l", MySqlDbType.VarChar).Value = noticeCardLink;
                        command.Parameters.Add("@ty", MySqlDbType.VarChar).Value = noticeCardType;
                        int afftectedRows = command.ExecuteNonQuery();
                        connection.Close();
                        if (afftectedRows == 1) {
                            error = null;
                            return true;
                        }
                        else
                        {
                            error = null;
                            return false;
                        }
                    }
                }
            }
            catch (Exception ex) {
                error = ex.Message;
                return true;
            }
        }

        public static string fetchFname(string session_email) {
            using (MySqlConnection con = ConnectionManager.GetDatabaseConnection())
            {
                using (MySqlCommand cmd = new MySqlCommand("sp_fetchStudentLogInDetails", con)) {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@e", MySqlDbType.VarChar).Value = session_email;
                    DataTable dt = new DataTable();
                    MySqlDataAdapter adapter = new MySqlDataAdapter();
                    con.Open();
                    adapter.SelectCommand = cmd;
                    adapter.Fill(dt);
                    con.Close();
                    string fname;
                    if (dt.Rows.Count == 1)
                    {
                        fname = dt.Rows[0].ItemArray[1].ToString();
                    }
                    else {
                        fname = null;
                    }
                    return fname;
                }
            }
        }
        public static bool isPassChanged(string sessionUsername, string newPass,string sp_name, out string error) {
            try {
                using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection())
                {
                    using (MySqlCommand command = new MySqlCommand(sp_name, connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@np", MySqlDbType.VarChar).Value = newPass;
                        command.Parameters.Add("@sun", MySqlDbType.VarChar).Value = sessionUsername;
                        connection.Open();
                        int affectedRows = command.ExecuteNonQuery();
                        connection.Close();
                        if (affectedRows == 1)
                        {
                            error = null;
                            return true;
                        }
                        else {
                            error = null;
                            return false;
                        }
                    }
                }
            }
            catch (Exception ex) {
                error = ex.Message;
                return true;
            }
        }
        public static bool isEmailIDExist_getItsID(string emailID,string sp_name,out string error,out string id) {
            try{
                using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection())
                {
                    using (MySqlCommand command = new MySqlCommand(sp_name, connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@e", MySqlDbType.VarChar).Value = emailID;
                        MySqlDataAdapter adapter = new MySqlDataAdapter();
                        DataTable dt = new DataTable();
                        connection.Open();
                        adapter.SelectCommand = command;
                        adapter.Fill(dt);
                        connection.Close();
                        adapter.Dispose();
                        if (dt.Rows.Count == 1)
                        {
                            error = null;
                            id = dt.Rows[0].ItemArray[0].ToString();
                            return true;
                        }
                        else {
                            error = null;
                            id = null;
                            return false;
                        }
                    }
                }
            }
            catch (Exception ex) {
                error = ex.Message;
                id = null;
                return true;
            }
        }
        public static bool isUniqueCodeUpdated(string emailID,string uCode,out string error) {
            try
            {
                using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection())
                {
                    using (MySqlCommand command = new MySqlCommand("sp_isUniqueCodeSet", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@e", MySqlDbType.VarChar).Value = emailID;
                        command.Parameters.Add("@uc", MySqlDbType.VarChar).Value = uCode;
                        connection.Open();
                        int affectedRows = command.ExecuteNonQuery();
                        connection.Close();
                        if (affectedRows == 1)
                        {
                            error = null;
                            return true;
                        }
                        else {
                            error = null;
                            return false;
                        }
                    }
                }
            }
            catch(Exception ex) {
                error = ex.Message;
                return true;
            }
        }

        public static bool isTokenValid(string token,string id, out string error) {
            try
            {
                using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection())
                {
                    using (MySqlCommand command = new MySqlCommand("sp_isTokenValid", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        //command.Parameters.Add("@e", MySqlDbType.VarChar).Value = email;
                        command.Parameters.Add("@t", MySqlDbType.VarChar).Value = token;
                        command.Parameters.Add("@i", MySqlDbType.VarChar).Value = id;
                        MySqlDataAdapter adapter = new MySqlDataAdapter();
                        DataTable dt = new DataTable();
                        connection.Open();
                        adapter.SelectCommand = command;
                        adapter.Fill(dt);
                        connection.Close();
                        if (dt.Rows.Count > 0) // this is set to > 0 because in case the same token are generated then ==1 will not work. chances of same token generation is 0.001%.
                        {
                            error = null;
                            return true;
                        }
                        else {
                            error = null;
                            return false;
                        }
                    }
                }
            }
            catch (Exception ex) {
                error = ex.Message;
                return true;
            }
        }
        public static string getSvvmailOfstdID(string id,out string error) {
            try
            {
                using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection())
                {
                    using (MySqlCommand command = new MySqlCommand("sp_getSvvMailIDofStdID", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@id", MySqlDbType.VarChar).Value = id;
                        MySqlDataAdapter adapter = new MySqlDataAdapter();
                        DataTable dt = new DataTable();
                        connection.Open();
                        adapter.SelectCommand = command;
                        adapter.Fill(dt);
                        connection.Close();
                        if (dt.Rows.Count > 0) // this is set to > 0 because in case the same token are generated then ==1 will not work. chances of same token generation is 0.001%.
                        {
                            error = null;
                            string svvmailid = dt.Rows[0].ItemArray[0].ToString();
                            return svvmailid;
                        }
                        else {
                            error = null;
                            return null;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                error = ex.Message;
                return null;
            }
        }

        public static bool isPassResetSuccessfully(string id,string newPass,out string error)
        {
            try
            {
                using (MySqlConnection connection = ConnectionManager.GetDatabaseConnection())
                {
                    using (MySqlCommand command = new MySqlCommand("sp_isPassResetSuccessfully", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@id", MySqlDbType.VarChar).Value = id;
                        command.Parameters.Add("@np", MySqlDbType.VarChar).Value = newPass;
                        connection.Open();
                        int affectedRows = command.ExecuteNonQuery();
                        connection.Close();
                        if (affectedRows == 1) 
                        {
                            error = null;
                            return true;
                        }
                        else {
                            error = null;
                            return false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                error = ex.Message;
                return true;
            }
        }

        public static DataTable fetchClass() {
            using (MySqlConnection con = ConnectionManager.GetDatabaseConnection()) {
                using (MySqlCommand cmd = new MySqlCommand("sp_fetchClassName",con)) {
                    cmd.CommandType = CommandType.StoredProcedure;
                    MySqlDataAdapter adapter = new MySqlDataAdapter();
                    DataSet ds = new DataSet();
                    con.Open();
                    adapter.SelectCommand = cmd;
                    adapter.Fill(ds);
                    con.Close();
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

