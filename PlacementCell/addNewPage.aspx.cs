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
        protected static string id_Of_Editnotice { get; set; }

        protected static string fileLinkInDB { get; set; }

        protected static string fileTypeInDB { get; set; }

        protected string selectRadioButton { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_username"] == null) {
                Response.Redirect("admin.aspx");
            }
            if (Request.Form["edit"] != null)
            {
                btnCreateNewPage.Text = "Save Changes";

                CheckBox1.Visible = true;
                chkBox_Label.Visible = true;
                string title, desc;
                hideIT.Style.Add("display", "none");
                id_Of_Editnotice = Request.Form["noticeID"];
                title = Request.Form["title"].Replace('_', ' ');
                desc = Request.Form["desc"].Replace('_', ' ');
                fileLinkInDB = Request.Form["fileLink"];
                fileTypeInDB = Request.Form["fileType"];
                fileTitle.Text = title;
                fileDesc.Text = desc;

                this.selectRadioButton = fileTypeInDB;

                fileHistory.Text = "<br />Selected file was " + fileLinkInDB;
               /// Label2.Text = id_Of_Editnotice + "<br/> " + title + "<br/> " + desc + "<br/> " + fileLinkInDB + "<br/>" + fileTypeInDB;
            }
        }

        protected void btnCreateNewPage_Click(object sender, EventArgs e)
        {
            string link=null;
            string selectedType = null;

            selectedType = Request.Form["options"];

            if (CheckBox1.Checked == true || btnCreateNewPage.Text == "Create Notice")//After click on edit button on notice card,if admin wants to change only the title or description of the notice then he/she will not upload any file.therefore this condition is here
            {
                if (selectedType == "htmlPage" || selectedType == "image" || selectedType == "downloadLink")
                {
                    if (FileUpload1.HasFile)
                    {
                        if (selectedType == "htmlPage")
                        {
                            this.selectRadioButton = "htmlPage";
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
                                    if (CheckBox1.Checked == true && btnCreateNewPage.Text == "Save Changes")
                                    {
                                        editNotice(link, selectedType);
                                    }
                                    else {
                                        saveNotice(link, selectedType);
                                    }
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
                            this.selectRadioButton = "image";
                            if (FileUpload1.PostedFile.ContentType == "image/jpeg")
                            {
                                try
                                {
                                    link = Path.GetFileName(FileUpload1.FileName).Trim();
                                    FileUpload1.SaveAs(Server.MapPath("~/newimages/") + link);
                                    if (CheckBox1.Checked == true && btnCreateNewPage.Text == "Save Changes")
                                    {
                                        editNotice(link, selectedType);
                                    }
                                    else {
                                        saveNotice(link, selectedType);
                                    }
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
                            this.selectRadioButton = "downloadLink";
                            try
                            {
                                link = Path.GetFileName(FileUpload1.FileName).Trim();
                                FileUpload1.SaveAs(Server.MapPath("~/newdownloads/") + link);
                                if (CheckBox1.Checked == true && btnCreateNewPage.Text == "Save Changes")
                                {
                                    editNotice(link, selectedType);
                                }
                                else {
                                    saveNotice(link, selectedType);
                                }
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
                        selectRadioButton = Request.Form["options"];
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
            else if (CheckBox1.Checked == false && btnCreateNewPage.Text == "Save Changes")
            {
                editNotice(fileLinkInDB, fileTypeInDB);
            }
            else {
                Label1.Text = "Something is Worng";
            }
            //if (CheckBox1.Checked == false && btnCreateNewPage.Text == "Save Changes")
            //{
            //    editNotice(fileLinkInDB, fileTypeInDB);
            //}
            //else if (CheckBox1.Checked==true && btnCreateNewPage.Text == "Save Changes") {
            //    editNotice(link, selectedType);
            //}
            //else if (btnCreateNewPage.Text == "Create Notice")
            //{
            //    saveNotice(link, selectedType);
            //}
        }

        protected void saveNotice(string link, string selectedType)
        {

            if (DataAccessLayer.isNoticeCreated(fileTitle.Text, fileDesc.Text, link.Replace(' ', '_').Trim(), selectedType))
            {
                Label1.Text = "Successfully Created New Page...<br/>Do you want to <a href='notices.aspx'>Delete</a> ?";
            }
            else
            {
                Label1.Text = "Page Not Uploaded..Some Error Occured";
            }
        }

        protected void editNotice(string newlink, string newselectedType)
        {
            string error;
            // Label1.Text = id_Of_Editnotice +"<br/> "+ fileTitle.Text + " <br/>" + fileDesc.Text + "<br/> " + newlink + "<br/> " + newselectedType;
            if (DataAccessLayer.isNoticeEdited(id_Of_Editnotice, fileTitle.Text, fileDesc.Text, newlink, newselectedType, out error))
            {

                if (error == null)
                {
                    Label1.Text = "Successfully Made Changes To notice";
                }
                else {
                    Label1.Text = error;
                }
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                hideIT.Style.Clear();
                hideIT.Style.Add("display", "normal");
            }
            else {
                hideIT.Style.Clear();
                hideIT.Style.Add("display", "none");
            }
        }
    }
}