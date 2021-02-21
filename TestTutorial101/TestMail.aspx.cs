using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace TestTutorial101
{
    public partial class TestMail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    //MailMessage mail = new MailMessage();

            //    ////set the addresses 
            //    //mail.From = new MailAddress("info@automotive101society.com"); //IMPORTANT: This must be same as your smtp authentication address.
            //    //mail.To.Add("Sonupandey991@gmail.com");

            //    ////set the content 
            //    //mail.Subject = "This is an email";
            //    //mail.Body = "This is from system.net.mail using C sharp with smtp authentication.";
            //    ////send the message 
            //    //SmtpClient smtp = new SmtpClient("mail.automotive101society.com.com");

            //    ////IMPORANT:  Your smtp login email MUST be same as your FROM address. 
            //    //NetworkCredential Credentials = new NetworkCredential("info@automotive101society.com", "Spnayyar@123");
            //    //smtp.Credentials = Credentials;
            //    //smtp.Send(mail);



            //    MailMessage Msg = new MailMessage();
            //    Msg.From = new MailAddress("info@automotive101society.com");
            //    Msg.To.Add("Sonupandey991@gmail.com");
            //    Msg.Subject = "Send Mail with HTML File";
            //    Msg.Body = "Test";
            //    SmtpClient client = new SmtpClient();
            //    client.Host = "mail.automotive101society.com";
            //    client.Port = 25;
            //    client.Credentials = new NetworkCredential("info@automotive101society.com", "Spnayyar@123");


            //    ServicePointManager.ServerCertificateValidationCallback =
            //        delegate(object s, X509Certificate certificate,
            //                 X509Chain chain, SslPolicyErrors sslPolicyErrors)
            //        { return true; };
            //    client.Send(Msg);
            //    lblMessage.Text = "Mail Sent";
            //}
            //catch
            //{
            //    lblMessage.Text = "Mail Failed";
            //}
            mail12();
        }
        private void mail12()
        {

            string name1 = "Sonu";
            string txtEmail = "info@automotive101society.com";
            string txtpass = "Spanayyar@123";
            MailMessage message = new MailMessage();
            SmtpClient smtpClient = new SmtpClient();
            string msg = string.Empty;
            try
            {
                MailAddress fromAddress = new MailAddress(txtEmail);
                message.From = fromAddress;
                message.To.Add("Sonupandey991@gmail.com");
                message.Subject = "Registration Successfully";
                message.IsBodyHtml = true;
                message.Body = " Dear " + name1 + " Your Registration Successfully ! Your Registration No- ";
                smtpClient.Host = "relay-hosting.secureserver.net";   //-- Donot change.
                smtpClient.Port = 25; //--- Donot change
                smtpClient.EnableSsl = false;//--- Donot change
                smtpClient.UseDefaultCredentials = true;
                smtpClient.Credentials = new System.Net.NetworkCredential(txtEmail, txtpass);

                smtpClient.Send(message);
                lblMessage.Text = "Mail Sent";
                //lblConfirmationMessage.Text = "Your email successfully sent.";
            }
            catch (Exception ex)
            {
                msg = ex.Message;
                lblMessage.Text = "Mail Failed";
            }
        }


    }
}