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

public partial class WebSiteQLSinhVien_CMS_SinhVien_Search : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Load_data();
    }
    void Load_data()
    {
        using (var conn = SQL.GetConnection())
        {
           
            SqlCommand sqlCmd = new SqlCommand("select* from SinhVien", conn);
            DataSet dt = new DataSet();
            SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
            sqlAdap.Fill(dt);
            grdDSSV.DataSource = dt;
            grdDSSV.DataBind();
            conn.Close();

        }
    }
    protected void btntimkiem_Click(object sender, EventArgs e)
    {
        using (var conn = SQL.GetConnection())
        {
            
            SqlCommand sqlCmd = new SqlCommand("select * from SinhVien where HoTen like N'%" + TextBox1.Text + "%'", conn);
            DataSet dt = new DataSet();
            SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
            sqlAdap.Fill(dt);
            grdDSSV.DataSource = dt;
            grdDSSV.DataBind();
            conn.Close();


            //Dong ket noi
        }
        string script = "alert(\"Tìm kiếm tin thành công!\");";
        ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script, true);
    }
    protected void ExportToExcel(object sender, EventArgs e)
    {
         Response.ClearContent();
         Response.AddHeader("content-disposition", "attachment; filename=gvtoexcel.xls");
         Response.ContentType = "application/excel";
         System.IO.StringWriter sw = new System.IO.StringWriter();
         HtmlTextWriter htw = new HtmlTextWriter(sw);
         grdDSSV.RenderControl(htw);
         Response.Write(sw.ToString());
         Response.End();
    }
}