using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class student : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["student_username"] != null)
            {
                Label1.Text = Session["student_username"].ToString();
            }
            else {
                Response.Redirect("studentLogin.aspx");
            }
        }
    }
}