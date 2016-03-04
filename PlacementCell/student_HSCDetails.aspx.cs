using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class student_HSCDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["student_username"] != null)
                {
                    bindDropdown();
                    string error,sp_name;
                    DataTable dt = new DataTable();
                    sp_name = "sp_fetchStdHscData";
                    dt = DataAccessLayer.fetchStdDetailIfExist(sp_name, Session["student_username"].ToString(), out error);
                    if (error == null)
                    {
                        if (dt.Rows.Count == 1)
                        {
                            DataRow dr = dt.Rows[0];
                            div_edit.Style["display"] = "block";
                            div_calculate.Style["display"] = "none";
                            boardList.Items.FindByText(dr.ItemArray[0].ToString()).Selected = true;
                            specializationList.Items.FindByValue(dr.ItemArray[1].ToString()).Selected = true;
                            courseTypeList.Items.FindByValue(dr.ItemArray[2].ToString()).Selected = true;
                            tb_HscMarks.Text = dr.ItemArray[3].ToString();
                            tb_HscTotalMarks.Text = dr.ItemArray[4].ToString();
                            hideControls(true);
                        }
                    }
                    else
                    {
                        lbl_fetchingDataError.Text = error;
                    }
                }
                else
                {
                    Response.Redirect("studentLogin.aspx");
                }
            }
        }

        private void bindDropdown()
        {
            DataSet ds = new DataSet();
            string sp_name = "sp_fetchHscBoards";
            ds = DataAccessLayer.fetchBoard(sp_name);
            boardList.DataSource = ds.Tables[0];
            boardList.DataTextField = "board_name";
            boardList.DataValueField = "board_id";
            boardList.DataBind();
            boardList.Items.Insert(0, new ListItem("--Select Board--", "0"));
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("student_TyAcademicDetails.aspx");
        }

        protected void btn_Edit_Click(object sender, EventArgs e)
        {
            hideControls(false);
            div_calculate.Style["display"] = "block";
            div_edit.Style["display"] = "none";
            lbl_saving_status.Text = null;
        }

        protected void btn_next_Click(object sender, EventArgs e)
        {
            Response.Redirect("student_SSCDetails.aspx");
            //lbl_fetchingDataError.Text = "Redirected";
        }

        protected void btn_saveAndContinue_Click(object sender, EventArgs e)
        {
            string error;
            uploadData(out error);
            if (error == null)
            {
                //lbl_fetchingDataError.Text = "Redirected";
                Response.Redirect("student_SSCDetails.aspx");
            }
            else
            {
                lbl_saving_status.Text = error;
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            string error;
            uploadData(out error);
            if (error == null)
            {
                div_calculate.Style["display"] = "none";
                div_save_btns.Style["display"] = "none";
                div_edit.Style["display"] = "block";
                lbl_saving_status.CssClass = "mdl-color-text--primary";
                lbl_saving_status.Text = "<br>Data Successfully Saved";
            }
            else
            {
                lbl_saving_status.Text = error;
            }
            hideControls(true);
        }

        protected void calculateMarks_Click(object sender, EventArgs e)
        {
            double hscM, hscT, hscPer;
            hscM = Convert.ToDouble(tb_HscMarks.Text);
            hscT = Convert.ToDouble(tb_HscTotalMarks.Text);
            hscPer = (hscM / hscT)*100;
            lbl_hscPer.Text = hscPer.ToString("0.00") + " %";
            div_save_btns.Style["display"] = "block";
            //div_calculate.Style["display"] = "none";// dont off the calculate button in case student want to calculate again
        }

        private void uploadData(out string this_error)
        {
            string board, courseType, specialization, marksHsc, marksHscTotal,hscPer,error;
            board = boardList.SelectedValue.ToString();
            courseType = courseTypeList.SelectedValue.ToString();
            specialization = specializationList.SelectedValue.ToString();
            marksHsc = tb_HscMarks.Text;
            marksHscTotal = tb_HscTotalMarks.Text;
            hscPer = lbl_hscPer.Text;
            if (DataAccessLayer.isStdHscAcademicDetailsUpdated(Session["student_username"].ToString(), board, specialization, courseType, marksHsc, marksHscTotal, hscPer, out error))
            {
                if (error == null)
                {
                  this_error = null;
                }
                else {
                  this_error = error;
                }
            }
            else {
                this_error = "Some Error Occured or May Be you had not Submited the Privious Forms and Directly Submiting This Form /n Please Fill the Forms in Line Wise as Developed";
            }
        }
        private void hideControls(bool option)
        {
            boardList.Enabled = !option;
            specializationList.Enabled = !option;
            courseTypeList.Enabled = !option;
            tb_HscMarks.ReadOnly = option;
            tb_HscTotalMarks.ReadOnly = option;
        }

    }
}