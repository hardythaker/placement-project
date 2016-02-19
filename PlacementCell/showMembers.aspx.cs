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
            if (IsPostBack)
            {
                //GridView1 = null;
            }
        }
        static string error;
        static DataTable dt = DataAccessLayer.showAllStudent(out error);
        DataView dv = new DataView(dt);
        protected void ddl_selectMember_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            //dt = dt.Rows[1]. dt.Rows[2];
            if (ddl_selectMember.SelectedIndex != 0)
            {
                if (error == null)
                {
                    if (dt.Rows.Count > 0)
                    {
                        GridView1.DataSource = dv;
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
            //System.Threading.Thread.Sleep(5000);

        }

        protected void ddl_selectBranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (error == null && ddl_selectBranch.SelectedIndex !=0)
            { 
                //DataView dv = new DataView(dv, "branch = '" + ddl_selectBranch.SelectedValue + "'", "branch asc", DataViewRowState.ModifiedCurrent);
                dv.RowFilter = "branch = '" + ddl_selectBranch.SelectedValue + "'";
                //dv.RowFilter = " ";
                //dt = dt.DefaultView.RowFilter = "branch = '"+ddl_selectBranch.SelectedValue +"'");
                //dt = dt.Select("branch = '" + ddl_selectBranch.SelectedValue + "'").CopyToDataTable();
                if (dv.Count > 0) {
                    GridView1.DataSource = dv;
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

        protected void ddl_selectVerified_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (error == null && ddl_selectBranch.SelectedIndex != 0)
            {
                lbl_ifNoStudent.Style["display"] = "none";
                GridView1.Visible = true;
                // DataView dv = new DataView(dt, "verified = '" + ddl_selectBranch.SelectedValue + "'"," ", DataViewRowState.ModifiedOriginal);
                dv.RowStateFilter = DataViewRowState.ModifiedCurrent;
                dv.RowFilter = "verified = " + ddl_selectVerified.SelectedValue;
                //dt.DefaultView.RowFilter = "verified = " + ddl_selectVerified.SelectedValue;
                //dt = dt.Select("verified = " + ddl_selectVerified.SelectedValue).CopyToDataTable();
                if (dv.Count > 0)
                {
                    GridView1.DataSource = dv;
                    GridView1.DataBind();
                }
                else {
                    lbl_ifNoStudent.Visible = true;
                    lbl_ifNoStudent.Text = " No Record Found";
                    //GridView1.Visible = false;
                }
            }
            else {
                lbl_ifNoStudent.Text = error;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

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