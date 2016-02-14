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
        public static bool newStdVerify(string emailid,out string mailerror) {
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
                                string url = "http://hardikt-001-site1.ctempurl.com/verifyEmail.aspx?token=" + token + "&id=" + id;
                                MailMessage msg = new MailMessage();
                                msg.From = new MailAddress("skstpc.edu@gmail.com");

                                msg.To.Add(emailid);
                                msg.Subject = "Verify Email Account";
                                msg.Body = "Hi..<br/><h2><b>Wellcome to Traning and Placement Cell of <u>SK Somaiya Degree College of Arts, Science and Commerce.<u></b></h2><br/><h3><u><b>Please Click the Below Link to Activate Your account</b></u></h3><br/> url: " + url + "<br/><h4>(Please copy and paste the above URL to your browser if the link doesn't work.)</h4><br/><br/><h5><u>If you have questions or concerns, please contact us at</u></h5><br/><a>http://xyz@xyz.com</a><br/><br/><h3><b><u>-Traning & Placement Team.</u></b></h3><br/><br/><hr><br/><h3><b>Please Do Not Replay To This Mail</b></h3></br><hr>";
                                msg.IsBodyHtml = true;

                                NetworkCredential mailAuthenticaion = new NetworkCredential("skstpc.edu@gmail.com", "skstpc123@gmail.com");
                                SmtpClient mailsmtp = new SmtpClient("smtp.gmail.com", 587);
                                mailsmtp.EnableSsl = true;
                                mailsmtp.UseDefaultCredentials = false;
                                mailsmtp.Credentials = mailAuthenticaion;
                                mailsmtp.Send(msg);
                                mailerror = null;
                                return true;
                            }
                            catch (Exception ex)
                            {
                                mailerror = ex.Message;
                                return true;
                            }
                        }
                        else {
                            mailerror = error;
                            return true;
                        }
                    }
                    else {
                        mailerror = "Unique code Not updated";
                        return true;
                    }
                }
                else {
                    mailerror = error;
                    return true; 
                }
            }
            else {
                mailerror = "Email ID Doesnot Exists";
                return true;
            }
        }
        public static bool forgotPass() {
            return false;
        }
    }
}