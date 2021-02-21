using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Collections.Specialized;

namespace TestTutorial101.Admin
{
    public partial class View_Events : System.Web.UI.Page
    {
        HybridDictionary _hyLogin = new HybridDictionary();
        private readonly BusLogic _bl = new BusLogic();
        HybridDictionary hybr = new HybridDictionary();
        private static int PageSize = 20;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["AdminUserID"] != null)
                {
                getAllEvent();
                   }
                  else
                  {
                 Response.Redirect("~/Login.aspx");
                  }
            }

        }
  
        private void getAllEvent()
        {
            DataTable dt = new DataTable();
            dt = _bl.GetAllField("NewEvent", "Id", "desc");
            rptrCustomer.DataSource = dt;
            rptrCustomer.DataBind();  //   gvEvents

            // gvEvents.DataSource = dt;
            // gvEvents.DataBind();
        }

     
        protected void ddlShorting_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
        protected void gvEvents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string s = e.CommandArgument.ToString();
           // HddnEventID.Value = s.ToString();
            if (e.CommandName == "edit")
            {
                Session["EventID"] = s.ToString();
                Response.Redirect("Events.aspx");
            }
            else if (e.CommandName == "Delete")
            {

            }

        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            LinkButton imgBtn = (LinkButton)sender;
            int SubCatId = Convert.ToInt32(imgBtn.CommandArgument);
            Session["EventID"] = SubCatId.ToString();
            Response.Redirect("Events.aspx");
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            LinkButton imgBtn = (LinkButton)sender;
            long SubCatId = Convert.ToInt32(imgBtn.CommandArgument);
            _bl.Delete("NewEvent", "Id", SubCatId);
            string scripts = "alert('Record Deleted.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            getAllEvent();
        }




    }
}