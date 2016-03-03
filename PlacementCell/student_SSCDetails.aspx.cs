using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class student_SSCDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["student_username"] != null)
                {
                    bindDropdown();
                    string error, sp_name;
                    DataTable dt = new DataTable();
                    sp_name = "sp_fetchStdSscData";
                    dt = DataAccessLayer.fetchStdDetailIfExist(sp_name, Session["student_username"].ToString(), out error);
                    if (error == null)
                    {
                        if (dt.Rows.Count == 1)
                        {
                            DataRow dr = dt.Rows[0];
                            div_edit.Style["display"] = "block";
                            div_calculate.Style["display"] = "none";
                            boardList.Items.FindByValue(dr.ItemArray[0].ToString()).Selected = true;
                            courseTypeList.Items.FindByValue(dr.ItemArray[1].ToString()).Selected = true;
                            tb_SscMarks.Text = dr.ItemArray[2].ToString();
                            tb_SscTotalMarks.Text = dr.ItemArray[3].ToString();
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
            string sp_name = "sp_fetchSscBoards";
            ds = DataAccessLayer.fetchBoard(sp_name);
            boardList.DataSource = ds.Tables[0];
            boardList.DataTextField = "board_name";
            boardList.DataValueField = "board_id";
            boardList.DataBind();
            boardList.Items.Insert(0, new ListItem("--Select Board--", "0"));
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("student_HSCDetails.aspx");
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
            Response.Redirect("student_OtherDetails.aspx");
            //lbl_fetchingDataError.Text = "Redirected";
        }

        protected void btn_saveAndContinue_Click(object sender, EventArgs e)
        {
            string error;
            uploadData(out error);
            if (error == null)
            {
                Response.Redirect("student_OtherDetails.aspx");
                //lbl_fetchingDataError.Text = "Redirected";
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

        private void uploadData(out string this_error)
        {
            string board, courseType, marksSsc, marksSscTotal, SscPer, error;
            board = boardList.SelectedValue.ToString();
            courseType = courseTypeList.SelectedValue.ToString();
            marksSsc = tb_SscMarks.Text;
            marksSscTotal = tb_SscTotalMarks.Text;
            SscPer = lbl_SscPer.Text;
            if (DataAccessLayer.isStdSscAcademicDetailsUpdated(Session["student_username"].ToString(), board, courseType, marksSsc, marksSscTotal, SscPer, out error))
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
                this_error = "Some Error Occured";
            }
        }
        protected void calculateMarks_Click(object sender, EventArgs e)
        {
            double SscM, SscT, SscPer;
            SscM = Convert.ToDouble(tb_SscMarks.Text);
            SscT = Convert.ToDouble(tb_SscTotalMarks.Text);
            SscPer = (SscM / SscT) * 100;
            lbl_SscPer.Text = SscPer.ToString("0.00") + " %";
            div_save_btns.Style["display"] = "block";
        }
        private void hideControls(bool option)
        {
            boardList.Enabled = !option;
            courseTypeList.Enabled = !option;
            tb_SscMarks.ReadOnly = option;
            tb_SscTotalMarks.ReadOnly = option;
        }

    }
}