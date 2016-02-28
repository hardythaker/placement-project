using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class student_AcademicDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["student_username"] == null)
                {
                    Response.Redirect("studentLogin.aspx");
                }
                else
                {
                    bindDDL();
                    string error;
                    DataTable dt = new DataTable();
                    string sp_name = "sp_fetchStdTyData";
                    dt = DataAccessLayer.fetchStdDetailIfExist(sp_name, Session["student_username"].ToString(),out error);
                    if (error == null)
                    {
                        if (dt.Rows.Count == 1)
                        {
                            div_edit.Style["display"] = "block";
                            div_save.Style["display"] = "none";
                            listClass.Items.FindByValue(dt.Rows[0].ItemArray[0].ToString()).Selected = true;
                            listDivision.Items.FindByValue(dt.Rows[0].ItemArray[1].ToString()).Selected = true;
                            tb_RollNo.Text = dt.Rows[0].ItemArray[2].ToString();
                            tb_backlogs.Text = dt.Rows[0].ItemArray[3].ToString();
                            tb_sem1Marks.Text = dt.Rows[0].ItemArray[4].ToString();
                            tb_sem1TotalMarks.Text = dt.Rows[0].ItemArray[5].ToString();
                            tb_sem2Marks.Text = dt.Rows[0].ItemArray[6].ToString();
                            tb_sem2TotalMarks.Text = dt.Rows[0].ItemArray[7].ToString();
                            tb_sem3Marks.Text = dt.Rows[0].ItemArray[8].ToString();
                            tb_sem3TotalMarks.Text = dt.Rows[0].ItemArray[9].ToString();
                            tb_sem4Marks.Text = dt.Rows[0].ItemArray[10].ToString();
                            tb_sem4TotalMarks.Text = dt.Rows[0].ItemArray[11].ToString();
                            hideControls(true);
                        }
                    }
                    else {
                        lbl_student_TyDetailsStatus.ForeColor = System.Drawing.Color.Red;
                        lbl_student_TyDetailsStatus.Text = "<br>" + error;
                    }
                    
                }

            }
        }

        protected void btn_saveAndContinue_Click(object sender, EventArgs e)
        {
            string error;
            uploadTyDetails(out error);
            if (error == null)
            {
                //Response.Redirect("student_HSCAcademicDetails.aspx");
                lbl_student_TyDetailsStatus.Text = "redirected";
            }
            else
            {
                lbl_student_TyDetailsStatus.ForeColor = System.Drawing.Color.Red;
                lbl_student_TyDetailsStatus.Text = error;
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            string error;
            uploadTyDetails(out error);
            if (error == null)
            {
                hideControls(true);
                div_edit.Style["display"] = "block";
                div_save.Style["display"] = "none";
                lbl_student_TyDetailsStatus.CssClass = "mdl-color-text--primary";
                lbl_student_TyDetailsStatus.Text = "<br>Data Successfully Saved";
            }
            else
            {
                lbl_student_TyDetailsStatus.ForeColor = System.Drawing.Color.Red;
                lbl_student_TyDetailsStatus.Text = error;
            }
        }

        protected void btn_Edit_Click(object sender, EventArgs e)
        {
            div_edit.Style["display"] = "none";
            div_save.Style["display"] = "block";
            hideControls(false);
        }

        protected void btn_next_Click(object sender, EventArgs e)
        {
            //Response.Redirect("student_HSCAcademicDetails.aspx");
            lbl_student_TyDetailsStatus.Text = "redirected";
        }

        private void bindDDL()
        {
            DataSet ds = DataAccessLayer.fetchClassDivision();
            listClass.DataSource = ds.Tables[0];
            listClass.DataTextField = "branch";
            listClass.DataValueField = "branch_id";
            listClass.DataBind();
            listClass.Items.Insert(0, new ListItem("--Stream--", "0"));
            // dt.Clear();
            listDivision.DataSource = ds.Tables[1];
            listDivision.DataTextField = "division_name";
            listDivision.DataValueField = "division_id";
            listDivision.DataBind();
            listDivision.Items.Insert(0, new ListItem("--Division--", "0"));
        }

        private void hideControls(bool option)
        {
            listClass.Enabled = !option;
            listDivision.Enabled = !option;
            tb_RollNo.ReadOnly = option;
            tb_backlogs.ReadOnly = option;
            tb_sem1Marks.ReadOnly = option;
            tb_sem1TotalMarks.ReadOnly = option;
            tb_sem2Marks.ReadOnly = option;
            tb_sem2TotalMarks.ReadOnly = option;
            tb_sem3Marks.ReadOnly = option;
            tb_sem3TotalMarks.ReadOnly = option;
            tb_sem4Marks.ReadOnly = option;
            tb_sem4TotalMarks.ReadOnly = option;
        }

        private void uploadTyDetails(out string this_error)
        {
            string svvID, stream, division, rollno, backlogs, sem1_marks, sem2_marks, sem3_marks, sem4_marks, sem1_total, sem2_total, sem3_total, sem4_total, error;
            svvID = "rithu.dhanki@somaiya.edu";
            stream = listClass.SelectedValue.ToString();
            division = listDivision.SelectedValue.ToString();
            rollno = tb_RollNo.Text;
            backlogs = tb_backlogs.Text;
            sem1_marks = tb_sem1Marks.Text;
            sem1_total = tb_sem1TotalMarks.Text;
            sem2_marks = tb_sem2Marks.Text;
            sem2_total = tb_sem2TotalMarks.Text;
            sem3_marks = tb_sem3Marks.Text;
            sem3_total = tb_sem3TotalMarks.Text;
            sem4_marks = tb_sem4Marks.Text;
            sem4_total = tb_sem4TotalMarks.Text;
            if (DataAccessLayer.isStdTYAcademicDetailsUpdated(svvID, stream, division, rollno, backlogs, sem1_marks, sem1_total, sem2_marks, sem2_total, sem3_marks, sem3_total, sem4_marks, sem4_total, out error))
            {
                if (error == null)
                {
                    this_error = null;

                }
                else
                {
                    this_error = error;

                }
            }
            else {
                this_error = "Some Error Occured";
            }

        }
    }
}