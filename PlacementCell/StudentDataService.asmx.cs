using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace PlacementCell
{
    /// <summary>
    /// Summary description for getStudentDataService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class StudentDataService : System.Web.Services.WebService
    {

        [WebMethod]
        public void getStudentData()
        {
            DataTable dt = DataAccessLayer.getAllStudentData();
            List<StudentDetails> sd_List = new List<StudentDetails>();
            DataTableReader dtr = new DataTableReader(dt);
            while (dtr.Read())
            {
                StudentDetails sd = new StudentDetails();
                sd.fname = dtr[0].ToString()+" "+dtr[1].ToString();
                sd.mname = dtr[2].ToString();
                sd.lname = dtr[3].ToString();
                sd.email = dtr[4].ToString();
                sd.gender = dtr[5].ToString();
                sd.maritial = dtr[6].ToString();
                sd.mobile = dtr[7].ToString();
                sd.dob = dtr[8].ToString();

                sd.branch = dtr[9].ToString();
                sd.division = dtr[10].ToString();
                sd.rollno = dtr[11].ToString();
                sd.backlogs = dtr[12].ToString();
                sd.totalAvg = dtr[13].ToString();

                sd.hsc_board_name = dtr[14].ToString();
                sd.hsc_specialization = dtr[15].ToString();
                sd.hsc_courseType = dtr[16].ToString();
                sd.hsc_percentage = dtr[17].ToString();

                sd.ssc_board_name = dtr[18].ToString();
                sd.ssc_courseType = dtr[19].ToString();
                sd.ssc_percentage = dtr[20].ToString();

                sd.break_years = dtr[21].ToString().ToString();

                sd_List.Add(sd);
            }
            JavaScriptSerializer jss = new JavaScriptSerializer();
            Context.Response.Write(jss.Serialize(sd_List));
        }
    }
}
