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

public partial class WebSite31_CMS_LichThiLichHoc_ThemLich : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected SqlConnection connect()
    {
        string connectionstring = @"server=NGOC-KUTE\NGOCPHANTHI;uid=sa;pwd=123456;database=D8CNPM";
        return new SqlConnection(connectionstring);
    }
    protected void btnthemLich_Click(object sender, EventArgs e)
    {
        SqlConnection conn = connect();
        conn.Open();
        SqlCommand sqlCmd = new SqlCommand("them_lich ", conn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@tieude", txttieude.Text);
        sqlCmd.Parameters.Add("@noidung", txtnoidung.Text);
        sqlCmd.Parameters.Add("@thoigianbatdau", txtngaybatdau.Text);
        sqlCmd.Parameters.Add("@thoigianketthuc", txtketthuc.Text);
        sqlCmd.Parameters.Add("@diachi", txtdiachi.Text);
        sqlCmd.ExecuteNonQuery();
        conn.Close();
        txttieude.Text = "";
        txtnoidung.Text = "";
        txtngaybatdau.Text = "";
        txtketthuc.Text = "";
        txtdiachi.Text = "";
        Response.Write(@"<script>alert('Thêm tin thành công')</script>");

    }
}