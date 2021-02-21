using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestTutorial101
{
    public partial class HomeMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            String activepage = Request.RawUrl;
            if (activepage.Contains("Default.aspx"))
            {
                Default.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("VehicleScrapping.aspx"))
            {
                VehicleScrapping.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("Services.aspx"))
            {
                Services.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("Gallery.aspx"))
            {
                Gallery.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("Career.aspx"))
            {
                Career.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("ContactUs.aspx"))
            {
                ContactUs.Attributes.Add("class", "active");
            }
            else if (activepage.Contains("Login.aspx"))
            {
                Login.Attributes.Add("class", "active");
            } 
            else
            {
                Default.Attributes.Add("class", "active");
            }
            if (Session["usertype"] != null)
            {
                if (Session["usertype"].ToString() == "admin")
                {
                    LiAdmin.Visible = true;
                }
                else
                {
                    LiAdmin.Visible = false;
                }
            }
            else
            {
                LiAdmin.Visible = false;
            }

            if (Session["UserID"] != null)
            {
                Lilogin.Visible = false;
               lbluser.Text = Session["UserName"].ToString();
                account.Visible = true;
            }
            else
            {
                Lilogin.Visible = true;
                account.Visible = false;
            }
           
        }

        protected void LnkLogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
}