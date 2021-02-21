using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Collections.Specialized;

namespace TestTutorial101
{
    public class BusLogic
    {
        #region Login
        //public long VerifyAdminLogin(HybridDictionary hyLogin)
        //{
        //    return SqlHelper.Instance.VerifyAdminUser(hyLogin);
        //}
        //public long VerifyUserLogin(HybridDictionary hyLogin)
        //{
        //    return SqlHelper.Instance.VerifyUserLogin(hyLogin);
        //}
        public long VerifyUser(HybridDictionary hyLogin)
        {
            return SqlHelper.Instance.VerifyUser(hyLogin);
        }
        //public long VerifyVendor(HybridDictionary hyLogin)
        //{
        //    return SqlHelper.Instance.VerifyVendor(hyLogin);
        //}
        //public string VerifyUserString(HybridDictionary hyLogin)
        //{
        //    return SqlHelper.Instance.VerifyUserString(hyLogin);
        //}
        //public long VerifyCompany(HybridDictionary hyLogin)
        //{
        //    return SqlHelper.Instance.VerifyCompany(hyLogin);
        //}
        #endregion

        public long SaveRegister(HybridDictionary hybr)
        {
            return SqlHelper.Instance.SaveRegister(hybr);
        }
        public long SaveNewEvent(HybridDictionary hybr, int flag)
        {
            return SqlHelper.Instance.SaveNewEvent(hybr, flag);

        }

        public long SaveJob(HybridDictionary hybr, int flag)
        {
            return SqlHelper.Instance.SaveJob(hybr, flag);

        }
        
        public DataTable GetEmail(string email)
        {
            string mQuery = "select pass,Name,AutoID,Registertype from tbl_mst_Customer where Email='" + email + "'";
            return SqlHelper.Instance.ExecuteDataTable(mQuery);
        }
        public DataTable GetCountPassword(string pass)
        {
           
            string mQuery = "select pass,Name,AutoID from tbl_mst_Customer where pass='" + pass + "'";
            return SqlHelper.Instance.ExecuteDataTable(mQuery);
        }
        public DataTable GetAllField(string tblName, string FieldName, long ID)
        {
            string mQuery = "SELECT * FROM " + tblName + " WHERE IsAlive='True' and " + FieldName + " =" + ID + "";
            return SqlHelper.Instance.ExecuteDataTable(mQuery);
        }
        public int ActivateAccount(string Email)
        {
            string mQuery = "update tbl_mst_Customer set IsAlive = 'true' , Registertype = 'User' , LastUpdate = GetDate() where Email = '" + Email + "' and  IsAlive = 'false' ";
            return SqlHelper.Instance.ExecuteQuery(mQuery);
        }
        public int ChangePassword(string NewPassword,  int  Id)
        {
            string mQuery = "update tbl_mst_Customer set pass = '" + NewPassword + "' , LastUpdate = GetDate() where AutoID = '" + Id + "' and  IsAlive = 'true' ";
            return SqlHelper.Instance.ExecuteQuery(mQuery);
        }

        public DataTable GetAllField(string tblName, string orberByFiledName, string AscDesc)
        {
              string mQuery = "SELECT * FROM  " + tblName + " WHERE IsAlive='True' order by " + orberByFiledName + " " + AscDesc + "";
                return SqlHelper.Instance.ExecuteDataTable(mQuery);
           
        }
        public DataTable GetAllStudent(string tblName, string Field, string orberByFiledName, string AscDesc)
        {
            string mQuery = "SELECT * FROM  " + tblName + " WHERE CustID = '" + Field + "' and IsAlive='True' order by " + orberByFiledName + " " + AscDesc + "";
            return SqlHelper.Instance.ExecuteDataTable(mQuery);
        }
        public DataTable GetAllStudentAdmin(string tblName, int Field, string orberByFiledName, string AscDesc)
        {
            string mQuery = "SELECT * FROM  " + tblName + " WHERE id = '" + Field + "' and IsAlive='True' order by " + orberByFiledName + " " + AscDesc + "";
            return SqlHelper.Instance.ExecuteDataTable(mQuery);
        }

        public int Delete(string tblName, string FieldName, long ID)
        {
            string mQuery = "Update " + tblName + " set IsAlive='False' where " + FieldName + "=" + ID + "";
            return SqlHelper.Instance.ExecuteQuery(mQuery);
        }
        public DataTable GetAdminLogin(string tblName, string userId, string password)
        {
            string mQuery = "SELECT * FROM  " + tblName + " WHERE userId = '" + userId + "' and password = '" + password + "' and isActive=1 ";
            return SqlHelper.Instance.ExecuteDataTable(mQuery);
        }
        public int VehicleScrappingEnquery(string ownName, string phoneNo, string vehicleNo, string registrationYear, string email,DateTime createAt)
        {
            string mQuery = "insert into tblvehicle_scrap(isActive,ownName,phoneNo,vehicleNo,registrationYear,email,createAt) value( 1,'" + ownName + "','"+ phoneNo + "','" + vehicleNo + "','" + registrationYear + "','" + email + "','"+ createAt + "') ";
            return SqlHelper.Instance.ExecuteQuery(mQuery);
        }
        public DataTable GetAllCustomer(string tblName)
        {
            string mQuery = "SELECT * FROM  " + tblName + " ";
            return SqlHelper.Instance.ExecuteDataTable(mQuery);

        }
    }
}