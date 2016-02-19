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
        static string error;
        DataTable dt = DataAccessLayer.showAllStudent(out error);
        protected void ddl_selectMember_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            //dt = dt.Rows[1]. dt.Rows[2];
            if (ddl_selectMember.SelectedIndex != 0)
            {
                if (error == null)
                {
                    if (dt.Rows.Count > 0)
                    {
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                    else {
                        lbl_ifNoStudent.Text = " No Record Found";  
                    }
                }
                else {
                    lbl_ifNoStudent.Text = error;
                }
            }
            else {
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }

        protected void ddl_selectBranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (error == null && ddl_selectBranch.SelectedIndex !=0)
            {
                dt.DefaultView.RowFilter = "branch = '"+ddl_selectBranch.SelectedValue +"'";
                if (dt.Rows.Count > 0) {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                else {
                    lbl_ifNoStudent.Text = " No Record Found";
                }
                //DataTable newdt = dt;
                //newdt.DefaultView.RowFilter = "verified = '0'";
                ////DataView dv = new DataView(dt);
                //////DataTable newdt = dt.Rows("verified = '0'").CopyToDataTable();
                //DataRow[] dr = newdt.Select();
                //DataColumnCollection dc = dt.Columns;
                //foreach (DataColumn dcc in dc)
                //{
                //    string c = dcc.ColumnName + " ";
                //    Panel1.Controls.Add(new LiteralControl(c));
                //}
                //foreach (DataRow drr in dr)
                //{
                //    string html = drr.ItemArray.Length.ToString();
                //    Panel1.Controls.Add(new LiteralControl(html));
                //}
                ////drawTable(dr);
            }
            else {
                lbl_ifNoStudent.Text = error;
            }
        }

        protected void ddl_selectVerified_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (error == null && ddl_selectBranch.SelectedIndex != 0)
            {
                dt.DefaultView.RowFilter = "verified = " + ddl_selectVerified.SelectedValue;
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                else {
                    lbl_ifNoStudent.Text = " No Record Found";
                }
            }
            else {
                lbl_ifNoStudent.Text = error;
            }
        }
        //static int srno = 0;
        //protected void drawTable(DataRow[] dr) {
        //    foreach (DataRow drr in dr)
        //    {
        //        srno += 1;
        //        string id = drr.ItemArray[0].ToString();
        //        string name = drr.ItemArray[1].ToString() + " " + drr.ItemArray[2].ToString();
        //        string branch = drr.ItemArray[3].ToString();
        //        string gender = drr.ItemArray[4].ToString();
        //        string svvmail = drr.ItemArray[5].ToString();
        //        string verified = drr.ItemArray[6].ToString();
        //        string tr_open = "<tr>";
        //        string td1 = "<td class='mdl-data-table__cell--non-numeric'>" + srno + "</td>";
        //        string td2 = "<td class='mdl-data-table__cell--non-numeric'>" + name + "</td>";
        //        string td3 = "<td class='mdl-data-table__cell--non-numeric'>" + branch + "</td>";
        //        string td4 = "<td class='mdl-data-table__cell--non-numeric'>" + gender + "</td>";
        //        string td5 = "<td class='mdl-data-table__cell--non-numeric'>" + svvmail + "</td>";
        //        string td6 = "<td class='mdl-data-table__cell--non-numeric'>" + verified + "</td>";
        //        string td7 = "<td class='mdl-data-table__cell--non-numeric'><button name = 'delete' runat = serever id = 'delete' > Delete </ button ></td>";
        //        string tr_close = "</tr>";
        //        string html_table = tr_open + td1 + td2 + td3 + td4 + td5 + td6 + td7 + tr_close;
        //        Panel1.Controls.Add(new LiteralControl(html_table));
        //    }
        //}
    }
}