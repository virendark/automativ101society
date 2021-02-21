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
    public partial class Login : System.Web.UI.Page
    {

        HybridDictionary _hyLogin = new HybridDictionary();
        private readonly BusLogic _bl = new BusLogic();
        HybridDictionary hybr = new HybridDictionary();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            FillNewEvent();
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
        public string encryptpass(string password)
        {
            string msg = "";
            byte[] encode = new byte[password.Length];
            encode = Encoding.UTF8.GetBytes(password);
            msg = Convert.ToBase64String(encode);
            return msg;
        }
        long _mUserId;
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if (txtUserName.Value.Trim() == "" || txtPassword.Value.Trim() == "")
            {
                lblLoginMg.Text = "Kindly fill all fields.";
            }
            else
            {
               
                //_hyLogin["AdminLoginName"] = txtUserName.Value.Trim();
                //_hyLogin["AdminPassword"] = encryptpass(txtPassword.Value);
                //_mUserId = _bl.VerifyUser(_hyLogin);
                //    if (_mUserId != -1)
                //    {
                //                DataTable st = new DataTable();
                //                st = _bl.GetEmail(txtUserName.Value.Trim());


                //                Session["UserName"] = st.Rows[0]["Name"].ToString();
                //                Session["UserID"] = st.Rows[0]["AutoID"].ToString();
                //                Session["usertype"] = st.Rows[0]["Registertype"].ToString();
                //                string admin = st.Rows[0]["Registertype"].ToString();
                //        if(admin == "admin")
                //        {
                //             Session["AdminUserID"] = st.Rows[0]["AutoID"].ToString();
                //        }
                //                Response.Redirect("Default.aspx");
                //    }
                //    else
                //    {
                //        Session["UserID"] = null;
                //        lblLoginMg.Text = "Invaild EmailID Or password";
                //        lblLoginMg.ForeColor = System.Drawing.Color.Red;
                //        return;
                //    }
                try
                {
                    
                        string ConnectionString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
                    using (SqlConnection connection = new SqlConnection(ConnectionString))
                    {
                        connection.Open();
                        string query = "Select * from tblLogin where userid='" + txtUserName.Value + "' and password='" + txtPassword.Value + "'";
                        SqlCommand command = new SqlCommand(query, connection);
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                Response.Redirect("~/CustomerDetails.aspx");
                            }
                            else
                            {
                                lblLoginMg.Text = "Wrong UserId and Password.";
                            }

                        }
                    }
                    
                }
                catch(Exception ex)
                {
                    var message = ex.Message;
                }

                
                  }
                
                }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPasswaord.aspx");
        }
            
        
    }
}