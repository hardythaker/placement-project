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
                string email = Session["student_username"].ToString();
                Label1.Text = DataAccessLayer.fetchFname(email).ToUpper() +" "+Session["student_id"];//Session["student_username"].ToString();
            }
            else {
                Response.Redirect("studentLogin.aspx");
            }
        }
    }
}