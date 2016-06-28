using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;
using System.Web.Script;
using NgocPhan;
using System.Data.OleDb;

public partial class WebSiteQLSinhVien_CMS_SinhVien_ThemSV : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    
    private bool CheckFileType(string FileName)
    {
        string ext = System.IO.Path.GetExtension(FileName);
        switch (ext.ToLower())
        {
            case ".gif":
                return true;
            case ".png":
                return true;
            case ".jpg":
                return true;
            case ".jpeg":
                return true;
            default:
                return false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if ((FileUpload.HasFile))
        {

            if (!Convert.IsDBNull(FileUpload.PostedFile) &
                FileUpload.PostedFile.ContentLength > 0)
            {

                //FIRST, SAVE THE SELECTED FILE IN THE ROOT DIRECTORY.
                FileUpload.SaveAs(Server.MapPath(".") + "\\" + FileUpload.FileName);

                SqlBulkCopy oSqlBulk = null;

                // SET A CONNECTION WITH THE EXCEL FILE.
                OleDbConnection myExcelConn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0; " + "Data Source=" + Server.MapPath(".") + "\\" + FileUpload.FileName + ";Extended Properties=Excel 12.0;");
                try
                {
                    myExcelConn.Open();

                    // GET DATA FROM EXCEL SHEET.
                    OleDbCommand objOleDB = new OleDbCommand("SELECT *FROM [Sheet1$]", myExcelConn);

                    // READ THE DATA EXTRACTED FROM THE EXCEL FILE.
                    OleDbDataReader objBulkReader = null;
                    objBulkReader = objOleDB.ExecuteReader();

                    // SET THE CONNECTION STRING.
                    string sCon = "Data Source=NGOC-KUTE\\NGOCPHANTHI;Persist Security Info=False;" +
                        "Integrated Security=SSPI;" +
                        "Initial Catalog=D8CNPM;User Id=sa;Password=123456;" +
                        "Connect Timeout=30;";



                    using (SqlConnection con = new SqlConnection(sCon))
                    {
                        con.Open();

                        // FINALLY, LOAD DATA INTO THE DATABASE TABLE.
                        oSqlBulk = new SqlBulkCopy(con);
                        oSqlBulk.DestinationTableName = "SinhVien"; // TABLE NAME.
                        oSqlBulk.WriteToServer(objBulkReader);
                    }
                    string script = "alert(\"Thêm thành công!\");";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);

                   // Load_data();
                }
                catch (Exception ex)
                {

                    string script = "alert(\"Thêm k thành công!\");";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);

                }
                
            }
        }
    }
}