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
            
        }
        protected void saveUploadedFile(string link,string selectedType)
        {

            if (DataAccessLayer.isPageUploaded(fileTitle.Text, fileDesc.Text, link.Replace(' ', '_').Trim(), selectedType))
                {
                    Label1.Text = "Successfully Created New Page...";
                }
                else
                {
                    Label1.Text = "Page Not Uploaded..Some Error Occured";
                }
        }
        protected void btnCreateNewPage_Click(object sender, EventArgs e)
        {
            string link;
            string selectedType=null;

            selectedType = Request.Form["options"];

            if (selectedType == "html" || selectedType == "img" || selectedType == "link")
            {
                if (FileUpload1.HasFile)
                {
                    if (selectedType == "html")
                    {
                        
                        if (FileUpload1.PostedFile.ContentType == "text/html")
                        {
                            try
                            {
                                link = Path.GetFileName(FileUpload1.FileName).Replace(' ', '_').Trim();
                                if (!link.Contains(".html"))
                                {
                                    link += "l";
                                }
                                FileUpload1.SaveAs(Server.MapPath("~/newpages/") + link);
                                //Label1.Text = "<br />File <b><u>" + link + "</b></u> is Uploaded...!" + "<br/>Do you want to <a href=deleteFile>Delete</a> ?";
                                saveUploadedFile(link,selectedType);
                            }
                            catch (Exception ex)
                            {
                                Label1.ForeColor = System.Drawing.Color.Red;
                                Label1.Text = "<br />Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                            }
                        }
                        else {
                            Label1.Text = " Only Html Files are Allowed if Html is Selected";
                        }
                    }
                    else if (selectedType == "img")
                    {
                       
                        if (FileUpload1.PostedFile.ContentType == "image/jpeg")
                        {
                            try
                            {
                                link = Path.GetFileName(FileUpload1.FileName).Replace(' ', '_').Trim();
                                FileUpload1.SaveAs(Server.MapPath("~/newimages/") + link);
                                //Label1.Text = "<br />File <b><u>" + link + "</b></u> is Uploaded...!" + "<br/>Do you want to <a href=deleteFile>Delete</a> ?";
                                saveUploadedFile(link, selectedType);
                            }
                            catch (Exception ex)
                            {
                                Label1.ForeColor = System.Drawing.Color.Red;
                                Label1.Text = "<br />Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                            }
                        }
                        else {
                            Label1.Text = "Only jpg/jpeg Files are allowed if Image is Selected";
                        }
                    }
                    else {
                        
                        try
                        {
                            link = Path.GetFileName(FileUpload1.FileName);
                            FileUpload1.SaveAs(Server.MapPath("~/newdownloads/") + link);
                            //Label1.Text = "<br />File <b><u>" + link + "</b></u> is Uploaded...!" + "<br/>Do you want to <a href=deleteFile>Delete</a> ?";
                            saveUploadedFile(link, selectedType);
                        }
                        catch (Exception ex)
                        {
                            Label1.ForeColor = System.Drawing.Color.Red;
                            Label1.Text = "<br />Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                        }
                    }
                }
                else {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "<br />Select a File First";
                }
            }
            else
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Please Select Notice Type HTML or IMG or Download Link.";
            }




            //if (isFileSelected_uploaded == true)
            //{
            //    if (DataAccessLayer.isPageUploaded(fileTitle.Text, fileDesc.Text, link.Replace(' ', '_').Trim(), selectedType))
            //    {
            //        Label1.Text = "Successfully Created New Page...";
            //    }
            //    else
            //    {
            //        Label1.Text = "Page Not Uploaded..Some Error Occured";
            //    }
            //}
            //else
            //{
            //    Label1.ForeColor = System.Drawing.Color.Red;
            //    Label1.Text = "First Select the File and Click on Upload Button <br/> Then Click Create Page..";
            //}

        }
    }
}