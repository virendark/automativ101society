using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestTutorial101.Admin
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminUserID"] != null)
            {
              
                lbluser.Text = Session["UserName"].ToString();
                account.Visible = true;
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }
        protected void LnkLogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Default.aspx");
        }
    }
}