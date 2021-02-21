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
    public partial class Student_Details : System.Web.UI.Page
    {
        string fn;
        private readonly BusLogic _bl = new BusLogic();
        DataSet ds = new DataSet();
        string fn22 = "";
        protected void Page_Load(object sender, EventArgs e)
        {    
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    GetDetail();
                    GetState();
                    if (Session["Apply"] != null)
                    {
                     
                        BtnContinue.Visible = true;
                    }
                    else
                    {
                        BtnContinue.Visible = false;
                        Session["Apply"] = null;
                    }



                    int year = DateTime.Now.Year;
                    DDLPasssing.Items.Clear();
                    for (int i = year; i >= 1990; i--)
                    {
                        DDLPasssing.Items.Add(i.ToString());
                    }
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
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
                    SqlCommand cmd = new SqlCommand("GetStudentDetail", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Flag", 1);
                    cmd.Parameters.AddWithValue("@ID", HddnStudentID.Value);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@FatherName", txtFatherName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Nationality", txtNationality.Text.Trim());
                    cmd.Parameters.AddWithValue("@Gender", DDLGender.SelectedItem.Text.Trim());
                    cmd.Parameters.AddWithValue("@DOB", Convert.ToDateTime(txtDateofBirth.Text));
                    cmd.Parameters.AddWithValue("@AddharNo", txtAadhar.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                    cmd.Parameters.AddWithValue("@JobApplyPost", ddlDesign.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@HighestEducation", DDLqualification.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@OtherSkill", txtOtherQualification.Text);
                    cmd.Parameters.AddWithValue("@Aaddress", txtFlatBlok.Text);
                    cmd.Parameters.AddWithValue("@District", ddlCity.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@StateName", ddlState.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@Pincode", Convert.ToInt32(txtZip.Text));
                    cmd.Parameters.AddWithValue("@PassingYear", Convert.ToInt32(DDLPasssing.SelectedValue)); 
                    cmd.Parameters.AddWithValue("@AltMobile", "");
                    cmd.Parameters.AddWithValue("@TotalExperience", txtTotalExperiance.Text);                   
                    GeneralImageClick();

                    cmd.Parameters.AddWithValue("@RFileUrl",  fn);
                    cmd.Parameters.AddWithValue("@Remarks", "");
                    cmd.Parameters.AddWithValue("@ResumeFileName", fn22);
                    cmd.Parameters.AddWithValue("@CustID", txtStudentId.Text);
                    if (conn.State == ConnectionState.Open)
                        conn.Close();
                    else
                        conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                       
                        string scripts = "alert('Submit Successfully.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", scripts, true);
                        btnSubmit.Visible = false;
                        BtnEditRecord.Visible = true;
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
               fn22 = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string ext = Path.GetExtension(fn);
                if (ext == ".jpg"  || ext == ".png" || ext == ".jpeg" || ext == ".JPG" )
                //|| ext == ".gif" || ext == ".doc" || ext == ".docx")
                {
                    string randomno = DateTime.Now.Ticks.ToString().Substring(5);
                    randomno = randomno.Remove(0, 5);
                    fn =  randomno +"_" + fn;
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
                else if(ext == ".doc" || ext == ".docx")
                {
                    string randomno = DateTime.Now.Ticks.ToString().Substring(5);
                    randomno = randomno.Remove(0, 5);
                    fn = randomno + "_" + fn;                   
                    string imageupload = "~/Upload/" + fn;
                    FileUpload1.SaveAs(Server.MapPath(imageupload));
                }
                else
                {
                   
                    ScriptManager.RegisterStartupScript(this.Page, typeof(string), "Alert", "alert('Invalid File selected');", true);
                }
               

            }
            else
            {
                fn = HddnFileUrl.Value;
                fn22 = lblUploadedFile.Text ;
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
                    
                    DT = _bl.GetAllStudent("Student",Session["UserID"].ToString(), "Id", "desc");
                    txtStudentId.Text = Session["UserID"].ToString();
 
                    if (DT.Rows.Count > 0)
                    {
                        btnSubmit.Visible = false;
                        BtnEditRecord.Visible = true;
                        HddnStudentID.Value = DT.Rows[0]["id"].ToString();
                        txtName.Text = DT.Rows[0]["Name"].ToString();
                        txtFatherName.Text = DT.Rows[0]["FatherName"].ToString();
                        txtNationality.Text = DT.Rows[0]["Nationality"].ToString();
                        DateTime _dateTo = DateTime.Parse(DT.Rows[0]["DOB"].ToString());
                        txtDateofBirth.Text = _dateTo.ToString("yyyy-MM-dd");
                        DDLGender.SelectedValue = DT.Rows[0]["Gender"].ToString();
                        txtAadhar.Text = DT.Rows[0]["AddharNo"].ToString();
                        txtEmail.Text =  DT.Rows[0]["Email"].ToString();
                        txtMobile.Text = DT.Rows[0]["Mobile"].ToString();
                        ddlDesign.SelectedItem.Text = DT.Rows[0]["JobApplyPost"].ToString();
                        DDLqualification.SelectedItem.Text = DT.Rows[0]["HighestEducation"].ToString();
                        DDLPasssing.SelectedValue =  DT.Rows[0]["PassingYear"].ToString();
                        txtOtherQualification.Text = DT.Rows[0]["OtherSkill"].ToString();
                        txtTotalExperiance.Text = DT.Rows[0]["TotalExperience"].ToString();
                        txtFlatBlok.Text = DT.Rows[0]["Aaddress"].ToString();
                        GetState();
                        ddlState.SelectedValue = DT.Rows[0]["StateName"].ToString();
                        GetCity();
                        ddlCity.SelectedValue = DT.Rows[0]["District"].ToString();
                        txtZip.Text = DT.Rows[0]["Pincode"].ToString();
                        HddnFileUrl.Value = DT.Rows[0]["RFileUrl"].ToString();
                        lblUploadedFile.Text = DT.Rows[0]["ResumeFileName"].ToString();

                        //ViewState["Rfile"] = DT.Rows[0]["RFileUrl"].ToString();
                    }
                    else
                    {
                        btnSubmit.Visible = true;
                        BtnEditRecord.Visible = false;
                    }
                  
                }
            }
            catch
            {
               
            }
        }

       

        protected void BtnEditRecord_Click(object sender, EventArgs e)
        {

           

            btnSubmit.Visible = true;
            BtnEditRecord.Visible = false;
        }

        protected void BtnContinue_Click(object sender, EventArgs e)
        {
            Session["Apply"] = null;
            BtnContinue.Visible = false;
            lblApplyJob.Text = "Your details has been Submitted!";
        }
    }
}