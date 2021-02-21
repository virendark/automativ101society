using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace TestTutorial101
{
    public partial class Career : System.Web.UI.Page
    {
        HybridDictionary _hyLogin = new HybridDictionary();
        private readonly BusLogic _bl = new BusLogic();
        HybridDictionary hybr = new HybridDictionary();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    filldata();
                    filldata1();
                    FillNewEvent();
                }
                catch
                {

                }
            }
        }

        private void FillNewEvent()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = _bl.GetAllField("NewEvent", "Id", "desc");
                rptNews.DataSource = dt;
                rptNews.DataBind();
            }
            catch
            {

            }
        }
        private void filldata()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = _bl.GetAllField("Job_Details", "AutoID", "desc");
                rptrNewEvent.DataSource = dt;
                rptrNewEvent.DataBind();
            }
            catch
            {

            }
            // Classes.ClsDynamic.FillGridView(GridView2, dt);
        }
        private void filldata1()
        {
            DataTable dt = new DataTable();
            dt = _bl.GetAllField("NewEvent", "Id", "desc");
            //rptNews.DataSource = dt;
           // rptNews.DataBind();

            // Classes.ClsDynamic.FillGridView(GridView2, dt);
        }
        protected void btnApply_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                LinkButton imgBtn = (LinkButton)sender;
                long SubCatId = Convert.ToInt32(imgBtn.CommandArgument);

                filldata();
                Session["Apply"] = SubCatId.ToString();
                Response.Redirect("Student-Details.aspx");
                //Send_mails sm = new Send_mails();
                //if (sm.SendMailEmail(txtName.Value, txtEmail.Value, txtMessage.Value, txtMobile.Value, "Enquiry from Site", Server.MapPath("~/Mail/mail.htm")))
                //{
                //    lblMsg.Text = "Your Enquiry Sucessfully Submitted";
                //    lblMsg.ForeColor = System.Drawing.Color.Green;


                //}

            }
        }
    }
}