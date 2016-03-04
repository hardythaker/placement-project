using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class student_profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["student_username"] != null)
                {
                    
                    fetchStudentPersonalData(Session["student_username"].ToString());
                }
                else {
                    Response.Redirect("studentLogin.aspx");
                }
            }
        }

        private void fetchStudentPersonalData(string svvID)
        {
            string this_error;
            DataSet ds = new DataSet(); 
            ds = DataAccessLayer.fetchStdFullDetailIfExist(svvID,out this_error);
            if (this_error == null)
            {
                if (ds.Tables[0].Rows.Count > 0 || ds.Tables[1].Rows.Count > 0 || ds.Tables[2].Rows.Count > 0 || ds.Tables[3].Rows.Count > 0 || ds.Tables[4].Rows.Count > 0)
                {
                    DataTable personal = ds.Tables[0];
                    DataTable ty = ds.Tables[1];
                    DataTable hsc = ds.Tables[2];
                    DataTable ssc = ds.Tables[3];
                    DataTable other = ds.Tables[4];
                    if (personal.Rows.Count == 1)
                    {

                        DataRow dr = personal.Rows[0];
                        lbl_name.Text = dr.ItemArray[0] + " " + dr.ItemArray[1] + " " + dr.ItemArray[2] + " " + dr.ItemArray[3];
                        lbl_email.Text = dr.ItemArray[4].ToString();
                        lbl_gender.Text = dr.ItemArray[5].ToString();
                        lbl_maritial.Text = dr.ItemArray[6].ToString();
                        lbl_mobile_dob.Text = dr.ItemArray[7].ToString();
                        lbl_dob.Text = dr.ItemArray[8].ToString();


                    }
                    else
                    {
                        div_PersonalData_Not_Exist.Style["display"] = "block";
                        div_PersonalData_Exist.Style["display"] = "none";
                    }
                    if (ty.Rows.Count > 0)
                    {
                        DataRow dr = ty.Rows[0];
                        lbl_branch.Text = dr.ItemArray[0].ToString();
                        lbl_division.Text = dr.ItemArray[1].ToString();
                        lbl_rollNo.Text = dr.ItemArray[2].ToString();
                        lbl_backlogs.Text = dr.ItemArray[3].ToString();
                        lbl_sem1M.Text = dr.ItemArray[4].ToString() + "/" + dr.ItemArray[5].ToString() +" = "+ dr.ItemArray[12].ToString();
                        lbl_sem2M.Text = dr.ItemArray[6].ToString() + "/" + dr.ItemArray[7].ToString() + " = " + dr.ItemArray[13].ToString();
                        lbl_sem3M.Text = dr.ItemArray[8].ToString() + "/" + dr.ItemArray[9].ToString() + " = " + dr.ItemArray[14].ToString();
                        lbl_sem4M.Text = dr.ItemArray[10].ToString() + "/" + dr.ItemArray[11].ToString() + " = " + dr.ItemArray[15].ToString();
                        lbl_gradAvgP.Text = dr.ItemArray[16].ToString();
                    }
                    else
                    {
                        div_GradData_Not_Exist.Style["display"] = "block";
                        div_GradData_Exist.Style["display"] = "none";
                    }
                    if (hsc.Rows.Count > 0)
                    {
                        DataRow dr = hsc.Rows[0];
                        lbl_HscBoardName.Text = dr.ItemArray[0].ToString();
                        lbl_HscSpecialization.Text = dr.ItemArray[1].ToString();
                        lbl_HscCourseType.Text = dr.ItemArray[2].ToString();
                        lbl_HscM.Text = dr.ItemArray[3].ToString() + "/" +dr.ItemArray[4].ToString()+" = "+ dr.ItemArray[5].ToString();
                    }
                    else
                    {
                        div_Hsc_DataNotExist.Style["display"] = "block";
                        div_Hsc_DataExist.Style["display"] = "none";
                    }
                    if (ssc.Rows.Count > 0)
                    {
                        DataRow dr = ssc.Rows[0];
                        lbl_SscBoardName.Text = dr.ItemArray[0].ToString();
                        lbl_SscCourseType.Text = dr.ItemArray[1].ToString();
                        lbl_SscM.Text = dr.ItemArray[2].ToString() + "/" + dr.ItemArray[3].ToString() + " = " + dr.ItemArray[4].ToString();
                    }
                    else
                    {
                        div_Ssc_DataNotExist.Style["display"] = "block";
                        div_Ssc_DataExist.Style["display"] = "none";
                    }
                    if (other.Rows.Count > 0)
                    {
                        DataRow dr = other.Rows[0];
                        lbl_OtherDetail_Break.Text = dr.ItemArray[0].ToString();
                    }
                    else
                    {
                        div_other_DataNotExist.Style["display"] = "block";
                        div_other_DataExist.Style["display"] = "none";
                    }
                }
                else
                {
                    div_overAllData_Not_Exist.Style["display"] = "block";
                    div_overAllData_Exist.Style["display"] = "none";
                }
            }
            else
            {
                lbl_dataFetchingError.Text = this_error;
                div_overAllData.Style["display"] = "none";
            }
        }
    }
}