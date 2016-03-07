using System;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PlacementCell
{
    internal class DataAccessLayer
    {
        public static DataTable showAllStudent(out string error)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
                {
                    using (MySqlCommand command = new MySqlCommand("sp_ShowAllStudent", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        MySqlDataAdapter adapter = new MySqlDataAdapter();
                        DataSet dSet = new DataSet();
                        connection.Open();
                        adapter.SelectCommand = command;
                        adapter.Fill(dSet);
                        connection.Close();
                        DataTable dt = dSet.Tables[0];
                        error = null;
                        return dt;
                    }
                }
            }
            catch (Exception ex)
            {
                error = ex.Message;
                return null;
            }
        }

        public static DataTable getAllStudentData()
        {
            using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
            {
                using (MySqlCommand command = new MySqlCommand("sp_fetchStudentDetails", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    MySqlDataAdapter adapter = new MySqlDataAdapter();
                    DataSet dSet = new DataSet();
                    connection.Open();
                    adapter.SelectCommand = command;
                    adapter.Fill(dSet);
                    connection.Close();
                    DataTable dt = dSet.Tables[0];
                    return dt;
                }
            }
        }


        public static bool isMemberExits(string un, string encPass, out string error)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
                {
                    using (MySqlCommand command = new MySqlCommand("sp_isMemberExits", connection))
                    {
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
                }

            }
            catch (Exception ex)
            {
                error = ex.Message;
                return true;
            }
        }

        

        public static bool isMemRegSuccessful(string un, string encPwd)
        {
            using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
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




        public static bool isStudentRegSuccessful(string fname, string lname, string stream, string gender, string email, string hashval, out string error)
        {
            using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
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
        public static bool isStudentSuccessfullyVerified(string id, out string error)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
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
        public static bool isStudentExits(string email, string hashval, out string verified, out string error)
        {
            using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
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
                        error = null;
                        verified = dt.Rows[0].ItemArray[7].ToString();
                        return true;
                    }
                    else {
                        error = null;
                        verified = null;
                        return false;
                    }

                }
                catch (Exception ex)
                {
                    error = ex.Message;
                    verified = null;
                    //connection.Close();
                    return true;
                }

            }
        }
        public static bool isStudentDeleted(string stdEmail, out string error)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
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
        public static bool isStdEmailVerificationPending(string stdEmailId, out string verificationStatus, out string error)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
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
                        //adapter.Dispose();
                        if (dt.Rows.Count == 1)
                        {
                            verificationStatus = dt.Rows[0].ItemArray[7].ToString();
                            error = null;
                            return true;
                        }
                        else {
                            verificationStatus = null;
                            error = null;
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

        public static bool isStdPersonalDetailsUpdated(string svv, string honorifics, string fname, string mname, string lname, string email, string gender, string maritial, string mobileno, string dob, out string error)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
                {
                    using (MySqlCommand command = new MySqlCommand("sp_addStdPersonalDetails", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@svvID", MySqlDbType.VarChar).Value = svv;
                        command.Parameters.Add("@h", MySqlDbType.VarChar).Value = honorifics;
                        command.Parameters.Add("@f", MySqlDbType.VarChar).Value = fname;
                        command.Parameters.Add("@m", MySqlDbType.VarChar).Value = mname;
                        command.Parameters.Add("@l", MySqlDbType.VarChar).Value = lname;
                        command.Parameters.Add("@e", MySqlDbType.VarChar).Value = email;
                        command.Parameters.Add("@g", MySqlDbType.VarChar).Value = gender;
                        command.Parameters.Add("@ms", MySqlDbType.VarChar).Value = maritial;
                        command.Parameters.Add("@mn", MySqlDbType.VarChar).Value = mobileno;
                        command.Parameters.Add("@dob", MySqlDbType.VarChar).Value = dob;
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
        public static DataTable fetchStdDetailIfExist(string sp_name, string svvMailID, out string error)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
                {
                    using (MySqlCommand command = new MySqlCommand(sp_name, connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@svvID", MySqlDbType.VarChar).Value = svvMailID;
                        MySqlDataAdapter adapter = new MySqlDataAdapter();
                        DataSet ds = new DataSet();
                        connection.Open();
                        adapter.SelectCommand = command;
                        adapter.Fill(ds);
                        connection.Close();
                        DataTable dt = ds.Tables[0];
                        error = null;
                        return dt;
                    }
                }
            }
            catch (Exception ex)
            {
                error = ex.Message;
                return null;
            }
        }
        public static DataSet fetchStdFullDetailIfExist(string svvMailID, out string error)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
                {
                    using (MySqlCommand command_personalData = new MySqlCommand("sp_fetchStdPersonalData", connection))
                    {
                        using (MySqlCommand command_GradData = new MySqlCommand("sp_fetchStdTyData", connection))
                        {
                            using (MySqlCommand command_HscData = new MySqlCommand("sp_fetchStdHscData", connection))
                            {
                                using (MySqlCommand command_SScData = new MySqlCommand("sp_fetchStdSscData", connection))
                                {
                                    using (MySqlCommand command_OtherData = new MySqlCommand("sp_fetchStdOtherDetailsData", connection))
                                    {
                                        command_personalData.CommandType = CommandType.StoredProcedure;
                                        command_GradData.CommandType = CommandType.StoredProcedure;
                                        command_HscData.CommandType = CommandType.StoredProcedure;
                                        command_SScData.CommandType = CommandType.StoredProcedure;
                                        command_OtherData.CommandType = CommandType.StoredProcedure;

                                        command_personalData.Parameters.Add("@svvID", MySqlDbType.VarChar).Value = svvMailID;
                                        command_GradData.Parameters.Add("@svvID", MySqlDbType.VarChar).Value = svvMailID;
                                        command_HscData.Parameters.Add("@svvID", MySqlDbType.VarChar).Value = svvMailID;
                                        command_SScData.Parameters.Add("@svvID", MySqlDbType.VarChar).Value = svvMailID;
                                        command_OtherData.Parameters.Add("@svvID", MySqlDbType.VarChar).Value = svvMailID;

                                        MySqlDataAdapter adapterPerosnal = new MySqlDataAdapter();
                                        MySqlDataAdapter adapterTy = new MySqlDataAdapter();
                                        MySqlDataAdapter adapterHsc = new MySqlDataAdapter();
                                        MySqlDataAdapter adapterSsc = new MySqlDataAdapter();
                                        MySqlDataAdapter adapterOther = new MySqlDataAdapter();

                                        DataSet ds = new DataSet();
                                        DataTable perosnal= new DataTable();
                                        DataTable ty= new DataTable();
                                        DataTable hsc= new DataTable();
                                        DataTable ssc= new DataTable();
                                        DataTable other = new DataTable();

                                        connection.Open();
                                        MySqlTransaction tranCon = connection.BeginTransaction();
                                        adapterPerosnal.SelectCommand = command_personalData;
                                        adapterTy.SelectCommand = command_GradData;
                                        adapterHsc.SelectCommand = command_HscData;
                                        adapterSsc.SelectCommand = command_SScData;
                                        adapterOther.SelectCommand = command_OtherData;

                                        adapterPerosnal.Fill(perosnal);
                                        adapterTy.Fill(ty);
                                        adapterHsc.Fill(hsc);
                                        adapterSsc.Fill(ssc);
                                        adapterOther.Fill(other);

                                        tranCon.Commit();
                                        connection.Close();

                                        ds.Tables.Add(perosnal);
                                        ds.Tables.Add(ty);
                                        ds.Tables.Add(hsc);
                                        ds.Tables.Add(ssc);
                                        ds.Tables.Add(other);

                                        error = null;
                                        return ds;
                                    }
                                }
                            }
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
        public static bool isStdTYAcademicDetailsUpdated(string svvmailID, string branch, string division, string rollno, string backlogs, string sem1M, string sem1TM, string sem2M, string sem2TM, string sem3M, string sem3TM, string sem4M, string sem4TM, string sem1per, string sem2per, string sem3per, string sem4per, string totalAvg, out string error)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
                {
                    using (MySqlCommand command = new MySqlCommand("sp_addStdTYDetails", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@svvID", MySqlDbType.VarChar).Value = svvmailID;
                        command.Parameters.Add("@b", MySqlDbType.VarChar).Value = branch;
                        command.Parameters.Add("@d", MySqlDbType.VarChar).Value = division;
                        command.Parameters.Add("@r", MySqlDbType.VarChar).Value = rollno;
                        command.Parameters.Add("@bl", MySqlDbType.VarChar).Value = backlogs;
                        command.Parameters.Add("@s1m", MySqlDbType.VarChar).Value = sem1M;
                        command.Parameters.Add("@s1t", MySqlDbType.VarChar).Value = sem1TM;
                        command.Parameters.Add("@s2m", MySqlDbType.VarChar).Value = sem2M;
                        command.Parameters.Add("@s2t", MySqlDbType.VarChar).Value = sem2TM;
                        command.Parameters.Add("@s3m", MySqlDbType.VarChar).Value = sem3M;
                        command.Parameters.Add("@s3t", MySqlDbType.VarChar).Value = sem3TM;
                        command.Parameters.Add("@s4m", MySqlDbType.VarChar).Value = sem4M;
                        command.Parameters.Add("@s4t", MySqlDbType.VarChar).Value = sem4TM;
                        command.Parameters.Add("@s1p", MySqlDbType.VarChar).Value = sem1per;
                        command.Parameters.Add("@s2p", MySqlDbType.VarChar).Value = sem2per;
                        command.Parameters.Add("@s3p", MySqlDbType.VarChar).Value = sem3per;
                        command.Parameters.Add("@s4p", MySqlDbType.VarChar).Value = sem4per;
                        command.Parameters.Add("@ta", MySqlDbType.VarChar).Value = totalAvg;
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
        public static bool isStdHscAcademicDetailsUpdated(string svvmailID, string board, string specialization, string courseType, string hscMarks, string hscTotalMarks, string hscPer, out string error)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
                {
                    using (MySqlCommand command = new MySqlCommand("sp_addStdHscDetails", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@svvID", MySqlDbType.VarChar).Value = svvmailID;
                        command.Parameters.Add("@b", MySqlDbType.VarChar).Value = board;
                        command.Parameters.Add("@s", MySqlDbType.VarChar).Value = specialization;
                        command.Parameters.Add("@c", MySqlDbType.VarChar).Value = courseType;
                        command.Parameters.Add("@hm", MySqlDbType.VarChar).Value = hscMarks;
                        command.Parameters.Add("@htm", MySqlDbType.VarChar).Value = hscTotalMarks;
                        command.Parameters.Add("@hp", MySqlDbType.VarChar).Value = hscPer;
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
        public static bool isStdSscAcademicDetailsUpdated(string svvmailID, string board, string courseType, string SscMarks, string SscTotalMarks, string SscPer, out string error)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
                {
                    using (MySqlCommand command = new MySqlCommand("sp_addStdSscDetails", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@svvID", MySqlDbType.VarChar).Value = svvmailID;
                        command.Parameters.Add("@b", MySqlDbType.VarChar).Value = board;
                        command.Parameters.Add("@c", MySqlDbType.VarChar).Value = courseType;
                        command.Parameters.Add("@Sm", MySqlDbType.VarChar).Value = SscMarks;
                        command.Parameters.Add("@Stm", MySqlDbType.VarChar).Value = SscTotalMarks;
                        command.Parameters.Add("@Sp", MySqlDbType.VarChar).Value = SscPer;
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
        public static bool isStdOthersDetailsUpdated(string svvmailID, string breakYear, out string error)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
                {
                    using (MySqlCommand command = new MySqlCommand("sp_addStdOtherDetails", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@svvID", MySqlDbType.VarChar).Value = svvmailID;
                        command.Parameters.Add("@b", MySqlDbType.VarChar).Value = breakYear;
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

        public static bool isNoticeCreated(string noticeCardTitle, string noticeCardDesc, string noticeCardLink, string noticeCardType, string noticesection)
        {
            using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
            {
                using (MySqlCommand command = new MySqlCommand("sp_addNewNotice", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@t", MySqlDbType.VarChar).Value = noticeCardTitle;
                    command.Parameters.Add("@d", MySqlDbType.VarChar).Value = noticeCardDesc;
                    command.Parameters.Add("@l", MySqlDbType.VarChar).Value = noticeCardLink;
                    command.Parameters.Add("@ty", MySqlDbType.VarChar).Value = noticeCardType;
                    command.Parameters.Add("@s", MySqlDbType.VarChar).Value = noticesection;
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
        public static DataTable fetchNotices(string section_id)
        {
            using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
            {
                using (MySqlCommand command = new MySqlCommand("sp_fetchNotices", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@s", MySqlDbType.VarChar).Value = section_id;
                    //MySqlDataReader reader = command.ExecuteReader();
                    //DataSet ds = new DataSet();
                    //reader.
                    MySqlDataAdapter adapter = new MySqlDataAdapter();
                    DataSet ds = new DataSet();
                    if (connection.State != ConnectionState.Open)
                    {
                        connection.Close();
                        connection.Open();
                    }
                    adapter.SelectCommand = command;
                    adapter.Fill(ds);
                    connection.Close();
                    DataTable dt = ds.Tables[0];
                    connection.Close();
                    return dt;
                }
            }
        }
        public static bool deleteNotices(int id, out string error)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
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
            catch (Exception ex)
            {
                error = ex.Message;
                return true;
            }
        }
        public static bool isNoticeEdited(string id, string noticeCardTitle, string noticeCardDesc, string noticeCardLink, string noticeCardType, string noticeCardSectionID, out string error)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
                {

                    using (MySqlCommand command = new MySqlCommand("sp_isEditNotice", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@i", MySqlDbType.Int32).Value = Convert.ToInt32(id);
                        command.Parameters.Add("@t", MySqlDbType.VarChar).Value = noticeCardTitle;
                        command.Parameters.Add("@d", MySqlDbType.VarChar).Value = noticeCardDesc;
                        command.Parameters.Add("@l", MySqlDbType.VarChar).Value = noticeCardLink;
                        command.Parameters.Add("@ty", MySqlDbType.VarChar).Value = noticeCardType;
                        command.Parameters.Add("@s", MySqlDbType.VarChar).Value = noticeCardSectionID;
                        connection.Open();
                        int afftectedRows = command.ExecuteNonQuery();
                        connection.Close();
                        if (afftectedRows == 1)
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



        public static string fetchFname(string session_email)
        {
            using (MySqlConnection con = new ConnectionManager().GetDatabaseConnection())
            {
                using (MySqlCommand cmd = new MySqlCommand("sp_fetchStudentLogInDetails", con))
                {
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



        public static bool isPassChanged(string sessionUsername, string newPass, string sp_name, out string error)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
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
            catch (Exception ex)
            {
                error = ex.Message;
                return true;
            }
        }



        public static bool isEmailIDExist_getItsID(string emailID, string sp_name, out string error, out string id)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
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
            catch (Exception ex)
            {
                error = ex.Message;
                id = null;
                return true;
            }
        }



        public static bool isUniqueCodeUpdated(string emailID, string uCode, out string error)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
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
            catch (Exception ex)
            {
                error = ex.Message;
                return true;
            }
        }
        public static bool isTokenValid(string token, string id, out string error)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
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
            catch (Exception ex)
            {
                error = ex.Message;
                return true;
            }
        }



        public static string getSvvmailOfstdID(string id, out string error)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
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
        public static bool isPassResetSuccessfully(string id, string newPass, out string error)
        {
            try
            {
                using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
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



        public static DataSet fetchClassDivision()
        {
            using (MySqlConnection con = new ConnectionManager().GetDatabaseConnection())
            {

                using (MySqlCommand cmd = new MySqlCommand("sp_fetchBranches", con))
                {
                    using (MySqlCommand cmddiv = new MySqlCommand("sp_fetchDivisions", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmddiv.CommandType = CommandType.StoredProcedure;
                        MySqlDataAdapter classes = new MySqlDataAdapter();
                        MySqlDataAdapter division = new MySqlDataAdapter();
                        DataSet ds = new DataSet();
                        DataTable d1 = new DataTable();
                        DataTable d2 = new DataTable();
                        con.Open();
                        MySqlTransaction tranCon = con.BeginTransaction();
                        classes.SelectCommand = cmd;
                        division.SelectCommand = cmddiv;
                        classes.Fill(d1);
                        division.Fill(d2);
                        tranCon.Commit();
                        con.Close();
                        ds.Tables.Add(d1);
                        ds.Tables.Add(d2);
                        return ds;
                    }
                }
            }
        }
        public static DataSet fetchBoard(string sp_name)
        {
            using (MySqlConnection connection = new ConnectionManager().GetDatabaseConnection())
            {
                using (MySqlCommand command = new MySqlCommand(sp_name, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    MySqlDataAdapter board = new MySqlDataAdapter();
                    DataSet ds = new DataSet();
                    connection.Open();
                    board.SelectCommand = command;
                    board.Fill(ds);
                    connection.Close();
                    return ds;
                }
            }
        }
        public static DataTable fetchDivision()
        {
            using (MySqlConnection con = new ConnectionManager().GetDatabaseConnection())
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
            using (MySqlConnection con = new ConnectionManager().GetDatabaseConnection())
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

