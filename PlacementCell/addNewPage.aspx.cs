using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class addNewPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"] == null) {
                Response.Redirect("admin.aspx");
            }
            if (Request.Form["edit"] != null) {
                string id, title, desc, fileLink, fileType;
                id = Request.Form["noticeID"];
                title = Request.Form["title"];
                desc = Request.Form["desc"];
                fileLink = Request.Form["fileLink"];
                fileType = Request.Form["fileType"];
                // Label2.Text = id +" "+ title +" "+ desc +" "+ fileLink +" "+ fileType;
                fileTitle.Text = title;
                fileDesc.Text = desc;
                var s = (HtmlInputRadioButton)HtmlGenericControl;
            }
        }
        protected void saveUploadedFile(string link, string selectedType)t
        {

            if (DataAccessLayer.isPageUploaded(fileTitle.Text, fileDesc.Text, link.Replace(' ', '_').Trim(), selectedType))
            {
                Label1.Text = "Successfully Created New Page...<br/>Do you want to <a href='notices.aspx'>Delete</a> ?";
            }
            else
            {
                Label1.Text = "Page Not Uploaded..Some Error Occured";
            }
        }
        protected void btnCreateNewPage_Click(object sender, EventArgs e)
        {
            string link;
            string selectedType = null;

            selectedType = Request.Form["options"];

            if (selectedType == "htmlPage" || selectedType == "image" || selectedType == "downloadLink")
            {
                if (FileUpload1.HasFile)
                {
                    if (selectedType == "htmlPage")
                    {

                        if (FileUpload1.PostedFile.ContentType == "text/html")
                        {
                            try
                            {
                                link = Path.GetFileName(FileUpload1.FileName).Trim();
                                if (!link.Contains(".html"))
                                {
                                    link += "l";
                                }
                                FileUpload1.SaveAs(Server.MapPath("~/newpages/") + link);
                                saveUploadedFile(link, selectedType);
                            }
                            catch (Exception ex)
                            {
                                Label1.ForeColor = System.Drawing.Color.Red;
                                Label1.Text = "<br />Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                            }
                        }
                        else
                        {
                            Label1.Text = " Only Html Files are Allowed if Html is Selected";
                        }
                    }
                    else if (selectedType == "image")
                    {

                        if (FileUpload1.PostedFile.ContentType == "image/jpeg")
                        {
                            try
                            {
                                link = Path.GetFileName(FileUpload1.FileName).Replace(' ', '_').Trim();
                                FileUpload1.SaveAs(Server.MapPath("~/newimages/") + link);
                                saveUploadedFile(link, selectedType);
                            }
                            catch (Exception ex)
                            {
                                Label1.ForeColor = System.Drawing.Color.Red;
                                Label1.Text = "<br />Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                            }
                        }
                        else
                        {
                            Label1.Text = "Only jpg/jpeg Files are allowed if Image is Selected";
                        }
                    }
                    else
                    {

                        try
                        {
                            link = Path.GetFileName(FileUpload1.FileName);
                            FileUpload1.SaveAs(Server.MapPath("~/newdownloads/") + link);
                            saveUploadedFile(link, selectedType);
                        }
                        catch (Exception ex)
                        {
                            Label1.ForeColor = System.Drawing.Color.Red;
                            Label1.Text = "<br />Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                        }
                    }
                }
                else
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "<br />Select a File First";
                }
            }
            else
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Please Select Notice Type HTML or IMG or Download Link.";
            }
        }
    }
}