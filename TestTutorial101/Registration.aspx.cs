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
    public partial class Registration : System.Web.UI.Page
    {
        HybridDictionary _hyLogin = new HybridDictionary();
        private readonly BusLogic _bl = new BusLogic();
        HybridDictionary hybr = new HybridDictionary();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //string ss =   encryptpass("123456");

                FillNewEvent();
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
            string constr = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            SqlDataAdapter da = new SqlDataAdapter("select * from Student where Email = '" + txtEmail.Value.Trim() + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int i = ds.Tables[0].Rows.Count;
            if (txtEmail.Value.Trim() == "" || txtRegisPassword.Value.Trim() == "")
            {
                lblRegisMsg.Text = "Can not be empty!";
            }
            else
            {

                if (i <= 0)
                {

                    hybr["AutoID"] = 0;
                    hybr["Name"] = txtName.Value;
                    hybr["Address"] = "";
                    hybr["Email"] = txtEmail.Value.Trim();
                    hybr["pass"] = encryptpass(txtRegisPassword.Value.Trim());
                    hybr["Subscribe"] = "True";
                    hybr["City"] = 0;
                    hybr["CountryID"] = 1;
                    hybr["State"] = 0;
                    hybr["profilephoto"] = "";
                    hybr["LandMark"] = "";
                    hybr["Pin"] = "";
                    hybr["Mobile"] = txtmobile.Value;
                    long _mUserId = _bl.SaveRegister(hybr);
                    if (_mUserId != -2)
                    {

                        Session["UserID"] = null;
                        lblRegisMsg.Text = "Registration Successfully...";
                        lblRegisMsg.ForeColor = Color.Green;


                        Send_mails sms = new Send_mails();
                        if (sms.SendMailRegister(txtName.Value, txtEmail.Value.Trim(), Server.MapPath("~/Mail/RegistrationMail.htm")))
                        {

                            lblRegisMsg.Text = "Your Activation link has been  send at " + txtEmail.Value;
                            lblRegisMsg.ForeColor = System.Drawing.Color.Green;
                            txtEmail.Value = "";
                        }
                        txtEmail.Value = "";
                        txtName.Value = "";
                        txtRegisPassword.Value = "";
                        txtmobile.Value = "";
                        txtName.Focus();
                        return;

                        // Session["UserName"] = txtUserName.Text;
                        //Session["UserID"] = _mUserId;
                        // Response.Redirect("~/User/profile.aspx");
                    }
                    else
                    {
                        Session["UserID"] = null;
                        lblRegisMsg.Text = "EmailID already Exist";

                        return;
                    }
                }
                else
                {
                    lblRegisMsg.Text = "EmailID already Exist";
                    lblRegisMsg.ForeColor = Color.Red;

                }
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