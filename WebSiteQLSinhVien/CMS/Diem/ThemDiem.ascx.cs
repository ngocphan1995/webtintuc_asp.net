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

public partial class WebSiteQLSinhVien_CMS_Diem_ThemDiem : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DropDownListMH();
    }
    
    void DropDownListMH()
    {
        using (var conn = SQL.GetConnection())
        {
            SqlCommand sqlCmd = new SqlCommand("Select * from MonHoc order by MaMon desc", conn);
            SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
            DataSet dt = new DataSet();
            sqlAdap.Fill(dt);
            ddlMonHoc.DataSource = dt;
            ddlMonHoc.DataTextField = "TenMon";
            ddlMonHoc.DataValueField = "MaMon";
            ddlMonHoc.DataBind();
            //cbtheloai.AutoPostBack = true;
            conn.Close();
            conn.Dispose();
        }
    }
    protected void btnThemDiem_Click(object sender, EventArgs e)
    {
        try
        {
            using (var conn = SQL.GetConnection())
            {

                SqlCommand sqlCmd = new SqlCommand("ThemDiemSV", conn);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.Add("@MaSv", txtMaSv.Text);
                sqlCmd.Parameters.Add("@MaMon", ddlMonHoc.SelectedValue);
                sqlCmd.Parameters.Add("@DiemTP", txtDiemTP.Text);
                sqlCmd.Parameters.Add("@DiemThi", txtDiemThi.Text);
                sqlCmd.Parameters.Add("@NgayCapNhat", DateTime.Now);
                sqlCmd.ExecuteNonQuery();
                conn.Close();
                txtMaSv.Text = "";
                txtDiemTP.Text = "";
                txtDiemThi.Text = "";

                Response.Write(@"<script>alert('Thêm điểm thành công')</script>");
            }
        }
        catch(Exception ex)
        {
             Response.Write(@"<script>alert('Thêm điểm không thành công do trùng khóa')</script>");
        }
    }
}