using DataTables;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PlacementCell.Models
{
    public class StudentLoginJoinDataModel : EditorModel
    {
        public class student_login : EditorModel
        {
            public string fname { get; set; }
            public string lname { get; set; }
            public int branch_id { get; set; }
            public string gender { get; set; }
            public string username { get; set; }
            public string verified { get; set; }
        }

        public class branch : EditorModel
        {
            public string branch_name { get; set; }
        }
    }
}