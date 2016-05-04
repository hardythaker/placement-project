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
    public class CompanyController : ApiController
    {
        [Route("api/CompanyManager")]
        [HttpGet]
        [HttpPost]
        public IHttpActionResult CompanyData()
        {
            var request = HttpContext.Current.Request;
            var settings = Properties.Settings.Default;

            using (var db = new Database(settings.DbType, settings.DbConnection))
            {
                var response = new Editor(db, "companies", "id")
                    .Model<CompanyModel>()
                    .Field(new Field("company_name")
                        .Validator(Validation.NotEmpty())
                    )
                    .Process(request)
                    .Data();
                return Json(response);
            }
        }
    }
}
