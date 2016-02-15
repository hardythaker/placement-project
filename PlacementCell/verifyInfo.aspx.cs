using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class verifyInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // if (!IsPostBack) { }
        }

        protected void btnResendMail_Click(object sender, EventArgs e)
        {
            string dec_svvmail_id = "rithu.dhanki@somaiya.edu";//HashGenerator.URLDecrypt(Request.QueryString["svvmailid"]);
            string error,verified;
            if (DataAccessLayer.isStdEmailVerificationPending(dec_svvmail_id,out verified, out error))
            {
                if (error == null)
                {
                    if (verified != "1")
                    {
                        if (SendMailManager.newStdVerify(dec_svvmail_id, out error))
                        {
                            if (error == null)
                            {
                                Label1.Text = "Verification Email has been Send to your Registered Email ID :" + dec_svvmail_id;
                            }
                            else {
                                Label1.Text ="here 2" + error;
                            }
                        }
                        else {
                            Label1.Text = "Email Not Sent";
                        }
                    }
                    else {
                        Label1.Text = "This Email Id is Already Registered...";
                    }
                }
                else {
                    Label1.Text = "here" +error;
                }
            }
            else {
                Label1.Text = "Your Email ID is Already Verified...";
            }

        }
    }
}