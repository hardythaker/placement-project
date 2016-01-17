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
            string hashval = HashGenerator.getHash(adminusername.Text,adminpassword.Text);

            if (DataAccessLayer.isMemberExits(adminusername.Text, hashval) == true)
            {

                Session["username"] = adminusername.Text;
                Response.Redirect("adminHome.aspx");
                //Label1.Text = "Successfull";


            }
            else
            {
                Label1.Text = "Wrong user id or Password";
                Label1.Text = " Not A member ? Click <a href=MemberReg.aspx>Here</a> To Register ";
            }
        }
    }
}
 