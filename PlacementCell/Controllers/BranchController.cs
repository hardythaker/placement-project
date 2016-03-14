using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using DataTables;
using PlacementCell.Models;
using System.Web;
using System.Web.Http;

namespace PlacementCell.Controllers
{
    public class BranchController : ApiController
    {
        [Route("api/BranchManager")]
        [HttpGet]
        [HttpPost]
        public IHttpActionResult BranchData()
        {
            var request = HttpContext.Current.Request;
            var settings = Properties.Settings.Default;

            using (var db = new Database(settings.DbType, settings.DbConnection))
            {
                var response = new Editor(db, "branch", "branch_id")
                    .Model<BranchModel>()
                    .Field(new Field("branch_name"))
                    .Process(request)
                    .Data();
                return Json(response);
            }
        }
    }
}
