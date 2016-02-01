using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class showFullEvent : System.Web.UI.Page
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
            //string link = Request.QueryString["viewmore"];
        }

        protected void iFrame_showFullEvent_Init(object sender, EventArgs e)
        {
            string link ="~/newpages/"+Request.Form["viewmore"];
            iFrame_showFullEvent.Src = link;
        }
    }
}