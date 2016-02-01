using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class deleteEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int eventID = Convert.ToInt32(Request.Form["delete"]);
            Label1.Text = eventID.ToString();
        }
    }
}