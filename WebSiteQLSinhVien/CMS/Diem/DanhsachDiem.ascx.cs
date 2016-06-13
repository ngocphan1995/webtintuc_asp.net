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

public partial class WebSiteQLSinhVien_CMS_Diem_DanhsachDiem : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DropDownListMH();
        Load_data();
        if (Convert.ToInt32(Request.QueryString["MaSv"]) > 0 && Convert.ToInt32(Request.QueryString["MaMon"]) > 0 )
        {
            if (Convert.ToInt32(Request.QueryString["action"]) == 0)
            {
                read_data(Convert.ToInt32(Request.QueryString["MaSv"]), Convert.ToInt32(Request.QueryString["MaMon"]));
            }
            else DeleteItem(Convert.ToInt32(Request.QueryString["MaSv"]), Convert.ToInt32(Request.QueryString["MaMon"]));
            
        }
    }
    void Load_data()
    {
        using (var conn = SQL.GetConnection())        {
            
            SqlCommand sqlCmd = new SqlCommand("SELECT Diem.MaSv,HoTen,MaMon,DiemTP,DiemThi,DiemTongKet,NgayCapNhat FROM Diem, SinhVien WHERE SinhVien.MaSv=Diem.MaSv", conn);
            DataSet dt = new DataSet();
            SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
            sqlAdap.Fill(dt);
            DSDiem.DataSource = dt;
            DSDiem.DataBind();
            conn.Close();
        }
    }
    protected void btnUpdateDiem_Click(object sender, EventArgs e)
    {
        try
        {
            using (var conn = SQL.GetConnection())
            {

                SqlCommand sqlCmd = new SqlCommand("UpdateDiem", conn);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.Add("@MaSv", Convert.ToInt32(Request.QueryString["MaSv"]));
                sqlCmd.Parameters.Add("@MaMon", Convert.ToInt32(Request.QueryString["MaMon"]));
                sqlCmd.Parameters.Add("@DiemTP", txtDiemTP.Text);
                sqlCmd.Parameters.Add("@DiemThi", txtDiemThi.Text);
                sqlCmd.Parameters.Add("@NgayCapNhat", DateTime.Now);
                sqlCmd.ExecuteNonQuery();
                conn.Close();
                txtMaSv.Text = "";
                txtDiemTP.Text = "";
                txtDiemThi.Text = "";

                txtdiemTK.Text = "";
                Response.Write(@"<script>alert('Cập nhật điểm thành công')</script>");
            }
            Load_data();
        }
        catch (Exception ex)
        {
            Response.Write(@"<script>alert('Thêm điểm không thành công do trùng khóa')</script>");
        }
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
    void read_data(int Masv, int Mamon)
    {
        var conn = SQL.GetConnection();
        //Them 1 ban ghi moi vao bang tblUser
        
        SqlCommand sqlCmd = new SqlCommand("SELECT * from Diem where MaMon=" + Mamon + " and MaSv=" + Masv + "", conn);
        SqlDataReader reader = sqlCmd.ExecuteReader();
        if (reader.Read())
        {
            txtMaSv.Text = reader["MaSV"].ToString();
            ddlMonHoc.SelectedValue = reader["MaMon"].ToString();
            txtDiemTP.Text = reader["DiemTP"].ToString();
            txtDiemThi.Text = reader["DiemThi"].ToString();
            txtdiemTK.Text = reader["DiemTongKet"].ToString();
           // txtNgayUpdate.Text = reader["NgayCapNhat"].ToString();
            txtMaSv.Enabled = false;
            ddlMonHoc.Enabled = false;
        }
        conn.Close();
    }
    
    void DeleteItem(int id, int mamon)
    {
        
        var conn = SQL.GetConnection();        
        SqlCommand sqlCmd = new SqlCommand("DeleteDiem", conn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@MaSv", id);
        sqlCmd.Parameters.Add("@MaMon", mamon);
        sqlCmd.ExecuteNonQuery();
        conn.Close();
        Response.Write(@"<script>alert('Xóa tin thành công')</script>");
        Load_data();

    }
    
}