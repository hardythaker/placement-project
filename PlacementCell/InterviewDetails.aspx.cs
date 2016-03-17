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
        //List<int> intrested_event = new List<int>();
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
            //fetch both the tables interviews as wll as interested
            DataSet ds = DataAccessLayer.fetchInterviewsEvents(Session["student_username"].ToString());
            DataTable dt_interview = ds.Tables[0];//intreview table
            dt_interview.Columns.Add("intrested",typeof(bool));//added a column

            DataTable dt_intrested = ds.Tables[1];//interested table

            //this code is to insert true or false in the column we have created above 
            if (dt_intrested.Rows.Count > 0)//check if the student have not interested in any interview or coming for first time
            {
                foreach (DataRow dr_intrested in dt_intrested.Rows)
                {
                    //interested_event.Add(Convert.ToInt32(dr_intrested.ItemArray[1]));
                    foreach (DataRow dr_interview in dt_interview.Rows)
                    {
                        //check if the interested table has the interiew_id
                        if (Convert.ToInt32(dr_intrested["interview_id"]) == Convert.ToInt32(dr_interview["id"]))
                        {
                            dr_interview["intrested"] = true;//student is intereseted
                        }
                        else
                        {
                            dr_interview["intrested"] = false;//student is not interested
                        }
                    }
                }
            }
            else {
                foreach (DataRow dr_interview in dt_interview.Rows)
                {
                    dr_interview["intrested"] = false;//make all value false if he is coming first time or not interested in avy interview
                }
            }
            Repeater1.DataSource = ds.Tables[0];
            Repeater1.DataBind();
        }

        protected void btn_Intrested_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            var item = (RepeaterItem)button.NamingContainer;
            HiddenField hf_event_id = (HiddenField)item.FindControl("hf_event_id");
            int event_id = Convert.ToInt32(hf_event_id.Value);
            Label lbl_company_name = (Label)item.FindControl("lbl_company_name");
            Label lbl_description = (Label)item.FindControl("lbl_description");
            Label lbl_event_date = (Label)item.FindControl("lbl_event_date");
            Label lbl_min_Ty = (Label)item.FindControl("lbl_min_Ty");
            Label lbl_min_hsc = (Label)item.FindControl("lbl_min_hsc");
            Label lbl_min_ssc = (Label)item.FindControl("lbl_min_ssc");
            Label lbl_backlogs = (Label)item.FindControl("lbl_backlogs");
            Label lbl_status = (Label)item.FindControl("lbl_status");
            string error;
            //Label2.Text = event_id.ToString() +" "+ lbl_company_name.Text + " " + lbl_description.Text + " " + lbl_event_date.Text + " " + lbl_min_Ty.Text + " " + lbl_min_hsc.Text + " " + lbl_min_ssc.Text + " " + lbl_backlogs.Text;
            //submitting data to database
            if (DataAccessLayer.addStudentToIntrested(Session["student_username"].ToString(), event_id, out error))
            {
                if (error == null)
                {
                    button.Visible = false;
                    lbl_status.Text = "You are Going To This Interview";
                }
                else
                {
                    lbl_status.Text = error;
                }
            }
            else
            {
                lbl_status.Text = "Some Error Occured";
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item)
            {
                Button btn_intrested = (Button)e.Item.FindControl("btn_intrested");
                Label lbl_already_intrested = (Label)e.Item.FindControl("lbl_already_intrested");
                //HiddenField hf_event_id = (HiddenField)e.Item.FindControl("hf_event_id");
                HiddenField hf_intrested = (HiddenField)e.Item.FindControl("hf_event_id");
                //int event_id = Convert.ToInt32(hf_event_id.Value);
                bool intrested = Convert.ToBoolean(hf_intrested.Value);
                if (intrested == true)
                {
                    btn_intrested.Visible = false;
                    lbl_already_intrested.Visible = true;
                }
                else
                {
                    btn_intrested.Visible = true;
                    lbl_already_intrested.Visible = false;
                }

            }
        }
    }
}