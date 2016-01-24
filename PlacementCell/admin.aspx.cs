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

        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            string hashval = HashGenerator.getHash(adminusername.Text, adminpassword.Text);

            if (DataAccessLayer.isMemberExits(adminusername.Text, hashval))
            {

                Session["admin_username"] = adminusername.Text;
                Response.Redirect("adminHome.aspx");
            }
            else
            {

                Label1.Text = "Wrong user id or Password <br/> Not A member ? Click <a href=MemberReg.aspx>Here</a> To Register ";
            }
            //Label1.Text = hashval;
        }
    }
}
 