using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Data;

namespace PlacementCell
{
    /// <summary>
    /// Summary description for StudentLoginDataService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class StudentLoginDataService : System.Web.Services.WebService
    {
        [WebMethod]
        public void getStudentLoginData()
        {
            string error;
            DataTable dt = DataAccessLayer.showAllStudent(out error);
            if (error == null)
            {
                List<StudentLoginDetails> sld_List = new List<StudentLoginDetails>();
                DataTableReader dtr = new DataTableReader(dt);
                while (dtr.Read())
                {
                    StudentLoginDetails sld = new StudentLoginDetails();
                    sld.student_id = dtr["student_id"].ToString();
                    sld.fname = dtr["fname"].ToString();
                    sld.lname = dtr["lname"].ToString();
                    sld.branch = dtr["branch"].ToString();
                    sld.gender = dtr["gender"].ToString();
                    sld.username = dtr["username"].ToString();
                    sld.verified = dtr["verified"].ToString();
                    sld_List.Add(sld);
                }
                JavaScriptSerializer jss = new JavaScriptSerializer();
                Context.Response.Write(jss.Serialize(sld_List));
            }
        }
    }
}
