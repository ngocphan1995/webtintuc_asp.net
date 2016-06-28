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
using NgocPhan;
public partial class CMS_ThemTinBai : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)

    {
       
        Load_data();
        if (Convert.ToInt32(Request.QueryString["MaQuangCao"]) > 0)
        {
            read_data(Convert.ToInt32(Request.QueryString["MaQuangCao"]));
        }

    }
    void Load_data()
    {
        using (var conn = SQL.GetConnection())
        {
            //conn.Open();
            SqlCommand sqlCmd = new SqlCommand("SELECT [MaQuangCao] ,[TieuDe] ,[HinhAnh],[LinkLK],[NgayBatDau],[NgayKetThuc],[ViTriQuangCao],[TrangThai]FROM [D8CNPM].[dbo].[QuangCao]", conn);
            DataSet dt = new DataSet();
            SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
            sqlAdap.Fill(dt);
            grdQuangCao.DataSource = dt;
            grdQuangCao.DataBind();
            conn.Close();


            //Dong ket noi
        }
    }
    protected SqlConnection connect()
    {
        string connectionstring = @"server=NGOC-KUTE\NGOCPHANTHI;uid=sa;pwd=123456;database=D8CNPM";
        return new SqlConnection(connectionstring);
    }
   
    protected void NhapTinBai(object sender, EventArgs e)
    {
       
    }
    void read_data(int maquangcao)
    {
        var conn = SQL.GetConnection();
        //Them 1 ban ghi moi vao bang tblUser
        //conn.Open();
        SqlCommand sqlCmd = new SqlCommand("SELECT [MaQuangCao] ,[TieuDe] ,[HinhAnh],[LinkLK],[NgayBatDau],[NgayKetThuc],[ViTriQuangCao],[TrangThai]FROM [D8CNPM].[dbo].[QuangCao]  where MaQuangCao=" + maquangcao + "", conn);
        SqlDataReader reader = sqlCmd.ExecuteReader();
        if (reader.Read())
        {
            tieude.Text = reader["TieuDe"].ToString();
            linhlk.Text = reader["LinkLK"].ToString();
            txtngaybatdau.Text = reader["NgayBatDau"].ToString();
            txtketthuc.Text = reader["NgayKetThuc"].ToString();
            vitri.Text = reader["ViTriQuangCao"].ToString();
            trangthai.Text = reader["TrangThai"].ToString();

        }
        conn.Close();
    }
    protected void btnNhap_Click1(object sender, EventArgs e)
    {
        using (SqlConnection conn = connect())
        {
            if (Convert.ToInt32(Request.QueryString["MaQuangCao"]) > 0)
            {
                if (fileInput.HasFile)
                {

                    string filename = Path.GetFileName(fileInput.FileName);
                    fileInput.SaveAs(Server.MapPath("~/WebSiteQLSinhVien/Upload/images/quangcao/") + filename);
                    var data = File.ReadAllText(Server.MapPath("~/WebSiteQLSinhVien/Upload/images/quangcao/") + filename);

                    conn.Open();
                    SqlCommand sqlCmd = new SqlCommand("update_QC", conn);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add("@maquangcao", Convert.ToInt32(Request.QueryString["MaQuangCao"]));
                    sqlCmd.Parameters.Add("@tieude", tieude.Text);
                    sqlCmd.Parameters.Add("@hinhanh", filename);
                    sqlCmd.Parameters.Add("@thoigianbatdau", Convert.ToDateTime(txtngaybatdau.Text));
                    sqlCmd.Parameters.Add("@thoigianketthuc", Convert.ToDateTime(txtketthuc.Text));
                    sqlCmd.Parameters.Add("@linklk", linhlk.Text);
                    sqlCmd.Parameters.Add("@vitriqc", vitri.Text);
                    sqlCmd.Parameters.Add("@trangthai", Convert.ToInt32(trangthai.Text));
                    sqlCmd.ExecuteNonQuery();
                    conn.Close();
                    tieude.Text = "";
                    filename = "";
                    txtngaybatdau.Text = "";
                    txtketthuc.Text = "";
                    linhlk.Text = "";
                    vitri.Text = "";
                    string script = "alert(\"Thêm tin thành công!\");";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);
                    Load_data();
                    //TextBox1.Text = data.ToString();

                }
                else
                {
                    conn.Open();
                    SqlCommand sqlCmd = new SqlCommand("update_QC", conn);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add("@maquangcao", Convert.ToInt32(Request.QueryString["MaQuangCao"]));
                    sqlCmd.Parameters.Add("@tieude", tieude.Text);
                    sqlCmd.Parameters.Add("@hinhanh", "");
                    sqlCmd.Parameters.Add("@thoigianbatdau", Convert.ToDateTime(txtngaybatdau.Text));
                    sqlCmd.Parameters.Add("@thoigianketthuc", Convert.ToDateTime(txtketthuc.Text));
                    sqlCmd.Parameters.Add("@linklk", linhlk.Text);
                    sqlCmd.Parameters.Add("@vitriqc", vitri.Text);
                    sqlCmd.Parameters.Add("@trangthai", Convert.ToInt32(trangthai.Text));
                    sqlCmd.ExecuteNonQuery();
                    conn.Close();
                    tieude.Text = "";
                   // filename = "";
                    txtngaybatdau.Text = "";
                    txtketthuc.Text = "";
                    linhlk.Text = "";
                    vitri.Text = "";
                    string script = "alert(\"Thêm tin thành công!\");";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);
                    Load_data();
                }
            }
            else
            {
                if (fileInput.HasFile)
                {

                    string filename = Path.GetFileName(fileInput.FileName);
                    fileInput.SaveAs(Server.MapPath("~/WebSiteQLSinhVien/Upload/images/quangcao/") + filename);
                    var data = File.ReadAllText(Server.MapPath("~/WebSiteQLSinhVien/Upload/images/quangcao/") + filename);

                    conn.Open();
                    SqlCommand sqlCmd = new SqlCommand("them_qc", conn);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add("@tieude", tieude.Text);
                    sqlCmd.Parameters.Add("@hinhanh", filename);
                    sqlCmd.Parameters.Add("@thoigianbatdau",Convert.ToDateTime( txtngaybatdau.Text));
                    sqlCmd.Parameters.Add("@thoigianketthuc", Convert.ToDateTime(txtketthuc.Text));
                    sqlCmd.Parameters.Add("@linklk", linhlk.Text);
                    sqlCmd.Parameters.Add("@vitriqc", vitri.Text);
                    sqlCmd.Parameters.Add("@trangthai", Convert.ToInt32(trangthai.Text));
                    sqlCmd.ExecuteNonQuery();
                    conn.Close();
                    tieude.Text = "";
                    filename = "";
                    txtngaybatdau.Text = "";
                    txtketthuc.Text = "";
                    linhlk.Text = "";
                    vitri.Text = "";
                    string script = "alert(\"Thêm tin thành công!\");";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);
                    Load_data();
                    //TextBox1.Text = data.ToString();

                }
            }
           
            
        }
       
    }


    protected void grdQuangCao_ItemCommand(object source, DataGridCommandEventArgs e)
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
        Response.Redirect(Request.Url.AbsolutePath + "?MaQuangCao=" + id);
       // Response.Redirect("Default.aspx?content=themqc?MaQuangCao=" + id + "");

    }
    void DeleteItem(DataGridCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        var conn = SQL.GetConnection();
        // conn.Open();
        SqlCommand sqlCmd = new SqlCommand("xoaQC ", conn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@maquangcao", id);
        sqlCmd.ExecuteNonQuery();
        //conn.Close();
        string script = "alert(\"Xóa thành công!\");";
        ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script, true);
        Load_data();

    }
    protected void grdQuangCao_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        tieude.Text = "";
        linhlk.Text = "";
        txtngaybatdau.Text = "";
        txtketthuc.Text = "";
        vitri.Text = "";
        trangthai.Text = "";
    }
    protected void grdQuangCao_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        grdQuangCao.CurrentPageIndex = e.NewPageIndex;
        Load_data();
    }
}

