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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"] == null)
            {
                Response.Redirect("admin.aspx");
            }
        }

        protected void btnAdminReg_Click(object sender, EventArgs e)
        {
            string hashval_for_current_pass = HashGenerator.getHash(Session["admin_username"].ToString(), conformAdminPassword.Text);//hashing of logedin admin and his conformation pass
            if (DataAccessLayer.isMemberExits(Session["admin_username"].ToString(), hashval_for_current_pass))//checking current logedin admin and His hasval
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
            else
            {
                Label1.Text = "Your Current Admin Password is Wrong...";
            }
        }

        protected void adminRegUsername_TextChanged(object sender, EventArgs e)
        {
            string error;
            string id;
            string sp_name = "sp_isAdminEmailIdExist";
            if (DataAccessLayer.isEmailIDExist_getItsID(adminRegUsername.Text,sp_name,out error,out id)) {
                if (error == null)
                {
                    adminusername_tb_regex_validator.ErrorMessage = "Email ID already Exist";
                }
                else {
                    Label1.Text = error;
                }
            }
        }
    }
}