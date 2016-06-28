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
using System.Data.OleDb;
public partial class CMS_ThemTheLoai : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Load_data();
    }
   /* protected void tbnCapNhat_Click(object sender, EventArgs e)
    {
        //Cau hinh ket noi voi CSDL DBWeb
        string connectionstring = @"server=NGOC-KUTE\NGOCPHANTHI;uid=sa;pwd=123456;database=D8CNPM";
        //Them 1 ban ghi moi vao bang tblTinBai
        using (SqlConnection conn = new SqlConnection(connectionstring))
        {
            conn.Open();
            SqlCommand sqlCmd = new SqlCommand("NhapTheLoai", conn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Add("@tentheloai", txtTenTheLoai.Text);
            sqlCmd.ExecuteNonQuery();
            conn.Close();
            //Dong ket noi
        }
        Response.Redirect("Default.aspx?content=dstheloai");
    }*/
    protected SqlConnection connect()
    {
        string connectionstring = @"server=NGOC-KUTE\NGOCPHANTHI;uid=sa;pwd=123456;database=D8CNPM";
        return new SqlConnection(connectionstring);
    }
    void Load_data()
    {
        using (SqlConnection conn = connect())
        {
            conn.Open();
            SqlCommand sqlCmd = new SqlCommand("select * from tblTheLoai", conn);
            DataSet dt = new DataSet();
            SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
            sqlAdap.Fill(dt);
            grdTheLoai.DataSource = dt;
            grdTheLoai.DataBind();
            conn.Close();


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
                OleDbConnection myExcelConn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0; " +"Data Source=" + Server.MapPath(".") + "\\" + FileUpload.FileName +";Extended Properties=Excel 12.0;");
                try
                {
                    myExcelConn.Open();

                    // GET DATA FROM EXCEL SHEET.
                    OleDbCommand objOleDB =new OleDbCommand("SELECT *FROM [Sheet1$]", myExcelConn);

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
                        oSqlBulk.DestinationTableName = "tblTheLoai"; // TABLE NAME.
                        oSqlBulk.WriteToServer(objBulkReader);
                    }
                    string script = "alert(\"Thêm thành công!\");";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);
                   
                    Load_data();
                }
                catch (Exception ex)
                {

                    string script = "alert(\"Thêm k thành công!\");";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);

                }
                finally
                {
                    string script = "alert(\"Thêm k thành công!\");";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);
                    // CLEAR.
                   // oSqlBulk.Close();
                    //oSqlBulk = null;
                    myExcelConn.Close();
                    myExcelConn = null;
                }
            }
        }
    }
    protected void grdTheLoai_ItemCommand(object source, DataGridCommandEventArgs e)
    {

    }
}
