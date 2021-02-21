using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Data;

namespace TestTutorial101
{
    public partial class ForgotPasswaord : System.Web.UI.Page
    {
        BusLogic _bl = new BusLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
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
        private string Decryptdata(string decryptPwd)
        {
            string decryptpwd = string.Empty;
            UTF8Encoding encodepwd = new UTF8Encoding();
            Decoder Decode = encodepwd.GetDecoder();
            byte[] todecode_byte = Convert.FromBase64String(decryptPwd);
            int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
            char[] decoded_char = new char[charCount];
            Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
            decryptpwd = new String(decoded_char);
            return decryptpwd;
        }
        protected void btnForget_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text.Trim() == "")
            {
                lblRegisMsg.Text = "Email ID can not be empty";
            }
            else
            {
                DataTable st = new DataTable();
                st = _bl.GetEmail(txtEmail.Text.Trim());


                if (st.Rows.Count > 0)
                {
                    string decrptpass = Decryptdata(st.Rows[0]["pass"].ToString());
                    Send_mails sms = new Send_mails();
                    if (sms.SendMailForgetPassword(txtEmail.Text, st.Rows[0]["Name"].ToString(), decrptpass, Server.MapPath("~/Mail/forget-password.htm")))
                    {

                        lblRegisMsg.Text = "your password sucessfully send at " + txtEmail.Text;
                        lblRegisMsg.ForeColor = System.Drawing.Color.Green;
                        txtEmail.Text = "";
                    }
                }
                else
                {

                    lblRegisMsg.Text = "Invaild EmailID";
                    return;
                }
            }
        }
    }
}