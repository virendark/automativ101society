using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Web;

namespace TestTutorial101
{
    public class SqlHelper
    {
        #region "Variables"

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        Database db = DatabaseFactory.CreateDatabase("cn");


        private static SqlHelper instance = new SqlHelper();
        #endregion
       
        public long SaveRegister(HybridDictionary hyb)
        {
            try
            {
                DbCommand dbCom = db.GetStoredProcCommand("usp_IU_Register");
                db.AddInParameter(dbCom, "@AutoID", DbType.Int64, hyb["AutoID"]);
                db.AddInParameter(dbCom, "@Name", DbType.String, hyb["Name"]);
                db.AddInParameter(dbCom, "@Email", DbType.String, hyb["Email"]);
                db.AddInParameter(dbCom, "@CountryID", DbType.Int64, Convert.ToInt64(hyb["CountryID"]));
                db.AddInParameter(dbCom, "@State", DbType.Int64, Convert.ToInt64(hyb["State"]));
                db.AddInParameter(dbCom, "@City", DbType.String, hyb["City"]);
                db.AddInParameter(dbCom, "@pass", DbType.String, hyb["pass"]);
                db.AddInParameter(dbCom, "@Subscribe", DbType.Boolean, Convert.ToBoolean(hyb["Subscribe"]));
                db.AddInParameter(dbCom, "@profilephoto", DbType.String, hyb["profilephoto"]);
                db.AddInParameter(dbCom, "@Address", DbType.String, hyb["Address"]);
                db.AddInParameter(dbCom, "@Pin", DbType.String, hyb["Pin"]);
                db.AddInParameter(dbCom, "@LandMark", DbType.String, hyb["LandMark"]);
                db.AddInParameter(dbCom, "@Mobile", DbType.String, hyb["Mobile"]);
                db.AddOutParameter(dbCom, "@CurrentUID", DbType.Int32, 0);
                db.ExecuteNonQuery(dbCom);
                long mCurrentUid = Convert.ToInt64(db.GetParameterValue(dbCom, "CurrentUID").ToString());
                return mCurrentUid;

            }
            catch (Exception ex)
            {
                return -1;
            }
        }


        public long SaveJob(HybridDictionary hyb, int flag)
        {
            try
            {
                DbCommand dbCom = db.GetStoredProcCommand("SpJob");
                db.AddInParameter(dbCom, "@ID", DbType.Int32, Convert.ToInt32(hyb["ID"]));
                db.AddInParameter(dbCom, "@JobTitle", DbType.String, hyb["JobTitle"]);
                db.AddInParameter(dbCom, "@JobDesc", DbType.String, hyb["JobDesc"]);
                db.AddInParameter(dbCom, "@Skill", DbType.String, hyb["Skill"]);
                db.AddInParameter(dbCom, "@CompanyName", DbType.String, hyb["CompanyName"]);
                db.AddInParameter(dbCom, "@ToDate", DbType.DateTime, Convert.ToDateTime(hyb["ToDate"]));
                db.AddInParameter(dbCom, "@Remarks", DbType.String, hyb["Remarks"]);
                db.AddInParameter(dbCom, "@Flag", DbType.Int32, flag);
                db.AddOutParameter(dbCom, "@CurrentID", DbType.Int32, 0);
                db.ExecuteNonQuery(dbCom);
                long mCurrentUid = Convert.ToInt64(db.GetParameterValue(dbCom, "CurrentID").ToString());
                return mCurrentUid;
            }
            catch (Exception ex)
            {
                return -1;
            }
        }

        public long SaveNewEvent(HybridDictionary hyb , int flag) 
        {
            try
            {
                DbCommand dbCom = db.GetStoredProcCommand("SpNewEvent");
                db.AddInParameter(dbCom, "@ID", DbType.Int32, Convert.ToInt32(hyb["ID"]));
                db.AddInParameter(dbCom, "@Title", DbType.String, hyb["Title"]);                
                db.AddInParameter(dbCom, "@ToDate", DbType.DateTime, Convert.ToDateTime(hyb["ToDate"]));
                db.AddInParameter(dbCom, "@Remarks", DbType.String, hyb["Remarks"]);
                db.AddInParameter(dbCom, "@Flag", DbType.Int32, flag);
                db.AddOutParameter(dbCom, "@CurrentID", DbType.Int32, 0);
                db.ExecuteNonQuery(dbCom);
                long mCurrentUid = Convert.ToInt64(db.GetParameterValue(dbCom, "CurrentID").ToString());
                return mCurrentUid;
            }
            catch (Exception ex)
            {
                return -1;
            }
        }
        
        public long VerifyUser(HybridDictionary hyLogin)
        {
            try
            {
                DbCommand dbCom = db.GetStoredProcCommand("usp_mst_VerifyUser");
                db.AddInParameter(dbCom, "@AdminLoginName", DbType.String, hyLogin["AdminLoginName"]);
                db.AddInParameter(dbCom, "@AdminPassword", DbType.String, hyLogin["AdminPassword"]);
                db.AddOutParameter(dbCom, "@CurrentUID", DbType.Int64, 0);
                db.ExecuteNonQuery(dbCom);

                long mCurrentUid = long.Parse(db.GetParameterValue(dbCom, "CurrentUID").ToString());
                return mCurrentUid;
            }
            catch (Exception ex)
            {
                return -1;
            }
        }


        #region "Method"

        public static SqlHelper Instance
        {
            get
            {
                return instance;
            }
        }


        public DataTable ExecuteDataTable(string mQuery)
        {
            DbCommand cmdDataSet = db.GetSqlStringCommand(mQuery);
            DataSet ds = db.ExecuteDataSet(cmdDataSet);
            return ds.Tables[0];
        }

        public Int32 ExecuteQuery(string mQuery)
        {
            DbCommand dbCommand = db.GetSqlStringCommand(mQuery);
            return Convert.ToInt32(db.ExecuteNonQuery(dbCommand));
        }
        #endregion

    }
}