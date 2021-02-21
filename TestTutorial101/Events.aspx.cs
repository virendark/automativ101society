using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Collections.Specialized;

namespace TestTutorial101
{
    public partial class Events : System.Web.UI.Page
    {
        HybridDictionary _hyLogin = new HybridDictionary();
        private readonly BusLogic _bl = new BusLogic();
        HybridDictionary hybr = new HybridDictionary();
        private static int PageSize = 20;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Session["UserID"] != null)
              //  {
                    getAllEvent();
             //   }
              //  else
              //  {
                   // Response.Redirect("Login.aspx");
              //  }
            }
            
        }
        protected void GetDetail( int id)
        {

            try
            {                
                    DataTable DT = new DataTable();
                    string consString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
                    SqlConnection conn = new SqlConnection(consString);
                    SqlCommand cmd = new SqlCommand("SpNewEvent", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Flag", 2);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@CurrentID", 0);//'@CurrentID', 
                    if (conn.State == ConnectionState.Open)
                        conn.Close();
                    else
                        conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(DT);
                    if (DT.Rows.Count > 0)
                    {

                        DateTime _dateTo = DateTime.Parse(DT.Rows[0]["ToDate"].ToString());
                        DateTime _dateFrom = DateTime.Parse(DT.Rows[0]["FromDate"].ToString());
                      //  txt_InvoiceDate.Text = _date.ToString("yyyy-MM-dd");
                        txtName.Text = DT.Rows[0]["Title"].ToString();
                       // string dt1 = DT.Rows[0]["ToDate"].ToString();
                        txtToDate.Value = _dateTo.ToString("yyyy-MM-dd");                      
                        txtFromDate.Value = _dateFrom.ToString("yyyy-MM-dd");
                        txtRemarks.Text = DT.Rows[0]["Remarks"].ToString();
                      
                    }

                }
           
            catch
            {
                string scripts = "alert('Some error occur.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        private void getAllEvent()
        {
            DataTable dt = new DataTable();
            dt = _bl.GetAllField("NewEvent", "Id", "desc");
            rptrCustomer.DataSource = dt;
            rptrCustomer.DataBind();  //   gvEvents

           // gvEvents.DataSource = dt;
           // gvEvents.DataBind();
        }
    
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //int Old_Id = 0;
            string connString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
            SqlConnection conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand("SpNewEvent", conn);
            cmd.CommandType = CommandType.StoredProcedure;




            if (HddnEventID.Value != "")
            {
                cmd.Parameters.AddWithValue("@ID", int.Parse(HddnEventID.Value));
               
            }
            else
            {
                cmd.Parameters.AddWithValue("@ID", 0);
               
            }
            cmd.Parameters.AddWithValue("@Flag", 0);
            cmd.Parameters.AddWithValue("@Title", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@ToDate", Convert.ToDateTime(txtToDate.Value));
            cmd.Parameters.AddWithValue("@FromDate", Convert.ToDateTime(txtFromDate.Value));
            cmd.Parameters.AddWithValue("@Remarks", txtRemarks.Text);
            cmd.Parameters.AddWithValue("@CurrentID", 0);//'@CurrentID', 
            if (conn.State == ConnectionState.Open)
                conn.Close();
            else
                conn.Open();
            int rowsAffected = cmd.ExecuteNonQuery();
            if (rowsAffected > 0)
            {
                getAllEvent();
                txtName.Text = "";
                txtFromDate.Value = "";
                txtToDate.Value = "";
                txtRemarks.Text = "";
                HddnEventID.Value = "";
                string scripts = "alert('Submit Successfully.');"; 
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                // Response.Redirect("WebForm1.aspx");
            }
            else
            {
                string scripts = "alert('Some error occur.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlShorting_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
        protected void gvEvents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string s = e.CommandArgument.ToString();
            HddnEventID.Value = s.ToString();
            if (e.CommandName == "edit")
            {
                GetDetail(int.Parse(s.ToString()));
            }
            else if (e.CommandName == "Delete")
            {
                
            }

        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            LinkButton imgBtn = (LinkButton)sender;
            int SubCatId = Convert.ToInt32(imgBtn.CommandArgument);
            HddnEventID.Value = SubCatId.ToString();
            GetDetail(SubCatId);
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            LinkButton imgBtn = (LinkButton)sender;
            long SubCatId = Convert.ToInt32(imgBtn.CommandArgument);
            _bl.Delete("NewEvent", "Id", SubCatId);
            string scripts = "alert('Record Deleted.');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
        }

        

       
    }
}