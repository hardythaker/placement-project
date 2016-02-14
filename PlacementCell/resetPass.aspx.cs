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
                string id = Request.QueryString["id"];
                if (token != null && token.Length == 128)
                {
                    string error;
                    if (DataAccessLayer.isTokenValid(token, id, out error) == false)
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
                }
                else {
                    Response.Redirect("home.aspx");
                }
            }
        }

        protected void btn_resetPass_Click1(object sender, EventArgs e)
        {
            string token = Request.QueryString["token"];
            string id = Request.QueryString["id"];
            string error;
            if (DataAccessLayer.isTokenValid(token, id, out error))
            {
                if (error == null)
                {
                    string svvmail = DataAccessLayer.getSvvmailOfstdID(id, out error);
                    if (error == null && svvmail != null)
                    {
                        string hashVal = HashGenerator.getHash(svvmail, tb_Reset_newPass.Text.Trim());
                        if (DataAccessLayer.isPassResetSuccessfully(id, hashVal, out error))
                        {
                            if (error != null)
                            {
                                lbl_resetPassStatus.Text = error;
                                //tb_Reset_Email.Text = string.Empty;
                            }
                        }
                        else {
                            lbl_resetPassStatus.Text = "Token Already Used";
                        }
                    }
                    else {
                        lbl_resetPassStatus.Text = error + "id";
                    }
                }
                else
                {
                    lbl_resetPassStatus.Text = error;
                }
            }
            else {
                lbl_resetPassStatus.Text = "Invalid Token";
            }
        }
    }
}