using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;
using System.Web.Script.Serialization;
using System.Configuration;
using System.Web.Services;
using System.Collections;

namespace TestTutorial101.Admin
{
    public partial class View_Jobs : System.Web.UI.Page
    {
        HybridDictionary _hyLogin = new HybridDictionary();
        private readonly BusLogic _bl = new BusLogic();
        HybridDictionary hybr = new HybridDictionary();
        private static int PageSize = 20;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                if (Session["AdminUserID"] != null)
                {
                    getAllStudent();
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }

        private void getAllStudent()
        {
            DataTable dt = new DataTable();
            dt = _bl.GetAllField("Job_Details", "AutoID", "desc");
            gvJobs.DataSource = dt;
            gvJobs.DataBind();
        }



        //[System.Web.Services.WebMethod]
        //public static string DeleteMethod(string id, string brchid, string compid)
        //{
        //    try
        //    {
        //        int ID = int.Parse(id);
        //        string consString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        //        SqlConnection conn = new SqlConnection(consString);
        //        SqlCommand cmd = new SqlCommand("GetSaleInvoice", conn);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@AutoID", id);
        //        cmd.Parameters.AddWithValue("@Flag", 11);
        //        cmd.Parameters.AddWithValue("@CompanyID", compid);
        //        cmd.Parameters.AddWithValue("@BranchID", brchid);
        //        cmd.Parameters.Add("@RecordCount", 10);
        //        if (conn.State == ConnectionState.Open)
        //            conn.Close();
        //        else
        //            conn.Open();
        //        cmd.ExecuteNonQuery();
        //        conn.Close();
        //    }
        //    catch
        //    {

        //    }
        //    return id;
        //}
        protected void ddlShorting_SelectedIndexChanged(object sender, EventArgs e)
        {
            // int i = int.Parse(ddlShorting.SelectedValue.ToString());



            // BindDummyRow();
            //  if (ddlType.SelectedValue == "0")
            //  {
            //    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "GetCustomers(''," + PageSize + "," + ddlMonth.SelectedValue + "," + ddlyear.SelectedValue + ")", true);

            // }
            //else
            //{
            //    string fdate = "2017-02-02";
            //    string tdate = "2017-06-02";
            //   // GetCustomer2("",parseInt($(this).attr('page')),brchid,compid,fdate,tdate);
            //    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "GetCustomer2(''," + PageSize + "," + Session["BranchID"].ToString() + "," + Session["BranchID"].ToString() + "," + fdate + "," + tdate + ")", true);

            //}
        }




        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvJobs_RowCommand(object sender, GridViewCommandEventArgs e)
        {


            string s = e.CommandArgument.ToString();
            if (e.CommandName == "edit")
            {

                Session["JobID"] = s.ToString();
                Response.Redirect("Jobs-Details.aspx");

            }
            else if (e.CommandName == "Delete")
            {
                try
                {
                    string connString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
                    SqlConnection conn = new SqlConnection(connString);
                    SqlCommand cmd = new SqlCommand("Sp_JobsDetails", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Flag", 2);
                    cmd.Parameters.AddWithValue("@AutoID", int.Parse(s));
                    if (conn.State == ConnectionState.Open)
                        conn.Close();
                    else
                        conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                }
                catch
                {

                }
            }
        }

        protected void gvJobs_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvJobs_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            getAllStudent();
        }


    }
}