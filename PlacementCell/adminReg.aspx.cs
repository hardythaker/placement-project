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

        }

        protected void btnAdminReg_Click(object sender, EventArgs e)
        {
            if (Register.registerMember(adminRegUsername.Text, adminRegPassword.Text))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Succesfully Registered...!\\n Click Ok to Login');window.location.replace('admin.aspx');</script>");
            }
            else
            {
                //Response.Write("Registration failed");
                Label1.Text = "Registration failed Try Again Later";
            }
        }
    }
}