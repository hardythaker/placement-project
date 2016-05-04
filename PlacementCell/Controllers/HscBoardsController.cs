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
    public class HscBoardsController : ApiController
    {
        [Route("api/HscBoardManager")]
        [HttpGet]
        [HttpPost]
        public IHttpActionResult HscBoardData()
        {
            var request = HttpContext.Current.Request;
            var settings = Properties.Settings.Default;

            using (var db = new Database(settings.DbType, settings.DbConnection))
            {
                var response = new Editor(db, "hsc_boards", "board_id")
                    .Model<HscBoardsModel>()
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
