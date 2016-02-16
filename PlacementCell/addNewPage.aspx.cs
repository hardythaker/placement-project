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
        protected string selectedSectionRB { get; set; }
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
               
                id_Of_Editnotice = Request.Form["noticeID"];
                title = Request.Form["title"].Replace('_', ' ');
                desc = Request.Form["desc"].Replace('_', ' ');
                fileLinkInDB = Request.Form["fileLink"];
                fileTypeInDB = Request.Form["fileType"];
                fileTitle.Text = title;
                fileDesc.Text = desc;
                hideIT.Style.Add("display", "none");
                fileHistory.Text = "<br />Selected file was " + fileLinkInDB;
               /// Label2.Text = id_Of_Editnotice + "<br/> " + title + "<br/> " + desc + "<br/> " + fileLinkInDB + "<br/>" + fileTypeInDB;
            }
        }

        protected void btnCreateNewPage_Click(object sender, EventArgs e)
        {
            string link=null;
            string selectedType = null;
            string sections = Request.Form["sections"];
            selectedType = Request.Form["options"];

            if (CheckBox1.Checked == true || btnCreateNewPage.Text == "Create Notice")//After click on edit button on notice card,if admin wants to change only the title or description of the notice then he/she will not upload any file.therefore this condition is here
            {
                if (sections == "1" || sections == "2")
                {
                    if (sections == "1")
                    {
                        selectedSectionRB = "1";
                    }
                    else if (sections == "2")
                    {
                        selectedSectionRB = "2";
                    }
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
                                        FileUpload1.SaveAs(Server.MapPath("~/newpages/") + link.Replace(' ', '_'));
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
                                        FileUpload1.SaveAs(Server.MapPath("~/newimages/") + link.Replace(' ', '_'));
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
                                    FileUpload1.SaveAs(Server.MapPath("~/newdownloads/") + link.Replace(' ', '_'));
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
                //else if (sections == "2")
                //{
                //    selectedSectionRB = "2";
                //}
                else
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Please Select a Section Type Achievement.";
                }
            }
            else if (CheckBox1.Checked == false && btnCreateNewPage.Text == "Save Changes")
            {
                editNotice(fileLinkInDB, fileTypeInDB);
            }
            else {
                Label1.Text = "Something is Worng";
            }
        }

        protected void saveNotice(string link, string selectedType)
        {
            string section = null;
            if (selectedSectionRB == "1")
            {
                section = "1";
            }
            else if (selectedSectionRB == "2")
            {
                section = "2";
            }
            if (section != null)
            {
                if (DataAccessLayer.isNoticeCreated(fileTitle.Text, fileDesc.Text, link.Replace(' ', '_').Trim(), selectedType, section))
                {
                    Label1.CssClass = "mdl-color-text--primary";
                    Label1.Text = "Successfully Created New Page...<br/>Do you want to <a href='notices.aspx'>Delete</a> ?";
                }
                else
                {
                    Label1.Text = "Page Not Uploaded..Some Error Occured";
                }
            }
            else {
                Label1.Text = "Cannot know Where to upload in Achievment or Notice";
            }
 
        }

        protected void editNotice(string newlink, string newselectedType)
        {
            string error;
            string sction = null;
            // Label1.Text = id_Of_Editnotice +"<br/> "+ fileTitle.Text + " <br/>" + fileDesc.Text + "<br/> " + newlink + "<br/> " + newselectedType;
            if (selectedSectionRB == "1")
            {
                sction = "1";
            }
            else if (selectedSectionRB == "2")
            {
                sction = "2";
            }
            if (sction != null)
            {
                if (DataAccessLayer.isNoticeEdited(id_Of_Editnotice, fileTitle.Text, fileDesc.Text, newlink.Replace(' ', '_').Trim(), newselectedType, sction, out error))
                {

                    if (error == null)
                    {
                        Label1.CssClass = "mdl-color-text--primary";
                        Label1.Text = "Successfully Made Changes To notice";
                    }
                    else {
                        Label1.Text = error;
                    }
                }
            }
            else {
                Label1.Text = "Cannot know Where to upload Edited card in Achievment or Notice";
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                hideIT.Style.Clear();
                hideIT.Style.Add("display", "normal");
                string st = fileTypeInDB;
                this.selectRadioButton = st;
            }
            else {
                hideIT.Style.Clear();
                hideIT.Style.Add("display", "none");
            }
        }
    }
}