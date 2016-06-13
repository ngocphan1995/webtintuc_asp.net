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
public partial class WebSite31_Lich_thi_hoc_content : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Load_data();
    }
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
            int matin = Convert.ToInt32(Request.QueryString["id"]);
             SqlCommand sqlCmd = new SqlCommand("SELECT [MaLich], [NoiDung], [ThoiGianBatDau], [ThoiGianKetThuc], [DiaChi], [TieuDe] FROM [LichThi] where MaLich=" + Convert.ToInt32(Request.QueryString["id"]) + "", conn);
                DataSet dt = new DataSet();
                SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
                sqlAdap.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                conn.Close();
           
            
        }
    }
}