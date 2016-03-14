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
    public class SscBoardsController : ApiController
    {
        [Route("api/SscBoardManager")]
        [HttpGet]
        [HttpPost]
        public IHttpActionResult BranchData()
        {
            var request = HttpContext.Current.Request;
            var settings = Properties.Settings.Default;

            using (var db = new Database(settings.DbType, settings.DbConnection))
            {
                var response = new Editor(db, "ssc_boards", "board_id")
                    .Model<SscBoardsModel>()
                    .Field(new Field("board_name")
                        .Validator(Validation.NotEmpty())
                    )
                    .Process(request)
                    .Data();
                return Json(response);
            }
        }
    }
}
