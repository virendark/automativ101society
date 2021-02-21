using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestTutorial101
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            Send_mails sm = new Send_mails();
            if (sm.SendMailEmail(txtName.Value, txtEmail.Value, txtMessage.Value, txtMobile.Value, "Enquiry from Site", Server.MapPath("~/Mail/mail.htm")))
            {
                lblMsg.Text = "Your Enquiry Sucessfully Submitted";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                txtEmail.Value = "";
                txtMessage.Value = "";
                txtMobile.Value = "";
                txtName.Value = "";

            }
        }
    }
}