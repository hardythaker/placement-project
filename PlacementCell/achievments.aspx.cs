using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class achievments : System.Web.UI.Page
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
            if (IsPostBack)
            {
                if (Session["admin_username"] != null)
                {
                    int eventID = Convert.ToInt32(Request.Form["delete"]);
                    string error;
                    if (DataAccessLayer.deleteNotices(eventID, out error))
                    {
                        if (error != null)
                        {
                            Label1.Text = error;
                        }
                    }
                }
                else
                {
                    Response.Redirect("admin.aspx");
                }
            }
            string section_ID = "1";
            DataTable dt = DataAccessLayer.fetchNotices(section_ID);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    string noticeID = row.ItemArray[0].ToString();
                    string title = row.ItemArray[1].ToString();
                    string desc = row.ItemArray[2].ToString();
                    string fileLink = row.ItemArray[3].ToString();
                    string fileType = row.ItemArray[4].ToString();
                    string html;
                    string buttonName;
                    if (fileType == "downloadLink")
                    {
                        buttonName = "Download";
                    }
                    else {
                        buttonName = "View More";
                    }
                    if (Session["admin_username"] != null)
                    {
                        html = "<div class='demo-card-wide mdl-card mdl-shadow--8dp' style='width:80vw'><div class='mdl-card__title mdl-color--primary mdl-color-text--white'><h2 class='mdl-card__title-text' style='text-transform:capitalize;'>" + title + "</h2></div><div class='mdl-card__supporting-text mdl-typography--body-1-force-preferred-font-color-contrast' style='text-align:left; font-size:15px'><b>" + desc + "</b></div><div class='mdl-card__actions mdl-card--border'><div style ='text-align:left;display:flex;'><form method=post><button class='mdl-button mdl-color-text--accent mdl-js-button mdl-js-ripple-effect' runat='server' formaction='showFullEventHtml.aspx' name='viewmore' value=" + fileLink + ">" + buttonName + "</button><input type='hidden' runat='server' value=" + fileType + " name='fileType'><input type='hidden' runat='server' value=" + title.Replace(' ', '_') + " name='title'><input type='hidden' value=" + desc.Replace(' ', '_') + " name='desc'><input type='hidden' value=" + noticeID + " name='noticeID'><input type='hidden' value=" + fileLink + " name='fileLink'><input type='hidden' value="+section_ID+" name='section_id'><button class='mdl-button mdl-color-text--accent mdl-js-button mdl-js-ripple-effect' runat='server' formaction='addNewPage.aspx' name='edit' value=" + noticeID + "> Edit </button></form><button class='mdl-button mdl-color-text--accent mdl-js-button mdl-js-ripple-effect' runat='server' formmethod='post' formaction='achievments.aspx' onclick='return confirm()' name='delete' value=" + noticeID + "> Delete </button></div></div></div><br/>";
                    }
                    else
                    {
                        html = "<div class='demo-card-wide mdl-card mdl-shadow--8dp' style='width:80vw'><div class='mdl-card__title mdl-color--primary mdl-color-text--white'><h2 class='mdl-card__title-text' style='text-transform:capitalize;'>" + title + "</h2></div><div class='mdl-card__supporting-text mdl-typography--body-1-force-preferred-font-color-contrast' style='text-align:left; font-size:15px'><br/><b>" + desc + "</b></div><div class='mdl-card__actions mdl-card--border'><div style ='text-align:left'><form method='post'><button class='mdl-button mdl-color-text--accent mdl-js-button mdl-js-ripple-effect' runat='server'  formaction='showFullEventHtml.aspx' name='viewmore' id='vm' value=" + fileLink + ">" + buttonName + "</button><input type='hidden' value=" + fileType + " name='fileType'></form></div></div></div><br/>";
                    }
                    Panel1.Controls.Add(new LiteralControl(html));
                }
            }
            else
            {
                Label1.Text = "No New Achievments...";
            }
        }
    }
}