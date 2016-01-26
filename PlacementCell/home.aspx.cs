using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
   
    public partial class home : System.Web.UI.Page
    {
        public string setHomePage;
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

        protected void iFrame_home_Init(object sender, EventArgs e)
        {
            //string 
            iFrame_home.Src = "~/newpages/Untitleddocument.html";
        }
    }
}