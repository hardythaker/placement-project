using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class contact : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            if (Session["student_username"] != null)
            {
                this.MasterPageFile = "student.Master";
            }
            if (Session["admin_username"] != null)
            {
                this.MasterPageFile = "admin.Master";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}