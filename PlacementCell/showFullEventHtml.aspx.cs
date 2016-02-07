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
            string folderName = null;
            if (Request.Form["fileType"] != null)
            {
                string fileType = Request.Form["fileType"];
                if (fileType != "downloadLink")
                {
                    if (fileType == "htmlPage")
                    {
                        folderName = "newpages";
                    }
                    else if (fileType == "image")
                    {
                        folderName = "newimages";
                    }
                    string link = "~/" + folderName + "/" + Request.Form["viewmore"];
                    iFrame_showFullEvent.Src = link;
                }
                else if (fileType == "downloadLink")
                {
                    folderName = "newdownloads";
                    try
                    {
                        string filename = Request.Form["viewmore"];

                        // set the http content type to "APPLICATION/OCTET-STREAM
                        Response.ContentType = "APPLICATION/OCTET-STREAM";


                        string disHeader = "Attachment; Filename=\"" + filename + "\"";
                        Response.AppendHeader("Content-Disposition", disHeader);

                        // transfer the file byte-by-byte to the response object
                        //System.IO.FileInfo fileToDownload = new System.IO.FileInfo("~/" + folderName + "/" + filename);
                        Response.TransmitFile(Server.MapPath("~/"+folderName+"/"+filename));
                        Response.Flush();
                        Response.End();

                    }
                    catch (Exception ex)
                    {
                        Label1.Text = ex.Message;
                    }
                }
            }
            else {
                Response.Redirect("home.aspx");
            }
        }
    }
}