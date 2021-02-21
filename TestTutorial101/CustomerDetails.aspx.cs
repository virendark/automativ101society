using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestTutorial101
{
    public partial class CustomerDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getAllStudent();
            }
        }
        private void getAllStudent()
        {
            DataTable dt = new DataTable();
            string ConnectionString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("Select * from tblvehicle_scrap", connection);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    gvStudents.DataSource = reader;
                    gvStudents.DataBind();
                  

                }
            }
           
        }
    }
}