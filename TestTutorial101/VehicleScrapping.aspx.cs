using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestTutorial101
{
    public partial class VehicleScrapping : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string ownName = txtownername.Text;
                string phoneNo = txtmobno.Text;
                DateTime createAt = DateTime.UtcNow;
                string vehicleNo = txtvehicleno.Text;
                string registrationYear = txtregistrationyear.Text;
                string email = txtemailid.Text;
                bool isActive = true;
                if (!string.IsNullOrEmpty(phoneNo) && !string.IsNullOrEmpty(ownName))
                {
                    string ConnectionString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
                    using (SqlConnection connection = new SqlConnection(ConnectionString))
                    {
                        connection.Open();
                        string query = "insert into tblvehicle_scrap values (1, '" + ownName + "', '" + phoneNo + "', GetDate(), '" + vehicleNo + "', '" + registrationYear + "', '" + email + "')";
                        SqlCommand command = new SqlCommand(query, connection);
                        int rowsAffected = command.ExecuteNonQuery();
                        txtownername.Text = "";
                        txtmobno.Text = "";
                        txtvehicleno.Text = "";
                        txtregistrationyear.Text = "";
                        txtemailid.Text = "";
                        //SqlCommand command = new SqlCommand("Select * from tbl_mst_Customer", connection);
                        //using (SqlDataReader reader = command.ExecuteReader())
                        //{

                        //    while (reader.Read())
                        //    {

                        //      var   datarow = reader["Name"];
                        //    }
                        //        var check = reader;

                        //}
                    }
                }
            }
            catch
            {

            }
        }
    }
}