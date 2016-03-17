using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class InterviewDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["student_username"] != null)
                {
                    fetchInterviews();
                }
                else {
                    Response.Redirect("studentLogin.aspx");
                }
            }
        }

        private void fetchInterviews()
        {
            DataSet dt = DataAccessLayer.fetchInterviewsEvents(Session["student_username"].ToString());
            Repeater1.DataSource = dt.Tables[0];
            Repeater1.DataBind();
        }

        protected void btn_Intrested_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            var item = (RepeaterItem)button.NamingContainer;
            HiddenField hf = (HiddenField)item.FindControl("hf_event_id");
            Label2.Text = hf.Value;

        }
    }
}