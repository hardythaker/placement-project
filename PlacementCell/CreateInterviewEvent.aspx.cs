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
            string sp_name = "sp_fetchCompanies";
            DataSet ds = DataAccessLayer.fetchDataForAnyDropdownList(sp_name);
            ddl_company_names.DataSource = ds.Tables[0];
            ddl_company_names.DataValueField = "id";
            ddl_company_names.DataTextField = "company_name";
            ddl_company_names.DataBind();
            ddl_company_names.Items.Insert(0, new ListItem("--Select Company--", "0"));
        }
    }
}