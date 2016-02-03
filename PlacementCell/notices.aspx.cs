﻿using System;
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
            if (IsPostBack)
            {
                if (Session["admin_username"] != null)
                {
                    int eventID = Convert.ToInt32(Request.Form["delete"]);
                    string error;
                    if (DataAccessLayer.deleteNotices(eventID, out error))
                    {
                        if (error == null)
                        {
                           // Label1.Text = "The event is deleted";
                        }
                        else
                        {
                            Label1.Text = error;
                        }
                    }
                    // Label1.Text = eventID.ToString();
                }
                else
                {
                    Response.Redirect("admin.aspx");
                }
            }
            DataTable dt = DataAccessLayer.fetchNotices();
            if (dt != null)
            {
                foreach (DataRow row in dt.Rows)
                {
                    string noticeID = row.ItemArray[0].ToString();
                    string title = row.ItemArray[1].ToString();
                    string desc = row.ItemArray[2].ToString();
                    string fileLink = row.ItemArray[3].ToString();
                    string fileType = row.ItemArray[4].ToString();
                    //string viewMoreURL = null;
                    string html;
                    if (Session["admin_username"] != null)
                    {
                        //if (fileType == "htmlPage")
                        //{
                        //    viewMoreURL = "showFullEventHtml.aspx";
                        //}
                        //else if (fileType == "image")
                        //{
                        //    viewMoreURL = "showFullEventHtml.aspx";

                        //}
                        //else if (fileType == "downloadLink")
                        //{
                        //    viewMoreURL = "showFullEventDonload.aspx";
                        //}

                        html = "<div class='demo-card-wide mdl-card mdl-shadow--8dp' style='width:80vw'><div class='mdl-card__title'><h1 class='mdl-typography--display-2 mdl-color-text--primary'>" + title + "</h1></div><div class='mdl-card__supporting-text mdl-typography--body-1-force-preferred-font-color-contrast' style='text-align:left; font-size:15px'><b>" + desc + "</b></div><div class='mdl-card__actions mdl-card--border'><div style ='text-align:left;'><form method='post'><button class='mdl-button mdl-color-text--accent mdl-js-button mdl-js-ripple-effect' runat='server' formaction='showFullEventHtml.aspx' name='viewmore' value=" + fileLink + "> View More</button><input type='hidden' value=" + fileType + " name='fileType'><button class='mdl-button mdl-color-text--accent mdl-js-button mdl-js-ripple-effect' runat='server' formmethod='post' formaction='notices.aspx' onclick='__doPostBack()' name='delete' value=" + noticeID + "> Delete </button><button class='mdl-button mdl-color-text--accent mdl-js-button mdl-js-ripple-effect' runat='server' formaction='addNewPage.aspx' name='edit' value=" + noticeID + "> Edit </button></form></div></div></div><br/>";
                    }
                    else
                    {
                   
                  
                        html = "<div class='demo-card-wide mdl-card mdl-shadow--8dp' style='width:80vw'><div class='mdl-card__title'><h1 class='mdl-typography--display-2 mdl-color-text--primary'>" + title + "</h1></div><div class='mdl-card__supporting-text mdl-typography--body-1-force-preferred-font-color-contrast' style='text-align:left; font-size:15px'><b>" + desc + "</b></div><div class='mdl-card__actions mdl-card--border'><div style ='text-align:left'><form method='post'><button class='mdl-button mdl-color-text--accent mdl-js-button mdl-js-ripple-effect' runat='server'  formaction='showFullEventHtml.aspx' name='viewmore' value=" + fileLink + "> View More</button><input type='hidden' value="+fileType +" name='fileType'></form></div></div></div><br/>";
                    }
                    Panel1.Controls.Add(new LiteralControl(html));
                }
            }
            else
            {
                Label1.Text = "No New Notices...";
            }
        }
    }
}