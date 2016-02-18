using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class showMembers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack) {
            //    GridView1.DataBind();
            //}
        }

        protected void ddl_selectMember_SelectedIndexChanged(object sender, EventArgs e)
        {
            //lbl_ifNoStudent.Text = "changed";
            string error;
            DataTable dt = DataAccessLayer.showAllStudent(out error);
            DataView dv = new DataView(dt);
            if (error == null)
            {
                int srno = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    srno += 1;
                    string id = dr.ItemArray[0].ToString();
                    string name = dr.ItemArray[1].ToString() + " " + dr.ItemArray[2].ToString();
                    string branch = dr.ItemArray[3].ToString();
                    string gender = dr.ItemArray[4].ToString();
                    string svvmail = dr.ItemArray[5].ToString();
                    string verified = dr.ItemArray[6].ToString();
                    string tr_open = "<tr>";
                    string td1 = "<td class='mdl-data-table__cell--non-numeric'>" + srno + "</td>";
                    string td2 = "<td class='mdl-data-table__cell--non-numeric'>" + name + "</td>";
                    string td3 = "<td class='mdl-data-table__cell--non-numeric'>" + branch + "</td>";
                    string td4 = "<td class='mdl-data-table__cell--non-numeric'>" + gender + "</td>";
                    string td5 = "<td class='mdl-data-table__cell--non-numeric'>" + svvmail + "</td>";
                    string td6 = "<td class='mdl-data-table__cell--non-numeric'>" + verified + "</td>";
                    string td7 = "<td class='mdl-data-table__cell--non-numeric'><button name = 'delete' runat = serever id = 'delete' > Delete </ button ></td>";
                    string tr_close = "</tr>";
                    //string html_table_row_td8 = "<td class='mdl-data-table__cell--non-numeric'>" + verified + "</td>";
                    //string row = id + " " + name + " " + branch + " " + gender + " " + svvmail + " " + verified +" "+ "<br/>";
                    string html_table = tr_open + td1 + td2 + td3 + td4 + td5 + td6 + td7 + tr_close;
                    Panel1.Controls.Add(new LiteralControl(html_table));
                }
            }
            else {
                lbl_ifNoStudent.Text = error;
            }
            //if (dt.Rows.Count > 0)
            //{
            //    GridView1.DataSource = dt.Rows;
            //    GridView1.DataBind();
            //    //foreach (DataRow dr in dt.Rows) {
            //    //    GridView1.Rows = dr;
            //    //}
            //}
            //else {
            //    lbl_ifNoStudent.Text = "No Student is There";
            //}
            //lbl_ifNoStudent.Text = error;
        }
    }
}