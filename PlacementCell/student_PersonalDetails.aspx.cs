using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class student_PersonalDetails : System.Web.UI.Page
    {
        public string genRB
        {
            get; set;
        }
        public string mStatusRB
        {
            get; set;
        }
        public bool genRBReadOnly
        {
            get; set;
        }
        public bool mStatusRBReadOnly
        {
            get; set;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["student_username"] == null)
                {
                    Response.Redirect("studentLogin.aspx");
                }
                else {
                    string error;
                    DataTable dt = new DataTable();
                    string sp_name = "sp_fetchStdData";
                    dt = DataAccessLayer.fetchStdDetailIfExist(sp_name,Session["student_username"].ToString(), out error);
                    if (error == null)
                    {
                        if (dt.Rows.Count == 1)
                        {
                            string honorifics, fn, mn, ln, eID, mNo, dob;
                            div_edit.Style["display"] = "block";
                            div_save.Style["display"] = "none";
                            honorifics = dt.Rows[0].ItemArray[0].ToString();
                            fn = dt.Rows[0].ItemArray[1].ToString();
                            mn = dt.Rows[0].ItemArray[2].ToString();
                            ln = dt.Rows[0].ItemArray[3].ToString();
                            eID = dt.Rows[0].ItemArray[4].ToString();
                            genRB = dt.Rows[0].ItemArray[5].ToString();
                            ViewState["genRB"] = genRB;
                            mStatusRB = dt.Rows[0].ItemArray[6].ToString();
                            ViewState["mStatusRB"] = mStatusRB;
                            mNo = dt.Rows[0].ItemArray[7].ToString();
                            dob = dt.Rows[0].ItemArray[8].ToString();
                            ddHonorificsList.Items.FindByValue(honorifics).Selected = true;
                            tb_firstName.Text = fn;
                            tb_middleName.Text = mn;
                            tb_lastName.Text = ln;
                            tb_emailID.Text = eID;
                            tb_mobileNumber.Text = mNo;
                            tb_dob.Text = dob;
                            ddHonorificsList.Enabled = false;
                            tb_firstName.ReadOnly = true;
                            tb_middleName.ReadOnly = true;
                            tb_lastName.ReadOnly = true;
                            tb_emailID.ReadOnly = true;
                            genRBReadOnly = true;
                            mStatusRBReadOnly = true;
                            tb_mobileNumber.ReadOnly = true;
                            tb_dob.Enabled = false;
                        }
                        else {
                            genRB = "Male";
                            mStatusRB = "unmarried";
                            genRBReadOnly = false;
                            mStatusRBReadOnly = false;
                        }
                    }
                    else {
                        lbl_student_PesrsonalDetailsStatus.ForeColor = System.Drawing.Color.Red;
                        lbl_student_PesrsonalDetailsStatus.Text = "<br>"+error;
                    }
                }
            }
        }

        protected void btn_saveAndContinue_Click(object sender, EventArgs e)
        {
            string error;
            uploadDetails(out error);
            if (error == null)
            {
                ViewState.Remove("genRB");
                ViewState.Remove("mStatusRB");
                Response.Redirect("student_TyAcademicDetails.aspx");
            }
            else
            {
                lbl_student_PesrsonalDetailsStatus.ForeColor = System.Drawing.Color.Red;
                lbl_student_PesrsonalDetailsStatus.Text = error;
            }
        }

        protected void btn_Edit_Click(object sender, EventArgs e)
        {
            div_edit.Style["display"] = "none";
            div_save.Style["display"] = "block";
            ddHonorificsList.Enabled = true;
            tb_firstName.ReadOnly = false;
            tb_middleName.ReadOnly = false;
            tb_lastName.ReadOnly = false;
            tb_emailID.ReadOnly = false;
            genRBReadOnly = false;
            mStatusRBReadOnly = false;
            tb_mobileNumber.ReadOnly = false;
            tb_dob.Enabled = true;
            genRB = ViewState["genRB"].ToString();
            mStatusRB = ViewState["mStatusRB"].ToString();
            ViewState.Remove("genRB");
            ViewState.Remove("mStatusRB");
        }

        protected void uploadDetails(out string this_error)
        {
            string svvmailID, honorifics, fn, mn, ln, eID, gen, mStatus, mNo, dob, error;
            svvmailID = Session["student_username"].ToString();
            honorifics = ddHonorificsList.SelectedValue.ToString();
            fn = tb_firstName.Text.Trim();
            mn = tb_middleName.Text.Trim();
            ln = tb_lastName.Text.Trim();
            eID = tb_emailID.Text.Trim();
            gen = Request.Form["gender_options"].ToString();
            ViewState["genRB"] = gen;
            mStatus = Request.Form["maritial_status_options"].ToString();
            ViewState["mStatusRB"] = mStatus;
            mNo = tb_mobileNumber.Text.Trim();
            dob = tb_dob.Text.Trim();
            this_error = null;
            lbl_student_PesrsonalDetailsStatus.Text =honorifics +"<br>"+ fn + "<br>" + mn + "<br>" + ln + "<br>" + eID + "<br>" + gen + "<br>" + mStatus + "<br>" + mNo + "<br>" + dob;
            if (DataAccessLayer.isStdPersonalDetailsUpdated(svvmailID, honorifics, fn, mn, ln, eID, gen, mStatus, mNo, dob, out error))
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
        protected void btn_save_Click(object sender, EventArgs e)
        {
            string error;
            uploadDetails(out error);
            if (error == null)
            {
                lbl_student_PesrsonalDetailsStatus.CssClass = "mdl-color-text--primary";
                lbl_student_PesrsonalDetailsStatus.Text = "<br>Data Successfully Saved";
                genRB = ViewState["genRB"].ToString();
                mStatusRB = ViewState["mStatusRB"].ToString();
                ddHonorificsList.Enabled = false;
                tb_firstName.ReadOnly = true;
                tb_middleName.ReadOnly = true;
                tb_lastName.ReadOnly = true;
                tb_emailID.ReadOnly = true;
                genRBReadOnly = true;
                mStatusRBReadOnly = true;
                tb_mobileNumber.ReadOnly = true;
                tb_dob.Enabled = false;
                div_edit.Style["display"] = "block";
                div_save.Style["display"] = "none";
                
            }
            else
            {
                lbl_student_PesrsonalDetailsStatus.ForeColor = System.Drawing.Color.Red;
                lbl_student_PesrsonalDetailsStatus.Text = error;
            }
        }

        protected void btn_next_Click(object sender, EventArgs e)
        {
            ViewState.Remove("genRB");
            ViewState.Remove("mStatusRB");
            Response.Redirect("student_TyAcademicDetails.aspx");
        }
    }
}