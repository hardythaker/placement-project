﻿using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class studentReg : System.Web.UI.Page
    {
        static bool isValidEmail;// this is because if the email id already present in the database then he/she should be prevented from sending the mail
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet ds = DataAccessLayer.fetchClassDivision();
                DataTable dt = ds.Tables[0];
                listClass.DataSource = dt;
                listClass.DataTextField = "branch_name";
                listClass.DataValueField = "branch_id";
                listClass.DataBind();
                listClass.Items.Insert(0, new ListItem("--Stream--", "0"));
            }
        }

        protected void btnStudentReg_Click(object sender, EventArgs e)
        {
            if (isValidEmail == true && signup_emailid.Text != null)
            {
                //collecting data from form
                string fname = signup_fname.Text;
                string lname = signup_lname.Text;
                string stream = listClass.SelectedItem.Value;
                string gender = Request.Form["options"];
                string email = signup_emailid.Text.Trim();
                string pass = signup_password.Text;
                //End collecting data

                string hashval = HashGenerator.getHash(email, pass); //generating sha1
                string error;
                if (DataAccessLayer.isStudentRegSuccessful(fname, lname, stream, gender, email, hashval, out error))//passing to method for updating
                {
                    if (error != null)
                    {
                        Label1.Text = error;
                    }
                    else {
                        isValidEmail = false;
                        string mailerror;
                        SendMailManager regmail = new SendMailManager();
                        string msgType = "verification";//dont change this. it is for slecting the type of email msg body
                        if (regmail.sendMail(signup_emailid.Text.Trim(), msgType, out mailerror))
                        {
                            if (mailerror == null)
                            {
                                // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "customScript", "<script type='text/javascript'> $('#spinner2').hide(); alert('You Succesfully Registered...!\\n Click Ok to Login');window.location.replace('studentLogin.aspx');</script>", false);
                                //string enc_signup_emailID = HttpUtility.UrlEncode(email);
                                string str_enc_email = HashGenerator.URLEncrypt(email);
                                string str_enc_attempt = HashGenerator.URLEncrypt("1");
                                Response.Redirect("verifyInfo.aspx?svvmailid=" + str_enc_email+"&attempt="+str_enc_attempt);
                            }
                            else {
                                Label1.Text = mailerror;
                            }
                        }
                        else {   //if mail cannot be send for some reasons then that student should be deleted automatically, so that he/she can register again, otherwise if the mail sending fail then he cannot login and if he thought to do the registration again he/she cannot do that because we are checking that the email id is exists or on on registration..
                            string deleteerror;
                            if (DataAccessLayer.isStudentDeleted(signup_emailid.Text, out deleteerror))
                            {
                                if (deleteerror == null)
                                {
                                    Label1.Text = "Cannot Create The user Because Mail Not send and user Deleted";
                                }
                                else {
                                    Label1.Text = "Cannot Create User Because Mail Not send and Also Cannot Delete user it because of error :" + deleteerror;
                                }
                            }
                            else {
                                Label1.Text = "Cannot Create User Because Mail Not send and Also Cannot Delete user";
                            }
                        }
                    }
                }
                else
                {
                    Label1.Text = "Some Error Occured. Make Sure You had Filled all the Fields";
                }
            }
            //Label1.Text = fname +"<br>" +lname + "<br>" + stream + "<br>" + gender + "<br>" + email + "<br>" + pass; //for testing
            else {
                signup_fname.Text = string.Empty;
                signup_lname.Text = string.Empty;
                listClass.ClearSelection();
                Request.Form["options"] = string.Empty;
                signup_emailid.Text = string.Empty;
                signup_password.Text = string.Empty;
                UpdatePanel1.Update();
                UpdatePanel2.Update();
                Label1.Text = "This Svv Mail ID is Already Exist <br/> If you Forgot Your Password Click <a href='forgotpass.aspx'>Here</a> to Recover Your Password'";
            }
        }

        protected void signup_emailid_TextChanged(object sender, EventArgs e)
        {
            //UpdateProgress1.Visible = false;
            stdusername_tb_regex_validator.Validate();
            if (stdusername_tb_regex_validator.IsValid && signup_emailid.Text != null)
            {
                string error;
                string id;// no use of this ID here;it is for forgot pass token link;
                string sp_name = "sp_isStdEmailIdExist";
                if (DataAccessLayer.isEmailIDExist_getItsID(signup_emailid.Text.Trim(), sp_name, out error, out id))
                {
                    if (error == null)
                    {
                        isValidEmail = false;
                        Label2.CssClass = "mdl-color-text--accent";
                        //Label2.Text = "<center><div style='display:flex; border:solid; vertical-align:central;text-align:center;'><i class='material-icons'>error</i><div style='padding-bottom:4px'>Username Already Exists</div></div></center>";
                        string html = "<br/><div style='display:inline-flex; vertical-align:central;'><div class='icon material-icons mdl-color-text--accent'>error</div><label style='padding-top:2px' for='tt2'class='mdl-radio__label'>&nbsp;&nbsp;User already exits</label></div>";
                        Label2.Controls.Add(new LiteralControl(html));
                    }
                    else {
                        Label1.Text = error;
                    }
                }
                else {
                    isValidEmail = true;
                    //Label2.CssClass = "mdl-color-text--primary";
                    Label2.Text = "<br/><div style='display:inline-flex; vertical-align:central;'><div class='icon material-icons mdl-color-text--primary'>done</div><label style='padding-top:2px' for='tt2'class='mdl-radio__label mdl-color-text--primary'>&nbsp;Valid Email ID/Student not Exists</label></div>";
                    //LabeText = "valid";
                }
            }
        }
    }
}