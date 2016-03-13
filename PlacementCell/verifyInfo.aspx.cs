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
            if (!IsPostBack)
            {
                if (Request.QueryString["svvmailid"] != null)
                {
                    string attempt = HashGenerator.URLDecrypt(Request.QueryString["attempt"]);
                    string email = HashGenerator.URLDecrypt(Request.QueryString["svvmailid"]);
                    if (attempt == "1")
                    {
                        great.Text = "Thank you <u>" + email + "</u>";
                        //but.Text = null;
                        resend.Text = "If You didn't received the Mail On Your Registered Mail Id Please Wait For 5 mins.<br>If you Still didn't Received Email Check Your Svv Mail ID First, then Click <a href='studentLogin.aspx'>Here</a> and Login into Your Account";
                        hideResendMailBtn.Style["display"] = "none";
                    }
                    else if (attempt == "2")
                    {
                        great.Text = "Welcome <u>" + email + "</u> ";
                        but.Text = ", But You have Not Verified Your Svv Mail ID. ";
                        resend.Text = "If You didn't received the Mail Click on Resend Mail button and Wait For 5 mins.<br> If You Still didn't Received it Check Your SVV Mail ID or Contact to the TPO of your Stream";
                        hideResendMailBtn.Style["display"] = "block";
                    }
                    else {
                        Response.Write("Invalid Attempt");
                    }
                }
                else {
                    Response.Redirect("home.aspx");
                }
            }
        }

        protected void btnResendMail_Click(object sender, EventArgs e)
        {
            string dec_svvmail_id = HashGenerator.URLDecrypt(Request.QueryString["svvmailid"]);
            string error,verified;
            if (DataAccessLayer.isStdEmailVerificationPending(dec_svvmail_id,out verified, out error))
            {
                if (error == null && verified != null)
                {
                    if (verified != "1")
                    {
                        string msgType = "verification";//dont change this. it is for slecting the type of email msg body.
                        SendMailManager resendMail = new SendMailManager();
                        if (resendMail.sendMail(dec_svvmail_id, msgType, out error))
                        {
                            if (error == null)
                            {
                                Label1.Text = "Verification Email has been Send to your Registered Email ID :" + dec_svvmail_id+"<br/>Please Check Your Svv Mail Inbox and Click On <u>Activate Your Account</u> Link";
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

        protected void btn_changeSvvMailID_Click(object sender, EventArgs e)
        {
            string dec_currentSvvMailId = HashGenerator.URLDecrypt(Request.QueryString["svvmailid"]);
            string sp_name = "sp_isStdEmailIdExist";
            string error,id;
            if (DataAccessLayer.isEmailIDExist_getItsID(dec_currentSvvMailId, sp_name, out error, out id))
            {
                if (error == null & id != null)
                {
                    string enc_currentSvvMailId = HashGenerator.URLEncrypt(dec_currentSvvMailId);
                    string enc_IdOfTheUser = HashGenerator.URLEncrypt(id);// this is because if on changeEmail page if some one write any email id in query string he must also provide the id(which is primarry key in the database). so he dont know the id of that person in the database and he cant change the email id and pass.  
                    Response.Redirect("ChangeSvvEmailId.aspx?svvmailid=" + enc_currentSvvMailId + "&token=" + enc_IdOfTheUser);// token is nothing but the id stored in the database it is just to obscure the atacker
                }
                else {
                    Response.Write(error);
                }
            }
            else
            {
                Response.Redirect("home.aspx");//if someone mannuly enter the worng svv mail id in the url 
            }
        }
    }
}