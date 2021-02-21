using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestTutorial101
{
    public partial class AccountActivate : System.Web.UI.Page
    {
        BusLogic bl = new BusLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ActivationCode"] != null)
            {
                string usernamequerystring = Request.QueryString["ActivationCode"].ToString();
                if (usernamequerystring != "")
                {
                    string mail = Decryptdata(usernamequerystring);
                    bl.ActivateAccount(mail);
                    //Label1.Text = "Activation Successfully...";
                    Response.Redirect("Registration.aspx");

                }
            }

        }

        public static string Decryptdata(string encryptpwd)
        {
            try
            {
                string decryptpwd = string.Empty;
                UTF8Encoding encodepwd = new UTF8Encoding();
                Decoder Decode = encodepwd.GetDecoder();
                byte[] todecode_byte = Convert.FromBase64String(encryptpwd);
                int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
                char[] decoded_char = new char[charCount];
                Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
                decryptpwd = new String(decoded_char);
                return decryptpwd;
            }
            catch (Exception ex)
            {
                return "x";
            }
        }
    }
}