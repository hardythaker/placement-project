using DataTables;
using PlacementCell.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace PlacementCell.Controllers
{
    public class StudentLoginDataController : ApiController
    {
        [Route("api/StudentLoginDataModel")]
        [HttpGet]
        [HttpPost]
        public IHttpActionResult StudentLoginData()
        {
            var request = HttpContext.Current.Request;
            var settings = Properties.Settings.Default;

            using (var db = new Database(settings.DbType, settings.DbConnection))
            {
                var response = new Editor(db, "student_login", "student_id")
                    .Model<StudentLoginJoinDataModel>()
                    //.Field(new Field("student_login.fname"))
                    //.Field(new Field("student_login.lname"))
                    //.Field(new Field("student_login.branch_id"))
                    //.Field(new Field("student_login.gender"))
                    //.Field(new Field("student_login.username"))
                    .Field(new Field("student_login.verified"))
                    .Field(new Field("branch.branch_name"))
                    .LeftJoin("branch", "branch.branch_id", "=", "student_login.branch_id")
                    .Process(request)
                    .Data();
                return Json(response);
            }
        }
    }
}
