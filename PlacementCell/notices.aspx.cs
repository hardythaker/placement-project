using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class notices : System.Web.UI.Page
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
            DataTable dt = DataAccessLayer.fetchNotices();

            //while (drc.Contains("id"))
            //{
            if (dt != null)
            {
                foreach (DataRow row in dt.Rows)
                {

                    string title = row.ItemArray[1].ToString();
                    string desc = row.ItemArray[2].ToString();
                    string link = row.ItemArray[3].ToString();
                
                    string html = "<div class='demo-card-wide mdl-card mdl-shadow--8dp' style='width:70vw'><div class='mdl-card__title'><h1 class='mdl-typography--display-2 mdl-color-text--primary'>" + title + "</h1></div><div class='mdl-card__supporting-text mdl-typography--body-1-force-preferred-font-color-contrast' style='text-align:left; font-size:15px'><b>" + desc + "</b></div><div class='mdl-card__actions mdl-card--border'><div style ='text-align:left'><button class='mdl-button mdl-color-text--accent mdl-js-button mdl-js-ripple-effect' runat='server' formmethod='get' formaction='showFullEvent.aspx' name='viewmore' value=" + link+"> View More</button></div></div></div><br/>";
                    Panel1.Controls.Add(new LiteralControl(html));
                }
            }
                //string desc = "Selected Candidate in Apptitude test. Held in Sk Somaiya College on 12/1/2016";
                //string link = "#";
                //for (int i = 0; i < 5; i++)
                //{
                //    string html = "<div class='demo-card-wide mdl-card mdl-shadow--8dp' style='width:70vw'><div class='mdl-card__title'><h1 class='mdl-typography--display-2 mdl-color-text--primary'>" + title + "</h1></div><div class='mdl-card__supporting-text mdl-typography--body-1-force-preferred-font-color-contrast' style='text-align:left; font-size:15px'><b>" + desc + "</b></div><div class='mdl-card__actions mdl-card--border'><div style ='text-align:left'><a class='mdl-button mdl-color-text--accent mdl-js-button mdl-js-ripple-effect' href=" + link + ">View More</a></div></div></div><br/>";
                //    Panel1.Controls.Add(new LiteralControl(html));
                //}
         }
    }
}