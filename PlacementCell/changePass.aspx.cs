using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class WebForm1 : System.Web.UI.Page
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
            if (Session["student_username"] == null && Session["admin_username"]==null) {
                Response.Redirect("home.aspx");
            } 
        }

        protected void btn_changePass_Click(object sender, EventArgs e)
        {
            if (Session["student_username"] != null)
            {
                string hashval = HashGenerator.getHash(Session["student_username"].ToString(), tb_currentPass.Text);
                string str_SPName = "sp_isStdPassChanged";
                string verified;//no use of the parameter in this case;
                string error;
                if (DataAccessLayer.isStudentExits(Session["student_username"].ToString(), hashval,out verified,out error))
                {
                    if (error == null)
                    {
                        string newhashval = HashGenerator.getHash(Session["student_username"].ToString(), tb_newPass.Text);
                        if (DataAccessLayer.isPassChanged(Session["student_username"].ToString(), newhashval, str_SPName, out error))
                        {
                            if (error == null)
                            {
                                lbl_changePassStatus.CssClass = "mdl-color-text--primary";
                                lbl_changePassStatus.Text = "<br/>Sucessfully Changed your Password";
                            }
                            else
                            {
                                lbl_changePassStatus.Text = error;
                            }
                        }
                        else
                        {
                            lbl_changePassStatus.ForeColor = System.Drawing.Color.Red;
                            lbl_changePassStatus.Text = "<br/>Some Error Occured";
                        }
                    }
                    else {
                        lbl_changePassStatus.ForeColor = System.Drawing.Color.Red;
                        lbl_changePassStatus.Text = error;
                    }
                }
                else
                {
                    lbl_changePassStatus.ForeColor = System.Drawing.Color.Red;
                    lbl_changePassStatus.Text = "<br/>Your Current Password is Wrong..";
                }
            }
            else if(Session["admin_username"] != null)
            {
                string hashval = HashGenerator.getHash(Session["admin_username"].ToString(), tb_currentPass.Text);
                string str_SPName = "sp_isAdminPassChanged";
                string error;
                if (DataAccessLayer.isMemberExits(Session["admin_username"].ToString(), hashval,out error))
                {
                    if (error == null)
                    {
                        string newhashval = HashGenerator.getHash(Session["admin_username"].ToString(), tb_newPass.Text);
                        if (DataAccessLayer.isPassChanged(Session["admin_username"].ToString(), newhashval, str_SPName, out error))
                        {
                            if (error != null)
                            {
                                lbl_changePassStatus.Text = error;
                            }
                            else {
                                lbl_changePassStatus.CssClass = "mdl-color-text--primary";
                                lbl_changePassStatus.Text = "<br/>Sucessfully Changed your Password";
                            }

                        }
                        else {
                            lbl_changePassStatus.ForeColor = System.Drawing.Color.Red;
                            lbl_changePassStatus.Text = "<br/>Some Error Occured";
                        }
                    }
                    else {
                        lbl_changePassStatus.Text = error;
                    }
                }
                else
                {
                    lbl_changePassStatus.ForeColor = System.Drawing.Color.Red;
                    lbl_changePassStatus.Text = "<br/>Your Current Password is Wrong..";
                }
            }
            
        }
    }
}