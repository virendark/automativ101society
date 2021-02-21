using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestTutorial101
{
    public partial class Change_Password : System.Web.UI.Page
    {
        HybridDictionary _hyLogin = new HybridDictionary();
        private readonly BusLogic _bl = new BusLogic();
        HybridDictionary hybr = new HybridDictionary();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                if (!IsPostBack)
                {

                    FillNewEvent();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        private void FillNewEvent()
        {
            DataTable dt = new DataTable();
            dt = _bl.GetAllField("NewEvent", "Id", "desc");
            rptNews.DataSource = dt;
            rptNews.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["UserID"] != null)
                {
                    if (txtpass.Value != txtConfirmPass.Value)
                    {
                        lblChangePass.Text = "Password and confirm password don't match";
                    }
                    else
                    {
                        string pasword = encryptpass(txtpass.Value);
                     
                         DataTable dt2 =      _bl.GetCountPassword(encryptpass(txtOldPassword.Value));
                         int i = dt2.Rows.Count;
                       if (i > 0)
                       {
                           _bl.ChangePassword(pasword, int.Parse(Session["UserID"].ToString()));
                           lblChangePass.Text = "Password Changed Successsfully!";
                           lblChangePass.ForeColor = System.Drawing.Color.Green;
                       }
                       else
                       {
                           lblChangePass.Text = "Old Password is wrong!";
                           lblChangePass.ForeColor = System.Drawing.Color.Red;
                       }

                    }

                }
            }
            catch(Exception ex)
            {
                lblChangePass.Text = "Some Error....";
                lblChangePass.ForeColor = System.Drawing.Color.Red;

            }

        }
        public string encryptpass(string password)
        {
            string msg = "";
            byte[] encode = new byte[password.Length];
            encode = Encoding.UTF8.GetBytes(password);
            msg = Convert.ToBase64String(encode);
            return msg;
        }

    }
}