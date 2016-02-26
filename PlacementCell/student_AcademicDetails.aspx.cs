using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class student_AcademicDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = DataAccessLayer.fetchClass();
                listClass.DataSource = dt;
                listClass.DataTextField = "branch";
                listClass.DataValueField = "branch_id";
                listClass.DataBind();
                listClass.Items.Insert(0, new ListItem("--Stream--", "0"));
            }
        }

        protected void listClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Text = listClass.SelectedIndex.ToString() +" " +listClass.SelectedValue.ToString() + " "+listClass.SelectedItem.ToString(); 
        }
    }
}