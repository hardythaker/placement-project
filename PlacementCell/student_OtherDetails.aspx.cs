using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class student_OtherDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["student_username"] != null)
                {
                    string error, sp_name;
                    DataTable dt = new DataTable();
                    sp_name = "sp_fetchStdOtherDetailsData";
                    dt = DataAccessLayer.fetchStdDetailIfExist(sp_name, Session["student_username"].ToString(), out error);
                    if (error == null)
                    {
                        if (dt.Rows.Count == 1)
                        {
                            DataRow dr = dt.Rows[0];
                            div_edit.Style["display"] = "block";
                            div_Save_Btns.Style["display"] = "none";
                            if (dr.ItemArray[0].ToString() == "0")
                            {
                                DropDownList_break.Items.FindByValue("0").Selected = true;
                            }
                            else
                            {
                                DropDownList_break.Items.FindByValue("1").Selected = true;
                                tb_break.Text = dr.ItemArray[0].ToString();
                                div_break_info.Style["display"] = "block";
                            }
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

        protected void btn_Edit_Click(object sender, EventArgs e)
        {
            hideControls(false);
            div_Save_Btns.Style["display"] = "block";
            div_edit.Style["display"] = "none";
            if (DropDownList_break.SelectedValue == "1")
            {
                RequiredFieldValidator13.Enabled = true;
                RegularExpressionValidator1.Enabled = true;
            }
            lbl_saving_status.Text = null;
        }

        private void hideControls(bool v)
        {
            DropDownList_break.Enabled = !v;
            tb_break.ReadOnly = v;
        }

        protected void btn_next_Click(object sender, EventArgs e)
        {
            Response.Redirect("dataUpdatedSuccessfully.aspx");

        }

        protected void DropDownList_break_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList_break.SelectedValue == "1")
            {
                div_break_info.Style["display"] = "block";
                RequiredFieldValidator13.Enabled = true;
                RegularExpressionValidator1.Enabled = true;
            }
            else
            {
                RequiredFieldValidator13.Enabled = false;
                RegularExpressionValidator1.Enabled = false;
                div_break_info.Style["display"] = "none";
            }
        }

        protected void btn_saveAndContinue_Click(object sender, EventArgs e)
        {
            string error;
            uploadData(out error);
            if (error == null)
            {
                Response.Redirect("dataUpdatedSuccessfully.aspx");
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
                div_Save_Btns.Style["display"] = "none";
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
            string breakYear, error;
            if (DropDownList_break.SelectedValue == "1")
            {
                breakYear = tb_break.Text;
            }
            else
            {
                breakYear = "0";
            }
            if (DataAccessLayer.isStdOthersDetailsUpdated(Session["student_username"].ToString(), breakYear, out error))
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
    }
}