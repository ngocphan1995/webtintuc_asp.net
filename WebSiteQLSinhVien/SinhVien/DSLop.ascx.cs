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

public partial class WebSiteQLSinhVien_SinhVien_DSLop : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ComBoxLop();
        Load_data();
    }
    void Load_data()
    {
        using (var conn = SQL.GetConnection())
        {
            //conn.Open();
            SqlCommand sqlCmd = new SqlCommand("select MaSV,Hoten,NgaySinh,GioiTinh,QueQuan,SDT,Avata,TenLop,TenKhoa from SinhVien,Khoa,Lop where SinhVien.MaLop=Lop.MaLop and SinhVien.MaKhoa=Khoa.MaKhoa", conn);
            DataSet dt = new DataSet();
            SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
            sqlAdap.Fill(dt);
            DSLop.DataSource = dt;
            DSLop.DataBind();
            conn.Close();

        }
    }
    void ComBoxLop()
    {
        using (var conn = SQL.GetConnection())
        {
            SqlCommand sqlCmd = new SqlCommand("select * from Lop order by MaLop desc ", conn);
            SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
            DataSet dSet = new DataSet();
            sqlAdap.Fill(dSet);
            cbLop.DataSource = dSet;
            cbLop.DataTextField = "TenLop";
            cbLop.DataValueField = "MaLop";
            cbLop.DataBind();
            //cbtheloai.AutoPostBack = true;
            conn.Close();
            conn.Dispose();
        }

    }
        
    protected void btnLoc_Click(object sender, EventArgs e)
    {
        if (cbLop.SelectedValue != "")
        {
            using (var conn = SQL.GetConnection())
            {
                
                SqlCommand sqlCmd = new SqlCommand("select MaSV,Hoten,NgaySinh,GioiTinh,QueQuan,SDT,Avata,TenLop from SinhVien,Lop where SinhVien.MaLop=Lop.MaLop and SinhVien.MaLop = '" + cbLop.SelectedValue + "'", conn);
                DataSet dt = new DataSet();
                SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
                sqlAdap.Fill(dt);
                DSLop.DataSource = dt;
                DSLop.DataBind();
                conn.Close();
               
            }
        }
    }
    
}