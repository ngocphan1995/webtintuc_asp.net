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

public partial class CMS_center : System.Web.UI.UserControl
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
            SqlCommand sqlCmd = new SqlCommand("select MaTinTuc,tblTinBai.MaTheLoai,tentheloai,NgayUpdate,NoiDung,(case TrangThaiTin when '0' then N'chưa đăng' when '1'  then N'đã đăng' end)TrangThaiTin,Mota,TieuDe from tblTinBai,tblTheLoai where tblTinBai.MaTheLoai=tblTheLoai.MaTheLoai", conn);
            DataSet dt = new DataSet();
            SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
            sqlAdap.Fill(dt);
            grdtimkiem.DataSource = dt;
            grdtimkiem.DataBind();
            conn.Close();


            //Dong ket noi
        }
    }
    protected void btntimkiem_Click(object sender, EventArgs e)
    {
        using (SqlConnection conn = connect())
        {
            conn.Open();
            SqlCommand sqlCmd = new SqlCommand("select MaTinTuc,tblTinBai.MaTheLoai,tentheloai,NgayUpdate,NoiDung,(case TrangThaiTin when '0' then N'chưa đăng' when '1'  then N'đã đăng' end)TrangThaiTin,Mota,TieuDe from tblTinBai,tblTheLoai where tblTinBai.MaTheLoai=tblTheLoai.MaTheLoai and TieuDe like N'%"+TextBox1.Text+"%'", conn);
            DataSet dt = new DataSet();
            SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
            sqlAdap.Fill(dt);
            grdtimkiem.DataSource = dt;
            grdtimkiem.DataBind();
            conn.Close();


            //Dong ket noi
        }
        string script = "alert(\"Tìm kiếm tin thành công!\");";
        ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script, true);
    }
    protected void grdtimkiem_ItemCommand(object source, DataGridCommandEventArgs e)
    {

    }
    protected void grdtimkiem_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {

    }
}
