using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class CreateInterviewEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindDDL();
            }
        }

        private void bindDDL()
        {
            
            DataSet ds = DataAccessLayer.fetchCompanyClassDivision();
            ddl_company_names.DataSource = ds.Tables[0];
            ddl_company_names.DataValueField = "id";
            ddl_company_names.DataTextField = "company_name";
            ddl_company_names.DataBind();
            ddl_company_names.Items.Insert(0, new ListItem("--Select Company--", "0"));

            Repeater_branch.DataSource = ds.Tables[1];
            Repeater_branch.DataBind();
        }

        protected void btn_CreateInterViewEvent_Click(object sender, EventArgs e)
        {
            string company_id = ddl_company_names.SelectedValue;
            DateTime interview_date = Convert.ToDateTime(tb_interviewDate.Text);
            string description = tb_Description.Text;
            int minTyPer = Convert.ToInt32(tb_tyMinPercentage.Text);
            int minHscPer = Convert.ToInt32(tb_hscMinPercentage.Text);
            int minSscPer = Convert.ToInt32(tb_sscMinPercentage.Text);
            int minBacklogs = Convert.ToInt32(tb_minNumbersOfBacklogs.Text);
            string Selected_Branch = Request.Form["chkbx_selectedStreams"];
            string[] branch = Selected_Branch.Split(',');
            //Label1.Text = company_id + "<br>" + interview_date.ToString("dd/MM/yyyy") + "<br>" + description + "<br>" + minTyPer + "<br>" + minHscPer + "<br>" + minSscPer + "<br>";
            List<Int32> branch_ids = new List<int>();
            for (int i = 0; i < branch.Length; i++)
            {
                branch_ids.Add(Convert.ToInt32(branch[i]));
            }
            string error;
            if (DataAccessLayer.isInterviewEventCreated(company_id, interview_date.ToString("yyyy-MM-dd"), description, minTyPer, minHscPer, minSscPer,minBacklogs,branch_ids, out error))
            {
                if (error == null)
                {
                    Label1.Text = "Successfully Created Event";
                }
                else
                {
                    Label1.Text = error;
                }
            }
            else
            {
                Label1.Text = "Sorry Cannot Create Event...";
            }

        }
    }
}