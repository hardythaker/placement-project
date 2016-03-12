using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class ChangeSvvEmailId : System.Web.UI.Page
    {
        private bool ValidEmailId { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["SvvMailId"] == null)
                {
                    Response.Redirect("home.aspx");
                    //lbl_changeSvvEmailId_Status.Text = HashGenerator.URLDecrypt(Request.QueryString["SvvMailId"]);
                }
            }
        }

        protected void btn_ChangeSvvMailId_Click(object sender, EventArgs e)
        {
            string error;
            string id;// no use of this ID here;it is for forgot pass token link;
            string sp_name = "sp_isStdEmailIdExist";
            if (DataAccessLayer.isEmailIDExist_getItsID(tb_newSvvMailId.Text.Trim(), sp_name, out error, out id))
            {
                string current_SvvMailId = HashGenerator.URLDecrypt(Request.QueryString["svvMailId"]);
                if (!DataAccessLayer.isStudentEmailIdChangedSuccessfully(current_SvvMailId, tb_newSvvMailId.Text, out error))
                {
                    if (error == null)
                    {
                        SendMailManager mail = new SendMailManager();
                        string messageType = "verification";
                        if (mail.sendMail(tb_newSvvMailId.Text, messageType, out error))
                        {
                            if (error == null)
                            {
                                string str_enc_email = HashGenerator.URLEncrypt(tb_newSvvMailId.Text);
                                string str_enc_attempt = HashGenerator.URLEncrypt("1");
                                Response.Redirect("verifyInfo.aspx?svvmailid=" + str_enc_email + "&attempt=" + str_enc_attempt);

                            }
                            else {
                                lbl_changeSvvEmailId_Status.Text = error;
                            }
                        }
                        else
                        {
                            lbl_changeSvvEmailId_Status.Text = "Cannot Send the Verification Mail";
                        }
                    }
                }
                else
                {
                    lbl_changeSvvEmailId_Status.Text = "Some Error Occured";
                }
            }
            else {
                if (error == null)
                {
                    lbl_isValid_isInvalid.CssClass = "mdl-color-text--accent";
                    string html = "<br/><div style='display:inline-flex; vertical-align:central;'><div class='icon material-icons mdl-color-text--accent'>error</div><label style='padding-top:2px' for='tt2'class='mdl-radio__label'>&nbsp;&nbsp;User already exits</label></div>";
                    lbl_isValid_isInvalid.Controls.Add(new LiteralControl(html));
                }
                else {
                    lbl_changeSvvEmailId_Status.Text = error;
                }
            }
        }


        //protected void tb_newSvvMailId_TextChanged(object sender, EventArgs e)
        //{
        //    RegularExpressionValidator1.Validate();
        //    if (RegularExpressionValidator1.IsValid && tb_newSvvMailId.Text != null)
        //    {
        //        string error;
        //        string id;// no use of this ID here;it is for forgot pass token link;
        //        string sp_name = "sp_isStdEmailIdExist";
        //        if (DataAccessLayer.isEmailIDExist_getItsID(tb_newSvvMailId.Text.Trim(), sp_name, out error, out id))
        //        {
        //            if (error == null)
        //            {
        //                ValidEmailId = false;
        //                lbl_isValid_isInvalid.CssClass = "mdl-color-text--accent";
        //                //Label2.Text = "<center><div style='display:flex; border:solid; vertical-align:central;text-align:center;'><i class='material-icons'>error</i><div style='padding-bottom:4px'>Username Already Exists</div></div></center>";
        //                string html = "<br/><div style='display:inline-flex; vertical-align:central;'><div class='icon material-icons mdl-color-text--accent'>error</div><label style='padding-top:2px' for='tt2'class='mdl-radio__label'>&nbsp;&nbsp;User already exits</label></div>";
        //                lbl_isValid_isInvalid.Controls.Add(new LiteralControl(html));
        //            }
        //            else {
        //                lbl_changeSvvEmailId_Status.Text = error;
        //            }
        //        }
        //        else {
        //            ValidEmailId = true;
        //            //Label2.CssClass = "mdl-color-text--primary";
        //            lbl_isValid_isInvalid.Text = "<br/><div style='display:inline-flex; vertical-align:central;'><div class='icon material-icons mdl-color-text--primary'>done</div><label style='padding-top:2px' for='tt2'class='mdl-radio__label mdl-color-text--primary'>&nbsp;Valid Email ID/Student not Exists</label></div>";
        //            //LabeText = "valid";
        //        }
        //    }
        //}
    }
}