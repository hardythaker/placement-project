using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace PlacementCell
{
    internal class SendMailManager
    {
        public static bool sendMail(string emailid,string msgType,out string mailerror) {
            string error;
            string id;
            string sp_name = "sp_isStdEmailIdExist";
            if (DataAccessLayer.isEmailIDExist_getItsID(emailid, sp_name, out error, out id))
            {
                if (error == null && id != null)
                {
                    string token = HashGenerator.getUniqueID();
                    if (DataAccessLayer.isUniqueCodeUpdated(emailid, token, out error))
                    {
                        if (error == null)
                        {
                            try
                            {
                                MailMessage msg = new MailMessage();
                                msg.From = new MailAddress("skstpc.edu@gmail.com");
                                msg.To.Add(emailid);

                                string Redirection_To =null;
                                if (msgType == "verification")
                                {
                                    msg.Subject = "Verify Email Account";
                                    Redirection_To = "verifyEmail.aspx";
                                    string verifyurl = "http://hardythaker.ga/" + Redirection_To + "?token=" + token + "&id=" + id;
                                    msg.Body = "Hi..<br/><h2><b>Wellcome to Traning and Placement Cell of <u>SK Somaiya Degree College of Arts, Science and Commerce.<u></b></h2><br/><h3><u><b>Please Click the Below Link to Activate Your account</b></u></h3><br/> url: " + verifyurl + "<br/><h4>(Please copy and paste the above URL to your browser if the link doesn't work.)</h4><br/><br/><h5><u>If you have questions or concerns, please contact us at</u></h5><br/><a>http://xyz@xyz.com</a><br/><br/><h3><b><u>-Traning & Placement Team.</u></b></h3><br/><br/><hr><br/><h3><b>Please Do Not Replay To This Mail</b></h3></br><hr>";
                                }
                                else if(msgType== "forgotPass")
                                {
                                    msg.Subject = "Password Recovery Request";
                                    Redirection_To = "resetPass.aspx";
                                    string passReseturl = "http://hardythaker.ga/" + Redirection_To + "?token=" + token + "&id=" + id;
                                    msg.Body = "Someone has requested that the password be reset for your account " + emailid + " on <a href='hardikt-001-site1.ctempurl.com'>skstpc.edu</a>.<br/><br/>If you made this request, click this below link to change your password.<br/><br/>url: " + passReseturl + "<br/><br/>If you did not make this request, click here to cancel the request.";
                                }
                                msg.IsBodyHtml = true;
                                NetworkCredential mailAuthenticaion = new NetworkCredential("skstpc.edu@gmail.com", "skstpc123@gmail.com");
                                SmtpClient mailsmtp = new SmtpClient("smtp.gmail.com", 587);
                                mailsmtp.EnableSsl = true;
                                mailsmtp.UseDefaultCredentials = false;
                                mailsmtp.Credentials = mailAuthenticaion;
                                mailsmtp.Send(msg);
                                mailsmtp.Dispose();
                                msg.Dispose();
                                mailerror = null;
                                return true;
                            }
                            catch (Exception ex)
                            {
                                mailerror = ex.Message; //mail exception
                                return true;
                            }
                        }
                        else {
                            mailerror = error;// unique code not updated exception
                            return true;
                        }
                    }
                    else {
                        mailerror = "Unique code Not updated";
                        return true;
                    }
                }
                else {
                    mailerror = error;// email id exists gets its id Exception
                    return true; 
                }
            }
            else {
                mailerror = "Email ID Does not Exists";
                return true;
            }
        }
        public static bool forgotPass() {
            return false;
        }
    }
}