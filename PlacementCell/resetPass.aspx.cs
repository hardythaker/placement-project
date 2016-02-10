using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class resetPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string token = Request.QueryString["token"];
                //if (token != null && token.Length == 128)
                //{
                    string error;
                    if (DataAccessLayer.isPassResetTokenValid(token, out error) == false)
                    {
                        lbl_InvalidToken_attack.Text = "Invalid Token or Token Expired";
                        ResetDiv.Style["display"] = "none";
                    }
                    else {
                        if (error != null)
                        {
                            lbl_resetPassStatus.Text = error;
                        }
                    }
                //}
                //else {
               //     Response.Redirect("home.aspx");
               // }
            }
        }

        protected void btn_resetPass_Click1(object sender, EventArgs e)
        {
            string token = Request.QueryString["token"];
            //lbl_resetPassStatus.Text = token;
            string hashVal = HashGenerator.getHash(tb_Reset_Email.Text.Trim(), tb_Reset_newPass.Text.Trim());
            string error;
            if (DataAccessLayer.isPassResetSuccessfully(tb_Reset_Email.Text, hashVal, token, out error))
            {
                if (error == null)
                {
                    lbl_resetPassStatus.CssClass = "mdl-color-text--primary";
                    lbl_resetPassStatus.Text = "<br/>Successfully Updated New Password Click <a href='studentLogin.aspx'>Here</a> to Login";
                    tb_Reset_Email.Text = string.Empty;
                    //Request.QueryString["token"] = null;
                    //ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Your Password Succesfully Reset...!\\n Click Ok to Login');window.location.replace('studentLogin.aspx');</script>");
                }
                else {
                    lbl_resetPassStatus.Text = error;
                }
            }
            else {
                lbl_resetPassStatus.Text = "Your Svv mail ID is Wrong or Token Already Used";
            }
        }
    }
}