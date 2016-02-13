using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class adminReg : System.Web.UI.Page
    {
        static bool isValidEmail;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"] == null)
            {
                Response.Redirect("admin.aspx");
            }
            if (IsPostBack)
            {
                adminusername_tb_regex_validator.Validate();
            }
        }

        protected void btnAdminReg_Click(object sender, EventArgs e)
        {
            if (isValidEmail == true)
            {
                string hashval_for_current_pass = HashGenerator.getHash(Session["admin_username"].ToString(), conformAdminPassword.Text);//hashing of logedin admin and his conformation pass
                string error;
                if (DataAccessLayer.isMemberExits(Session["admin_username"].ToString(), hashval_for_current_pass, out error))//checking current logedin admin and His hasval
                {
                    if (error == null)
                    {
                        string hashedVal = HashGenerator.getHash(adminRegUsername.Text, adminRegPassword.Text);//generate hash value form new admin
                        if (DataAccessLayer.isMemRegSuccessful(adminRegUsername.Text, hashedVal))//Register the new admin with username and hashval
                        {
                            // ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Succesfully Registered...!');window.history.back();</script>");//notofy the updation
                            //Label1.Text = "Successfully Created New Admin Click \'&lt;a herf=admin.aspx&gt;\' Here \'&lt;/a&gt;\' to Login \'&lt;/a&t;&lt;br/&gt;\' or \'&lt;a href=javascript:history.back()&gt;\' Go Back \'&lt;/a&gt;\'";
                            string msg = "<p>Successfully Created New Admin Click <a href=logout.aspx> Here </a> to Login <br /> or <a href=javascript:history.go(-2)> Go back </a></p>";
                            Label1.Controls.Add(new LiteralControl(msg));
                        }
                        else
                        {
                            Response.Write("Registration failed");
                            Label1.Text = "Admin Creation failed Try Again Later...";
                        }
                    }
                    else {
                        Label1.Text = error;
                    }
                }
                else
                {
                    Label1.Text = "Your Current Admin Password is Wrong...";
                }
            }
            else {
                Label1.Text = "Username Already Exist";
            }
        }

        protected void adminRegUsername_TextChanged(object sender, EventArgs e)
        {
            UpdateProgress2.Visible = false;
            adminusername_tb_regex_validator.Validate();
            if (adminusername_tb_regex_validator.IsValid)
            {
                string error;
                string id;
                string sp_name = "sp_isAdminEmailIdExist";
                if (DataAccessLayer.isEmailIDExist_getItsID(adminRegUsername.Text, sp_name, out error, out id))
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
                    Label2.Text = "<br/><div style='display:inline-flex; vertical-align:central;'><div class='icon material-icons mdl-color-text--primary'>done</div><label style='padding-top:2px' for='tt2'class='mdl-radio__label mdl-color-text--primary'>&nbsp;Valid Email ID</label></div>";
                    //LabeText = "valid";
                }
            }
        }
    }
}