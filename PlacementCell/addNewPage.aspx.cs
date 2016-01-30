using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class addNewPage : System.Web.UI.Page
    {
        static string link;
        static bool isFileSelected_uploaded =false;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void saveUploadedFile_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    if (FileUpload1.PostedFile.ContentType == "text/html")
                    {
                        link = Path.GetFileName(FileUpload1.FileName).Replace(' ','_').Trim();   
                        if (!link.Contains(".html"))
                        {
                            link += "l";
                        }
                        FileUpload1.SaveAs(Server.MapPath("~/newpages/") + link);
                        Label2.Text = "<br />File <b><u>" + link + "</b></u> is Uploaded...!" + " <a href=deleteFile>Delete</a> ?";    
                        //Label1.Text = "Upload status: File uploaded...!";
                        isFileSelected_uploaded = true;
                    }
                    else {
                        Label2.ForeColor = System.Drawing.Color.Red;
                        Label2.Text = "<br />Upload status: Only Html files are accepted!";
                    }
                }
                catch(Exception ex)
                {
                    Label2.ForeColor = System.Drawing.Color.Red;
                    Label2.Text = "<br />Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
            else {
                Label2.ForeColor = System.Drawing.Color.Red;
                Label2.Text = "<br />Select a File First";
            }
        }
        protected void btnCreateNewPage_Click(object sender, EventArgs e)
        {

           // if (ddl_whereToUpload.SelectedValue.ToString() == "1" || ddl_whereToUpload.SelectedValue.ToString() == "2")
           // {
                if (isFileSelected_uploaded == true)
                {
                    if (DataAccessLayer.isPageUploaded(fileTitle.Text,fileDesc.Text, link.Replace(' ','_').Trim()))
                    {
                        Label1.Text = "Successfully Created New Page...";
                    }
                    else
                    {
                        Label1.Text = "Page Not Uploaded..Some Error Occured";
                    }
                }
                else
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "First Select the File and Click on Upload Button <br/> Then Click Create Page..";
                }
           // }
            //else
            //{
            //    Label1.ForeColor = System.Drawing.Color.Red;
            //    Label1.Text = "Please Select where to upload";
            //}
        }
    }
}