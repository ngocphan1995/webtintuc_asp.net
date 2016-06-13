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

public partial class WebSiteQLSinhVien_CMS_DanhSachTinBai : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ComBoxTheLoai();
        Load_data();
        if (Convert.ToInt32(Request.QueryString["MaBaiTin"])> 0)
        {
            read_data(Convert.ToInt32(Request.QueryString["MaBaiTin"]));
        }
    }
    
    void Load_data()
    {
        using (var conn = SQL.GetConnection())
        {
            //conn.Open();
            SqlCommand sqlCmd = new SqlCommand("select MaTinTuc,tblTinBai.MaTheLoai,tentheloai,NgayUpdate,NoiDung,(case TrangThaiTin when '0' then N'chưa đăng' when '1'  then N'đã đăng' end)TrangThaiTin,Mota,TieuDe from tblTinBai,tblTheLoai where tblTinBai.MaTheLoai=tblTheLoai.MaTheLoai order by NgayUpdate desc", conn);
            DataSet dt = new DataSet();
            SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
            sqlAdap.Fill(dt);
            grdTinBai.DataSource = dt;
            grdTinBai.DataBind();
            conn.Close();

            
            //Dong ket noi
        }
    }
    void ComBoxTheLoai()
    {


        using (var conn = SQL.GetConnection())
        {
            SqlCommand sqlCmd = new SqlCommand("select* from tblTheLoai order by matheloai desc ", conn);
            SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
            DataSet dSet = new DataSet();
            sqlAdap.Fill(dSet);
            cbtheloai.DataSource = dSet;
            cbtheloai.DataTextField = "tentheloai";
            cbtheloai.DataValueField = "matheloai";
            cbtheloai.DataBind();
            //cbtheloai.AutoPostBack = true;
            conn.Close();
            conn.Dispose();
        }

    }
    protected void grdTinBai_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        switch (((LinkButton)e.CommandSource).CommandName)
        {
            case "Xoa":
                DeleteItem(e);
                break;
            case "Sua":
                SuaItem(e);
                break;
            default:
                // Do nothing.
                break;
        }
    }
    void SuaItem(DataGridCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        Response.Redirect(Request.Url.AbsolutePath + "?MaBaiTin=" + id);
        //Response.Redirect("Default.aspx?content=dstheloai?MaTheLoai=" + id + "");

    }
    void DeleteItem(DataGridCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        var conn = SQL.GetConnection();
       // conn.Open();
        SqlCommand sqlCmd = new SqlCommand("delete_tinbai ", conn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@matin",id);
        sqlCmd.ExecuteNonQuery();
        //conn.Close();
        string script = "alert(\"Xóa tin thành công!\");";
        ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script, true);
        Load_data();

    }
    void read_data(int mabaitin)
    {
        var conn = SQL.GetConnection();
        //Them 1 ban ghi moi vao bang tblUser
        //conn.Open();
        SqlCommand sqlCmd = new SqlCommand("select MaTinTuc,tblTinBai.MaTheLoai,tentheloai,NoiDung,TrangThaiTin,Mota,TieuDe from tblTinBai,tblTheLoai where tblTinBai.MaTheLoai=tblTheLoai.MaTheLoai and MaTinTuc=" + mabaitin + "", conn);
        SqlDataReader reader = sqlCmd.ExecuteReader();
        if (reader.Read())
        {
            cbtheloai.DataTextField = reader["tentheloai"].ToString();
            tieude.Text = reader["TieuDe"].ToString();
            motatin.Text = reader["Mota"].ToString();
            noidung.Text = reader["Noidung"].ToString();
            trangthai.Text = reader["TrangThaiTin"].ToString();
            
        }
        conn.Close();
    }
    protected void btnNhap_Click(object sender, EventArgs e)
    {
        var conn = SQL.GetConnection();
        if (fileInput.HasFile)
        {
            string filename = Path.GetFileName(fileInput.FileName);
            fileInput.SaveAs(Server.MapPath("~/WebSiteQLSinhVien/Upload/images/") + filename);
            var data = File.ReadAllText(Server.MapPath("~/WebSiteQLSinhVien/Upload/images/") + filename);

            //conn.Open();
            SqlCommand sqlCmd = new SqlCommand("update_baitin", conn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Add("@matintuc", Convert.ToInt32(Request.QueryString["MaBaiTin"]));
            sqlCmd.Parameters.Add("@matheloai", cbtheloai.SelectedValue);
            sqlCmd.Parameters.Add("@tieude", tieude.Text);
            sqlCmd.Parameters.Add("@hinhdaidien", filename);
            sqlCmd.Parameters.Add("@mota", motatin.Text);
            sqlCmd.Parameters.Add("@noidung", noidung.Text);
            sqlCmd.Parameters.Add("@trangthai", Convert.ToInt32(trangthai.Text));
            sqlCmd.ExecuteNonQuery();
            conn.Close();
            tieude.Text = "";
            filename = "";
            motatin.Text = "";
            noidung.Text = "";
            string script = "alert(\"Thêm tin thành công!\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script, true);
            Load_data();
            //TextBox1.Text = data.ToString();

        }
        else
        {
            //conn.Open();
            SqlCommand sqlCmd = new SqlCommand("update_baitin", conn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Add("@matintuc", Convert.ToInt32(Request.QueryString["MaBaiTin"]));
            sqlCmd.Parameters.Add("@matheloai", cbtheloai.SelectedValue);
            sqlCmd.Parameters.Add("@tieude", tieude.Text);
            sqlCmd.Parameters.Add("@hinhdaidien", "");
            sqlCmd.Parameters.Add("@mota", motatin.Text);
            sqlCmd.Parameters.Add("@noidung", noidung.Text);
            sqlCmd.Parameters.Add("@trangthai", Convert.ToInt32(trangthai.Text));
            sqlCmd.ExecuteNonQuery();
            conn.Close();
            tieude.Text = "";
           // filename = "";
            motatin.Text = "";
            noidung.Text = "";
          //  Response.Write(@"<script>alert('Thêm tin thành công')</script>");
            string script = "alert(\"Thêm tin thành công!\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script, true);
            Load_data();
        }
    }
    protected void grdTinBai_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        grdTinBai.CurrentPageIndex = e.NewPageIndex;
        Load_data();
    }
}
