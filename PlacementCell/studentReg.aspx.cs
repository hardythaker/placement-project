using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class studentReg : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnStudentReg_Click(object sender, EventArgs e)
        {
            //collecting data from form
            string fname = signup_fname.Text;
            string lname = signup_lname.Text;
            string stream = DropDownList1.SelectedItem.Text;
            string gender = Request.Form["options"];
            string email = signup_emailid.Text;
            string pass = signup_password.Text;
            //End collecting data

            string hashval = HashGenerator.getHash(email , pass); //generating sha1

            if (DataAccessLayer.isStudentRegSuccessful(fname, lname, stream, gender, email, hashval))//passing to method for updating
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Succesfully Registered...!\\n Click Ok to Login');window.location.replace('studentLogin.aspx');</script>");
            }
            else {
                Label1.Text = "Some Error Occured. Make Sure You had Filled all the Fields";
            }
            //Label1.Text = fname +"<br>" +lname + "<br>" + stream + "<br>" + gender + "<br>" + email + "<br>" + pass; //for testing
            
        }
    }
}