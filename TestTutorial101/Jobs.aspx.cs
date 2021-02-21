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

namespace TestTutorial101
{
    public partial class Jobs : System.Web.UI.Page
    {
        string fn="";
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserID"] = 1;

            if (!IsPostBack)
            {
                GetState();
                GetDetail();

               
            }
        }
        [WebMethod]
        protected void GetState()
        {
            try
            {
                DataTable DT = new DataTable();
                string consString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
                SqlConnection conn = new SqlConnection(consString);
                SqlCommand cmd = new SqlCommand("GetStudentDetail", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Flag", 2);   //@
                cmd.Parameters.AddWithValue("@ID", 0);
                cmd.Parameters.AddWithValue("@CustID", 0);
                if (conn.State == ConnectionState.Open)
                    conn.Close();
                else
                    conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(DT);
                if (DT.Rows.Count > 0)
                {
                    ddlState.DataTextField = DT.Columns["StateName"].ColumnName;
                    ddlState.DataValueField = DT.Columns["StateID"].ColumnName;
                    ddlState.DataSource = DT;
                    ddlState.DataBind();
                    ddlState.Items.Insert(0, new ListItem("Select State", "-1"));
                    ddlCity.Items.Insert(0, new ListItem("Select District", "-1"));
                }
                else
                {
                    ddlState.DataTextField = DT.Columns["StateName"].ColumnName;
                    ddlState.DataValueField = DT.Columns["StateID"].ColumnName;
                    ddlState.DataSource = DT;
                    ddlState.DataBind();
                    ddlState.Items.Insert(0, new ListItem("Select State", "-1"));
                    ddlCity.Items.Insert(0, new ListItem("Select District", "-1"));
                }
            }
            catch
            {
                // string scripts = "alert('Some error occur.');";
                //  ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        [WebMethod]
        protected void GetCity()
        {
            try
            {
                DataTable DT = new DataTable();
                string consString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
                SqlConnection conn = new SqlConnection(consString);
                SqlCommand cmd = new SqlCommand("GetStudentDetail", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Flag", 3);
                cmd.Parameters.AddWithValue("@ID", 0);
                cmd.Parameters.AddWithValue("@CustID", 0);
                cmd.Parameters.AddWithValue("@StateName", Convert.ToInt16(ddlState.SelectedValue.ToString()));
                if (conn.State == ConnectionState.Open)
                    conn.Close();
                else
                    conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(DT);
                if (DT.Rows.Count > 0)
                {
                    ddlCity.DataTextField = DT.Columns["CityName"].ColumnName;
                    ddlCity.DataValueField = DT.Columns["CityID"].ColumnName;
                    ddlCity.DataSource = DT;
                    ddlCity.DataBind();
                    ddlCity.Items.Insert(0, new ListItem("Select District", "-1"));
                }
                else
                {
                    ddlCity.DataTextField = DT.Columns["CityName"].ColumnName;
                    ddlCity.DataValueField = DT.Columns["CityID"].ColumnName;
                    ddlCity.DataSource = DT;
                    ddlCity.DataBind();
                    ddlCity.Items.Insert(0, new ListItem("Select District", "-1"));
                }
            }
            catch
            {
                string scripts = "alert('Some error occur.');";
               
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetCity();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlState.SelectedValue != "-1")
                {
                   
                    string connString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
                    SqlConnection conn = new SqlConnection(connString);
                    SqlCommand cmd = new SqlCommand("Sp_JobsDetails", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Flag", 1);
                    cmd.Parameters.AddWithValue("@JobTitle",txtJobTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@jobDesc", txtJobDesc.Text.Trim());
                    cmd.Parameters.AddWithValue("@CompnayName" , txtCompantName.Text.Trim());
                    cmd.Parameters.AddWithValue("@CompanyDesc", txtcompnyDesc.Text.Trim());
                    cmd.Parameters.AddWithValue("@CompanyAddress", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@CompanyState", ddlState.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@CompanyCity", ddlCity.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pincode",Convert.ToInt32(txtZip.Text));
                    cmd.Parameters.AddWithValue("@InterViewFromDate", Convert.ToDateTime(txtDateFrom.Text));
                    cmd.Parameters.AddWithValue("@InterVewToDate", Convert.ToDateTime(txtInterviewDateTo.Text));
                    cmd.Parameters.AddWithValue("@NumberOfvacancy", Convert.ToInt32( txtNoVacancy.Text.Trim()));
                    cmd.Parameters.AddWithValue("@HRName", txtHrName.Text);
                    cmd.Parameters.AddWithValue("@HRContactNo", txtMobile.Text);
                    cmd.Parameters.AddWithValue("@TotalExperience", Convert.ToInt32( txtTotalExperiance.Text.Trim()));
                    cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text.Trim());
                    cmd.Parameters.AddWithValue("@SpecialCourse", txtSpecialCourse.Text.Trim());
                    cmd.Parameters.AddWithValue("@OtherQualification", txtOtherQualification.Text);
                    cmd.Parameters.AddWithValue("@ConditionOne", txtOtherCondition1.Text);     
                    cmd.Parameters.AddWithValue("@Conditiontwo", txtOtherCondition2.Text);
                    GeneralImageClick();
                    cmd.Parameters.AddWithValue("@FileUrl", "~/Upload/" + fn);
                    cmd.Parameters.AddWithValue("@FileNames", fn);
                    cmd.Parameters.AddWithValue("@Remarks", txtRemarks.Text);
                    cmd.Parameters.AddWithValue("@CreateBy", 1);

                    if (Session["JobID"] == null)
                    {
                        cmd.Parameters.AddWithValue("@AutoID", 0);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@AutoID",int.Parse(Session["JobID"].ToString()) );
                    }
                    if (conn.State == ConnectionState.Open)
                        conn.Close();
                    else
                        conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {

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
                else
                {
                    string scripts = "alert('Kindly select State.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                }
            }
            catch (Exception ex)
            {
                string scripts = "alert('Some error occurs.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }

        public void GeneralImageClick()
        {
            if (FileUpload1.HasFile)
            {
                fn = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string ext = Path.GetExtension(fn);
                if (ext == ".jpg" || ext == ".png" || ext == ".jpeg" || ext == ".JPG")
                //|| ext == ".gif" || ext == ".doc" || ext == ".docx")
                {
                    string randomno = DateTime.Now.Ticks.ToString().Substring(5);
                    randomno = randomno.Remove(0, 5);
                    fn = randomno + "_" + fn;
                    string targetPath = Server.MapPath("~/Upload/" + fn);
                    Stream strm = FileUpload1.PostedFile.InputStream;
                    var targetFile = targetPath;
                    //Based on scalefactor image size will vary
                    GenerateThumbnails(0.5, strm, targetFile);
                    string imageupload = "~/Upload/" + fn;
                    FileUpload1.SaveAs(Server.MapPath(imageupload));
                    //img1.ImageUrl = "~/Upload/ProductImage/" + fn;
                    //img1.Visible = true;

                }
                else if (ext == ".doc" || ext == ".docx")
                {
                    string randomno = DateTime.Now.Ticks.ToString().Substring(5);
                    randomno = randomno.Remove(0, 5);
                    fn = randomno + "_" + fn;
                    string imageupload = "~/Upload/" + fn;
                    FileUpload1.SaveAs(Server.MapPath(imageupload));
                }
                else ScriptManager.RegisterStartupScript(this.Page, typeof(string), "Alert", "alert('Invalid File selected');", true);

            }
        }
        private void GenerateThumbnails(double scaleFactor, Stream sourcePath, string targetPath)
        {
            using (var image = System.Drawing.Image.FromStream(sourcePath))
            {
                //var newWidth = (int)(image.Width * scaleFactor);
                //var newHeight = (int)(image.Height * scaleFactor);
                var newWidth = 234;
                var newHeight = 350;
                var thumbnailImg = new Bitmap(newWidth, newHeight);
                var thumbGraph = Graphics.FromImage(thumbnailImg);
                thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
                thumbGraph.DrawImage(image, imageRectangle);
                thumbnailImg.Save(targetPath, image.RawFormat);
            }
        }
        protected void GetDetail()
        {
            try
            {
               if (Session["UserID"] != null)
               {
                    DataTable DT = new DataTable();
                    string consString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
                    SqlConnection conn = new SqlConnection(consString);
                    SqlCommand cmd = new SqlCommand("Sp_JobsDetails", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Flag", 0);
                    cmd.Parameters.AddWithValue("@AutoID", int.Parse(Session["JobID"].ToString()));
                        if (conn.State == ConnectionState.Open)
                        conn.Close();
                    else
                        conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(DT);
                    if (DT.Rows.Count > 0)
                    {
                            txtJobTitle.Text=   DT.Rows[0]["JobTitle"].ToString();
                            txtJobDesc.Text=   DT.Rows[0]["jobDesc"].ToString();
                          txtCompantName.Text=   DT.Rows[0]["CompnayName"].ToString();
                          txtcompnyDesc.Text=   DT.Rows[0]["CompanyDesc"].ToString();
                          txtAddress.Text=   DT.Rows[0]["CompanyAddress"].ToString(); 
                                GetState();
                            ddlState.SelectedValue =   DT.Rows[0]["CompanyState"].ToString();
                             GetCity();
                         ddlCity.SelectedValue =   DT.Rows[0]["CompanyCity"].ToString();
                         txtZip.Text=   DT.Rows[0]["pincode"].ToString();
                         DateTime _dateTo = DateTime.Parse(DT.Rows[0]["InterVewToDate"].ToString());
                         DateTime _dateFrom = DateTime.Parse(DT.Rows[0]["InterViewFromDate"].ToString());
                         txtDateFrom.Text = _dateFrom.ToString("yyyy-MM-dd");
                          txtInterviewDateTo.Text = _dateTo.ToString("yyyy-MM-dd");  
                          txtNoVacancy.Text=   DT.Rows[0]["NumberOfvacancy"].ToString();
                          txtHrName.Text=   DT.Rows[0]["HRName"].ToString();
                          txtMobile.Text=   DT.Rows[0]["HRContactNo"].ToString();
                          txtTotalExperiance.Text=   DT.Rows[0]["TotalExperience"].ToString();
                          txtQualification.Text=   DT.Rows[0]["Qualification"].ToString();
                          txtSpecialCourse.Text=   DT.Rows[0]["SpecialCourse"].ToString();
                          txtOtherQualification.Text=   DT.Rows[0]["OtherQualification"].ToString();
                          txtOtherCondition1.Text=   DT.Rows[0]["ConditionOne"].ToString();
                          txtOtherCondition2.Text=   DT.Rows[0]["Conditiontwo"].ToString();
                          HddnFileUrl.Value = DT.Rows[0]["FileUrl"].ToString();
                          lblUploadedFile.Text=   DT.Rows[0]["FileNames"].ToString();
                        
                          txtRemarks.Text=   DT.Rows[0]["Remarks"].ToString();
                         
                       
              
                    }

                }
            }
            catch
            {
              string scripts = "alert('Some error occur.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
            }
        }
    }
}