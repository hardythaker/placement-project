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
                            DataRow dr = dt.Rows[0];
                            div_edit.Style["display"] = "block";
                            div_save.Style["display"] = "none";
                            listClass.Items.FindByText(dr.ItemArray[0].ToString()).Selected = true;
                            listDivision.Items.FindByText(dr.ItemArray[1].ToString()).Selected = true;
                            tb_RollNo.Text = dr.ItemArray[2].ToString();
                            tb_backlogs.Text = dr.ItemArray[3].ToString();
                            tb_sem1Marks.Text = dr.ItemArray[4].ToString();
                            tb_sem1TotalMarks.Text = dr.ItemArray[5].ToString();
                            tb_sem2Marks.Text = dr.ItemArray[6].ToString();
                            tb_sem2TotalMarks.Text = dr.ItemArray[7].ToString();
                            tb_sem3Marks.Text = dr.ItemArray[8].ToString();
                            tb_sem3TotalMarks.Text = dr.ItemArray[9].ToString();
                            tb_sem4Marks.Text = dr.ItemArray[10].ToString();
                            tb_sem4TotalMarks.Text = dr.ItemArray[11].ToString();
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
                Response.Redirect("student_HSCDetails.aspx");
                //lbl_student_TyDetailsStatus.Text = "redirected";//testing
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
                div_save_btns.Style["display"] = "none";
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
            lbl_student_TyDetailsStatus.Text = null;
        }

        protected void btn_next_Click(object sender, EventArgs e)
        {
            Response.Redirect("student_HSCDetails.aspx");
            //lbl_student_TyDetailsStatus.Text = "redirected";//testing
        }

        private void bindDDL()
        {
            DataSet ds = DataAccessLayer.fetchClassDivision();
            listClass.DataSource = ds.Tables[0];
            listClass.DataTextField = "branch_name";
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
            string svvID, stream, division, rollno, backlogs, sem1_marks, sem2_marks, sem3_marks, sem4_marks, sem1_total, sem2_total, sem3_total, sem4_total,sem1per,sem2per,sem3per,sem4per,avg, error;
            svvID = Session["student_username"].ToString();
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
            sem1per = lbl_sem1.Text;
            sem2per = lbl_sem2.Text;
            sem3per = lbl_sem3.Text;
            sem4per = lbl_sem4.Text;
            avg = lbl_average.Text;
            if (DataAccessLayer.isStdTYAcademicDetailsUpdated(svvID, stream, division, rollno, backlogs, sem1_marks, sem1_total, sem2_marks, sem2_total, sem3_marks, sem3_total, sem4_marks, sem4_total,sem1per,sem2per,sem3per,sem4per,avg,out error))
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
                this_error = "Some Error Occured or May Be you had not Submited the Privious Forms and Directly Submiting This Form /n Please Fill the Forms in Line Wise as Developed";
            }

        }

        //protected void calculateSem1Marks_Click(object sender, EventArgs e)
        //{
        //    int sem1m = int.Parse(tb_sem1Marks.Text);
        //    int sem1t = int.Parse(tb_sem1TotalMarks.Text);
        //    lbl_cal_sem1.Text = "clicked";
        //}

        //protected void calculateSem2Marks_Click(object sender, EventArgs e)
        //{
        //    int sem1m = int.Parse(tb_sem1Marks.Text);
        //    int sem1t = int.Parse(tb_sem1TotalMarks.Text);
        //    int cgpr;
        //    lbl_cal_sem1.Text = "clicked";
        //}

        //protected void calculateSem3Marks_Click(object sender, EventArgs e)
        //{
        //    int sem1m = int.Parse(tb_sem1Marks.Text);
        //    int sem1t = int.Parse(tb_sem1TotalMarks.Text);
        //    lbl_cal_sem1.Text = "clicked";
        //}

        //protected void calculateSem4Marks_Click(object sender, EventArgs e)
        //{
        //    int sem1m = int.Parse(tb_sem1Marks.Text);
        //    int sem1t = int.Parse(tb_sem1TotalMarks.Text);
        //    lbl_cal_sem1.Text = "clicked";
        //}

        protected void calculateMarks_Click(object sender, EventArgs e)
        {
            double sem1, sem1_total, sem2, sem2_total, sem3, sem3_total, sem4, sem4_total;
            double sum1,sum2,sum3,sum4,avg;
            sem1 = Convert.ToDouble(tb_sem1Marks.Text);
            sem1_total = Convert.ToDouble(tb_sem1TotalMarks.Text);
            sem2 = Convert.ToDouble(tb_sem2Marks.Text);
            sem2_total = Convert.ToDouble(tb_sem2TotalMarks.Text);
            sem3 = Convert.ToDouble(tb_sem3Marks.Text);
            sem3_total = Convert.ToDouble(tb_sem3TotalMarks.Text);
            sem4 = Convert.ToDouble(tb_sem4Marks.Text);
            sem4_total = Convert.ToDouble(tb_sem4TotalMarks.Text);
            sum1 = (sem1/sem1_total)*100;
            sum2 = sem2 / sem2_total * 100;
            sum3 = sem3 / sem3_total * 100;
            sum4 = sem4 / sem4_total * 100;
            avg = (sum1 + sum2 + sum3 + sum4) / 4;
            lbl_sem1.Text = sum1.ToString("0.00") + " %";
            lbl_sem2.Text = sum2.ToString("0.00") + " %";
            lbl_sem3.Text = sum3.ToString("0.00") + " %";
            lbl_sem4.Text = sum4.ToString("0.00") + " %";
            lbl_average.Text = avg.ToString("0.00") + " %";
            div_save_btns.Style["display"] = "block";
            //div_save.Style["display"] = "none"; //dont off the calculate button in case student want to calculate again
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("student_PersonalDetails.aspx");
        }
    }
}