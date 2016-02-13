using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class admin : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"] != null)
            {
                Response.Redirect("home.aspx");
            }
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            string hashval = HashGenerator.getHash(adminusername.Text, adminpassword.Text);
            string error;
            if (DataAccessLayer.isMemberExits(adminusername.Text, hashval,out error))
            {
                if (error == null)
                {
                    Session["admin_username"] = adminusername.Text;
                    Response.Redirect("adminHome.aspx");
                }
                else {
                    Label1.Text = error;
                }
            }
            else
            {

                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Wrong user id or Password";
            }
            //Label1.Text = hashval;
        }
    }
}
