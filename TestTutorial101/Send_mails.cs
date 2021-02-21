using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace TestTutorial101
{
    public class Send_mails
    {
        MailMessage Email = new MailMessage();
        SmtpClient mailClient = new SmtpClient();
        public Send_mails()
        {

        }

        public bool SendMailRegister(string userName, string Email, string pageurl)
        {
            try
            {
                string body = string.Empty;
                using (StreamReader reader = new StreamReader(pageurl))
                {
                    body = reader.ReadToEnd();
                }
                body = body.Replace("{UserName}", userName);
                body = body.Replace("{Email}", Email); //"<a  href='" + url + "'>Add to Cart</a>"
                string strurl = "http://localhost:52747/AccountActivate.aspx?ActivationCode=" + Encryptdata(Email) + "&P=" + Encryptdata("aa") + "&U=" + Encryptdata("1111") + "";
                //body = body.Replace("{Password}", password);
                body = body.Replace("{Url}", "<a  href='" + strurl + "'>Click for Activate</a>");
                this.SendHtmlFormattedEmail(Email, body, "Registration Detail at your domain");
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool SendMailEmail(string Name, string Email, string message, string mobile, string subjact, string pageurl)
        {
            try
            {
                string body = string.Empty;
                using (StreamReader reader = new StreamReader(pageurl))
                {
                    body = reader.ReadToEnd();
                }
                body = body.Replace("{Name}", Name);
                body = body.Replace("{Email}", Email);
                body = body.Replace("{Message}", message);
                body = body.Replace("{Mobile}", mobile);
                body = body.Replace("{SubjectHeading}", subjact);


                this.SendHtmlFormattedEmail(Email, body, subjact);
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool SendMailForgetPassword(string Email, string Name, string Password, string pageurl)
        {

            try
            {

                string body = string.Empty;
                using (StreamReader reader = new StreamReader(pageurl))
                {
                    body = reader.ReadToEnd();
                }
                body = body.Replace("{UserName}", Name);
                body = body.Replace("{email}", Email);
                body = body.Replace("{Password}", Password);
                this.SendHtmlFormattedEmail("Sonupandey991@gmail.com", body, "Forget password on picknget.com");
                // sen2(Email, body, "Forget password on picknget.com");
                return true;

            }

            catch (Exception ex)
            {
                return false;

            }

        }

        private void SendHtmlFormattedEmail(string recepientEmail, string body, string subject)
        {
            using (MailMessage mailMessage = new MailMessage())
            {
                mailMessage.From = new MailAddress(ConfigurationManager.AppSettings["UserName"]);
                mailMessage.Subject = subject;
                mailMessage.Body = body;
                mailMessage.IsBodyHtml = true;
                mailMessage.To.Add(new MailAddress(recepientEmail));
                SmtpClient smtp = new SmtpClient();
                smtp.Host = ConfigurationManager.AppSettings["Host"];
                smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                NetworkCred.UserName = ConfigurationManager.AppSettings["UserName"];
                NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);

                //            ServicePointManager.ServerCertificateValidationCallback =
                //delegate(object s, X509Certificate certificate,
                //         X509Chain chain, SslPolicyErrors sslPolicyErrors)
                //{ return true; };
                smtp.Send(mailMessage);
            }

        }
        public static string Encrypt(string toEncrypt)
        {
            byte[] keyArray;
            bool useHashing = true;
            byte[] toEncryptArray = UTF8Encoding.UTF8.GetBytes(toEncrypt);

            System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
            // Get the key from config file

            string key = (string)settingsReader.GetValue("SecurityKey", typeof(String));

            //System.Windows.Forms.MessageBox.Show(key);
            //If hashing use get hashcode regards to your key
            if (useHashing)
            {
                MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
                keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
                //Always release the resources and flush data
                // of the Cryptographic service provide. Best Practice

                hashmd5.Clear();
            }
            else
                keyArray = UTF8Encoding.UTF8.GetBytes(key);

            TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
            //set the secret key for the tripleDES algorithm
            tdes.Key = keyArray;
            //mode of operation. there are other 4 modes.
            //We choose ECB(Electronic code Book)
            tdes.Mode = CipherMode.ECB;
            //padding mode(if any extra byte added)

            tdes.Padding = PaddingMode.PKCS7;

            ICryptoTransform cTransform = tdes.CreateEncryptor();
            //transform the specified region of bytes array to resultArray
            byte[] resultArray =
              cTransform.TransformFinalBlock(toEncryptArray, 0,
              toEncryptArray.Length);
            //Release resources held by TripleDes Encryptor
            tdes.Clear();
            //Return the encrypted data into unreadable string format
            return Convert.ToBase64String(resultArray, 0, resultArray.Length);
        }
        public static string Decrypt(string cipherString)
        {
            bool useHashing = true;
            byte[] keyArray;
            //get the byte code of the string

            byte[] toEncryptArray = Convert.FromBase64String(cipherString);

            System.Configuration.AppSettingsReader settingsReader =
                                                new AppSettingsReader();
            //Get your key from config file to open the lock!
            string key = (string)settingsReader.GetValue("SecurityKey",
                                                         typeof(String));

            if (useHashing)
            {
                //if hashing was used get the hash code with regards to your key
                MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
                keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
                //release any resource held by the MD5CryptoServiceProvider

                hashmd5.Clear();
            }
            else
            {
                //if hashing was not implemented get the byte code of the key
                keyArray = UTF8Encoding.UTF8.GetBytes(key);
            }

            TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
            //set the secret key for the tripleDES algorithm
            tdes.Key = keyArray;
            //mode of operation. there are other 4 modes. 
            //We choose ECB(Electronic code Book)

            tdes.Mode = CipherMode.ECB;
            //padding mode(if any extra byte added)
            tdes.Padding = PaddingMode.PKCS7;

            ICryptoTransform cTransform = tdes.CreateDecryptor();
            byte[] resultArray = cTransform.TransformFinalBlock(
                                 toEncryptArray, 0, toEncryptArray.Length);
            //Release resources held by TripleDes Encryptor                
            tdes.Clear();
            //return the Clear decrypted TEXT
            return UTF8Encoding.UTF8.GetString(resultArray);
        }
        public static string Encryptdata(string password)
        {
            try
            {
                string strmsg = string.Empty;
                byte[] encode = new byte[password.Length];
                encode = Encoding.UTF8.GetBytes(password);
                strmsg = Convert.ToBase64String(encode);
                return strmsg;
            }
            catch (Exception ex)
            {
                return "x";
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