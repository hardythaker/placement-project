using System;
using System.Web.Script;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["student _username"] != null || Session["admin_username"] != null)// for preventing direct opening of this page
            {
                Session.Abandon();
                Session.Clear();
                if (Request.UrlReferrer.ToString().Contains("adminReg.aspx"))//because after creating new admin if i wants to login again then redirect him to admin login page
                {
                    Response.Redirect("admin.aspx");
                }
                else
                {
                    Response.Redirect("home.aspx");
                }
            }
            else {
                Response.Redirect("home.aspx");
            }
        }
    }
}