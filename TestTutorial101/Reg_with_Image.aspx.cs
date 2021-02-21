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
using System.IO;
using System.Drawing;

namespace TestTutorial101
{
    public partial class Reg_with_Image : System.Web.UI.Page
    {
        HybridDictionary _hyLogin = new HybridDictionary();
        private readonly BusLogic _bl = new BusLogic();
        HybridDictionary hybr = new HybridDictionary();
        DataTable DT = new DataTable();
        DataTable DT1 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                State();
                Signatory();
            }
        }
        string complexFileNm;
        int Fsize;
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            string connString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
            try
            {
                lblLoginMg.Text = "";

                DataTable st1 = new DataTable();
                // st1 = _bl.Send_mails(Session["CompanyID"].ToString(), Session["BranchID"].ToString());
                int EmailCount = Convert.ToInt16(st1.Rows[0]["Count"].ToString());
                if (EmailCount > 5)
                {

                    lblLoginMg.Text = "Signatory already exists.";
                }
                else
                {

                    string fullName = txtFistNm.Text + " " + txtMdlnm.Text + " " + txtLstNm.Text;

                    SqlConnection conn = new SqlConnection(connString);
                    SqlCommand cmd = new SqlCommand("InsertSignatory", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Flag", 1);
                    cmd.Parameters.AddWithValue("@CompanyID", Session["CompanyID"].ToString());
                    cmd.Parameters.AddWithValue("@BranchID", Session["BranchID"].ToString());
                    cmd.Parameters.AddWithValue("@Name", fullName);
                    cmd.Parameters.AddWithValue("@FirstName", txtFistNm.Text);
                    cmd.Parameters.AddWithValue("@MiddleName", txtMdlnm.Text);
                    cmd.Parameters.AddWithValue("@LastName", txtLstNm.Text);
                    cmd.Parameters.AddWithValue("@FatherFstName", txtFatherFN.Text);
                    cmd.Parameters.AddWithValue("@FatherMdlName", txtFatherMN.Text);
                    cmd.Parameters.AddWithValue("@FatherLstName", txtFatherLM.Text);
                    cmd.Parameters.AddWithValue("@DateOfBirth", txtDateofBirth.Text);
                    cmd.Parameters.AddWithValue("@Gender", RBLGender.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@PanNumber", RBLGender.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@RoadLaneMark", txtRoad.Text);
                    cmd.Parameters.AddWithValue("@FlatBlockNo", txtFlatBlok.Text);
                    cmd.Parameters.AddWithValue("@premises_Building", txtBuildingVill.Text);
                    cmd.Parameters.AddWithValue("@Address", txtFlatBlok.Text);
                    cmd.Parameters.AddWithValue("@Country", "1");
                    cmd.Parameters.AddWithValue("@State", ddlState.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@City", ddlCity.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@District", txtDistrict.Text.Trim());
                    cmd.Parameters.AddWithValue("@ZipCode", txtZip.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                    cmd.Parameters.AddWithValue("@DeptID", "");
                    cmd.Parameters.AddWithValue("@DesgID", ddlDesign.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@FileName", "");
                    cmd.Parameters.AddWithValue("@SystemFileName", "");
                    cmd.Parameters.AddWithValue("@FileSize", "");
                    cmd.Parameters.AddWithValue("@CreatedBy", Session["UserID"].ToString());

                    if (conn.State == ConnectionState.Open)
                        conn.Close();
                    else
                        conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {

                        lblLoginMg.Text = "User Create Successfully.";
                        lblLoginMg.ForeColor = Color.Green;
                        Clear();
                        Signatory();
                    }
                    else
                    {
                        lblLoginMg.Text = "Some error occur.";
                    }
                }
            }
            catch (Exception ex)
            {
                //log error 
                //display friendly error to user
            }
            finally
            {

            }
            ////if (FileUpload1.HasFiles)
            ////{
            //    HttpPostedFile file = FileUpload1.PostedFile;
            //    string filePath = FileUpload1.PostedFile.FileName;
            //    string filename = Path.GetFileName(filePath);

            //     string ext = Path.GetExtension(filename);
            //     string contenttype = String.Empty;
            //     switch (ext)
            //     {
            //         case ".png":
            //             contenttype = "application/vnd.ms-PNG";
            //             break;
            //     }
            //     Fsize = file.ContentLength / 1024;
            //     if (Fsize > 10)
            //     {
            //         lblLoginMg.Text = "Your file length is greater then 150 KB";
            //         lblLoginMg.ForeColor = System.Drawing.Color.Red;
            //     }
            //     else
            //     {

            //         if (contenttype != String.Empty)
            //         {
            //             string fileNm = filename.Substring(0, filename.Length - 4);
            //             string ss = DateTime.Now.Hour.ToString() + "" + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString();
            //             complexFileNm = fileNm + ss;
            //             string csvPath = Server.MapPath("~/Upload Images/") + complexFileNm + ext;


            //         }
            //         else
            //         {
            //             lblLoginMg.Text = "Please Select .png File.";
            //             lblLoginMg.ForeColor = Color.Red;
            //         }
            //     }
            // }
            // else
            // {
            //     lblLoginMg.Text = "Please Select Your Signature Image.";
            //     lblLoginMg.ForeColor = Color.Red;
            // }
        }
        protected void Clear()
        {
            try
            {
                txtDistrict.Text = ""; txtEmail.Text = ""; txtMobile.Text = ""; txtZip.Text = "";


                State();
                City();
            }
            catch
            {
            }
        }
        [WebMethod]
        protected void Signatory()
        {
            try
            {
                string consString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
                SqlConnection conn = new SqlConnection(consString);
                SqlCommand cmd = new SqlCommand("InsertSignatory", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Flag", 2);
                cmd.Parameters.AddWithValue("@CompanyID", Session["CompanyID"].ToString());
                cmd.Parameters.AddWithValue("@BranchID", Session["BranchID"].ToString());
                if (conn.State == ConnectionState.Open)
                    conn.Close();
                else
                    conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                //  rptrCustomer.DataSource = ds;
                // rptrCustomer.DataBind();
            }
            catch
            {
            }
        }

        [WebMethod]
        protected void State()
        {
            try
            {
                string consString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
                SqlConnection conn = new SqlConnection(consString);
                SqlCommand cmd = new SqlCommand("InsertClient", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Flag", 3);
                cmd.Parameters.AddWithValue("@Country", "1");
                if (conn.State == ConnectionState.Open)
                    conn.Close();
                else
                    conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(DT1);
                ddlState.DataTextField = DT1.Columns["StateName"].ColumnName;
                ddlState.DataValueField = DT1.Columns["StateID"].ColumnName;
                ddlState.DataSource = DT1;
                ddlState.DataBind();
                ddlState.Items.Insert(0, new ListItem("Select State", "-1"));
                //ddlCity.Items.Insert(0, new ListItem("Select City", "-1"));
            }
            catch
            {
            }
        }
        [WebMethod]
        protected void City()
        {
            try
            {
                string consString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
                SqlConnection conn = new SqlConnection(consString);
                SqlCommand cmd = new SqlCommand("InsertClient", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Flag", 4);
                cmd.Parameters.AddWithValue("@Country", "1");
                cmd.Parameters.AddWithValue("@State", ddlState.SelectedValue.ToString());
                if (conn.State == ConnectionState.Open)
                    conn.Close();
                else
                    conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(DT);
                ddlCity.DataTextField = DT.Columns["CityName"].ColumnName;
                ddlCity.DataValueField = DT.Columns["CityID"].ColumnName;
                ddlCity.DataSource = DT;
                ddlCity.DataBind();
                ddlCity.Items.Insert(0, new ListItem("Select City", "-1"));
            }
            catch
            {
            }
        }
        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            City();
        }
    }
}