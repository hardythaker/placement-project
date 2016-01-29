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
                        string filename = Path.GetFileName(FileUpload1.FileName);
                        FileUpload1.SaveAs(Server.MapPath("~/newpages/") + filename);                      
                        Label1.Text = "Upload status: File uploaded...!";
                        isFileSelected = true;
                    }
                    else {
                        Label1.ForeColor = System.Drawing.Color.Red;
                       Label1.Text = "Upload status: Only Html files are accepted!";
                    }
                }
                catch(Exception ex)
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
            else {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Select a File First";
            }
        }

        string filename;
        bool isFileSelected = false;

        protected void btnCreateNewPage_Click(object sender, EventArgs e)
        {
            if (isFileSelected == true)
            {
                if (ddl_whereToUpload.SelectedValue.ToString() == "1")
                {
                    if (DataAccessLayer.isPageUploaded(fileTitle.Text, filename, ddl_whereToUpload.Text))
                    {
                        Label1.Text = "Successfully Created New Page...";
                    }
                }
            }
            else {
                Label1.Text = "First Select the File and Upload <br/> Then Click Create Page..";

            }
        }
    }
}