using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class verifyEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                string token = Request.QueryString["token"];
                string id = Request.QueryString["id"];
                if (token != null && token.Length == 128)
                {
                    string error;
                    if (DataAccessLayer.isTokenValid(token,id, out error))
                    {
                        if (error == null)
                        {
                            //string id = Request.QueryString["id"];
                            if (DataAccessLayer.isStudentSuccessfullyVerified(id,out error))
                            {
                            }

                        }
                        else {
                            lbl_InvalidToken_attack.Text = error;
                            ResetDiv.Style["display"] = "none";
                        }
                        
                    }
                    else {
                        lbl_InvalidToken_attack.Text = "<h3>Invalid Token or Token Expired or Token Already Used <br/> Request for the same again if You not used that token<h3>";
                        ResetDiv.Style["display"] = "none";
                    }
                }
                else {
                    Response.Redirect("home.aspx");
                }
            }
        }
    }
}