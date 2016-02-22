using System;
using System.Net.Mail;
using System.Net; 
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class forgotpass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) {
                lbl_forgotPassStatus.Text = string.Empty;
            }
        }

        protected void btn_forgotPass_Click(object sender, EventArgs e)
        {
            string email = tb_forgotEmailID.Text;
            string mailError;
            string msgType = "forgotPass";//dont change this. it is for slecting the type of email msg body.
            if (SendMailManager.sendMail(email, msgType, out mailError))
            {
                if (mailError == null)
                {
                    btn_forgotPass.Visible = false;
                    lbl_forgotPassStatus.CssClass = "mdl-color-text--primary";
                    lbl_forgotPassStatus.Text = "Password Reset Link Was send To your SVV mail ID...";
                    tb_forgotEmailID.Text = string.Empty;
                }
                else
                {
                    btn_forgotPass.Visible = true;
                    lbl_forgotPassStatus.Text = mailError;
                }
            }
            else {
                btn_forgotPass.Visible = true;
                lbl_forgotPassStatus.Text = "Cannot Send The email";
            }


            //forgotPassEmail_tb_regex_validator.Dispose();
            //RequiredFieldValidator1.Dispose();
            //btn_forgotPass.Visible = false;
            //string error_isEmailIDExist;
            //string student_id;
            //string sp_name = "sp_isStdEmailIDExist";// for wich store procedure has to be called, cause only one method is there for finding universal svv mail id
            //if (DataAccessLayer.isEmailIDExist_getItsID(tb_forgotEmailID.Text,sp_name, out error_isEmailIDExist, out student_id))
            //{
            //    //lbl_forgotPassStatus.Text = tb_forgotEmailID.Text;
            //    if (error_isEmailIDExist == null && student_id !=null)
            //    {
            //        string uid = HashGenerator.getUniqueID();
            //        string error_isUniqueCodeUpdated;
            //        //lbl_forgotPassStatus.Text = "<br/>" + uid.Length.ToString();
            //        if (DataAccessLayer.isUniqueCodeUpdated(tb_forgotEmailID.Text, uid, out error_isUniqueCodeUpdated))
            //        {
            //            if (error_isUniqueCodeUpdated == null)
            //            {
            //                try
            //                {
            //                    string url = "http://hardikt-001-site1.ctempurl.com/resetPass.aspx?token=" + uid+"&id="+student_id;
            //                    //lbl_forgotPassStatus.Text = url;
            //                    MailMessage msg = new MailMessage();
            //                    msg.From = new MailAddress("skstpc.edu@gmail.com");

            //                    msg.To.Add(tb_forgotEmailID.Text.Trim());
            //                    msg.Subject = "Password Recovery Request";
            //                    msg.Body = "Someone has requested that the password be reset for your account " + tb_forgotEmailID.Text + " on <a href='hardikt-001-site1.ctempurl.com'>skstpc.edu</a>.<br/><br/>If you made this request, click this below link to change your password.<br/><br/>url: " + url + "<br/><br/>If you did not make this request, click here to cancel the request.";
            //                    msg.IsBodyHtml = true;

            //                    NetworkCredential mailAuthenticaion = new NetworkCredential("skstpc.edu@gmail.com", "skstpc123@gmail.com");
            //                    SmtpClient mailsmtp = new SmtpClient("smtp.gmail.com", 587);
            //                    mailsmtp.EnableSsl = true;
            //                    mailsmtp.UseDefaultCredentials = false;
            //                    mailsmtp.Credentials = mailAuthenticaion;
            //                    mailsmtp.Send(msg);
            //                    btn_forgotPass.Visible = false;
            //                    lbl_forgotPassStatus.CssClass = "mdl-color-text--primary";
            //                    lbl_forgotPassStatus.Text = "Password Reset Link Was send To your SVV mail ID...";
            //                    tb_forgotEmailID.Text = string.Empty;
            //                }
            //                catch (Exception ex)
            //                {
            //                    btn_forgotPass.Visible = true;
            //                    lbl_forgotPassStatus.Text = ex.Message;
            //                }
            //            }
            //            else {
            //                btn_forgotPass.Visible = true;
            //                lbl_forgotPassStatus.Text = error_isUniqueCodeUpdated;
            //            }
            //        }
            //        else {
            //            lbl_forgotPassStatus.Text = "Could not create or Update UID/Token";
            //        }
            //    }
            //    else
            //    {
            //        btn_forgotPass.Visible = true;
            //        lbl_forgotPassStatus.Text = error_isEmailIDExist + "student id";
            //    }
            //}
            //else
            //{
            //    btn_forgotPass.Visible = true;
            //    lbl_forgotPassStatus.Text = "No Such User Found";
            ////    string uid = HashGenerator.getUniqueID();
            ////    lbl_forgotPassStatus.Text = uid;
            //}
            //lbl_forgotPassStatus.Text = tb_forgotEmailID.Text;
            
        }

        protected void tb_forgotEmailID_TextChanged(object sender, EventArgs e)
        {
            forgotPassEmail_tb_regex_validator.SetFocusOnError = true;
            lbl_forgotPassStatus.Text = " ";
        }
    }
}