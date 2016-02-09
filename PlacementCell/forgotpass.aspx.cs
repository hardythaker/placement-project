using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlacementCell
{
    public partial class forgotpass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_forgotPass_Click(object sender, EventArgs e)
        {
            string error;
            if (DataAccessLayer.isEmailIDExist(tb_forgotEmailID.Text, out error))
            {
                //lbl_forgotPassStatus.Text = tb_forgotEmailID.Text;
                if (error != null)
                {
                    lbl_forgotPassStatus.Text = error;
                }
                else
                {
                    string uid = HashGenerator.getUniqueID();
                    lbl_forgotPassStatus.Text = uid;
                }
            }
            else
            {
                lbl_forgotPassStatus.Text = "No Such User Found";
            //    string uid = HashGenerator.getUniqueID();
            //    lbl_forgotPassStatus.Text = uid;
            }
            //lbl_forgotPassStatus.Text = tb_forgotEmailID.Text;
        }
    }
}