using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class studentLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnStudentLogin_Click(object sender, EventArgs e)
        {
            string hashval = HashGenerator.getHash(username.Text, password.Text);
            if (DataAccessLayer.isMemberExits(username.Text, hashval))
            {
                Session["student_username"] = username.Text;
                Response.Redirect("studentHome.aspx");
            }
            else
            {
                Label1.Text = "Wrong Username Name or Password";
                Label2.Text = "Not a Member ? Click <a href=studentReg.aspx>Here</a> To Register First";
            }
        }
    }
}