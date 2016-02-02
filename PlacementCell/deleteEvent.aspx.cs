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
            if (Session["admin_username"] != null)
            {
                int eventID = Convert.ToInt32(Request.Form["delete"]);
                string error;
                if (DataAccessLayer.deleteNotices(eventID, out error))
                {
                    if (error == null)
                    {
                        Label1.Text = "The event is deleted";
                    }
                    else
                    {
                        Label1.Text = error;
                    }
                }
               // Label1.Text = eventID.ToString();
            }
            else {
                Response.Redirect("admin.aspx");
            }
        }
    }
}