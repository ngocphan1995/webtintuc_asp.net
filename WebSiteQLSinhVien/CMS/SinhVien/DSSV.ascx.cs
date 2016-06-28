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
using System.Drawing;

public partial class WebSiteQLSinhVien_CMS_SinhVien_DSSV : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ComBoxLop();
        ComBoxKhoa();
        Load_data();
        if (Convert.ToInt32(Request.QueryString["MaSv"]) > 0)
        {
            read_data(Convert.ToInt32(Request.QueryString["MaSv"]));
        }
    }
    void ComBoxLop()
    {
        using (var conn = SQL.GetConnection())
        {
            SqlCommand sqlCmd = new SqlCommand("select* from Lop order by MaLop desc ", conn);
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
    void ComBoxKhoa()
    {
        using (var conn = SQL.GetConnection())
        {
            SqlCommand sqlCmd = new SqlCommand("select* from Khoa order by MaKhoa desc ", conn);
            SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
            DataSet dSet = new DataSet();
            sqlAdap.Fill(dSet);
            cbKhoa.DataSource = dSet;
            cbKhoa.DataTextField = "TenKhoa";
            cbKhoa.DataValueField = "MaKhoa";
            cbKhoa.DataBind();
            //cbtheloai.AutoPostBack = true;
            conn.Close();
            conn.Dispose();
        }

    }
    void Load_data()
    {
        using (var conn = SQL.GetConnection())
        {
            //conn.Open();
            SqlCommand sqlCmd = new SqlCommand("select* from SinhVien", conn);
            DataSet dt = new DataSet();
            SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
            sqlAdap.Fill(dt);
            grdDSSV.DataSource = dt;
            grdDSSV.DataBind();
            conn.Close();
            
        }
    }
    protected void Command(object source, DataGridCommandEventArgs e)
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
        Response.Redirect(Request.Url.AbsolutePath + "?content=dssv&MaSv=" + id);        
    }
    void DeleteItem(DataGridCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        var conn = SQL.GetConnection();
        // conn.Open();
        SqlCommand sqlCmd = new SqlCommand("DeleteSV ", conn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@MaSv", id);
        sqlCmd.ExecuteNonQuery();
        //conn.Close();
        string script = "alert(\"Xóa thành công!\");";
        ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script, true);
        Load_data();

    }
    void read_data(int MaSv)
    {
        var conn = SQL.GetConnection();
        //Them 1 ban ghi moi vao bang tblUser
        //conn.Open();
        SqlCommand sqlCmd = new SqlCommand("select* from SinhVien where MaSV='" + MaSv + "'", conn);
        SqlDataReader reader = sqlCmd.ExecuteReader();
        if (reader.Read())
        {
            string gt = "";
            if (reader["NgaySinh"].ToString() == "1") radNam.Checked = true; else radNu.Checked=true;
            cbLop.SelectedValue = reader["MaLop"].ToString();
            cbKhoa.SelectedValue = reader["MaKhoa"].ToString();
            txtHoten.Text = reader["HoTen"].ToString();
            txtngaysinh.Text = reader["NgaySinh"].ToString();
            txtdiachi.Text = reader["QueQuan"].ToString();
            txtPhone.Text = reader["SDT"].ToString();
        }
        conn.Close();
    }
    private bool CheckFileType(string FileName)
    {
        string ext = System.IO.Path.GetExtension(FileName);
        switch (ext.ToLower())
        {
            case ".gif":
                return true;
            case ".png":
                return true;
            case ".jpg":
                return true;
            case ".jpeg":
                return true;
            default:
                return false;
        }
    }
    protected void btncapnhatSV_Click(object sender, EventArgs e)
    {
        var conn = SQL.GetConnection();
        if (fileInput.HasFile)        
        {
            if (CheckFileType(fileInput.FileName))
            {
                string filename = Path.GetFileName(fileInput.FileName);
                fileInput.SaveAs(Server.MapPath("~/WebSiteQLSinhVien/Upload/images/") + filename);
                var data = File.ReadAllText(Server.MapPath("~/WebSiteQLSinhVien/Upload/images/") + filename);

                    //conn.Open();
                    SqlCommand sqlCmd = new SqlCommand("UpdateSV", conn);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add("@MaSv", Convert.ToInt32(Request.QueryString["MaSv"]));
                    sqlCmd.Parameters.Add("@Ten", txtHoten.Text);
                    sqlCmd.Parameters.Add("@MaLop", cbLop.SelectedValue);
                    sqlCmd.Parameters.Add("@MaKhoa", cbKhoa.SelectedValue);
                    sqlCmd.Parameters.Add("@Avata", filename);
                    sqlCmd.Parameters.Add("@NgaySinh", Convert.ToDateTime(txtngaysinh.Text));
                    string gt = "";
                    if (radNam.Checked == true) gt = "1"; else gt = "0";
                    sqlCmd.Parameters.Add("@GioiTinh", gt);
                    sqlCmd.Parameters.Add("@QueQuan", txtdiachi.Text);
                    sqlCmd.Parameters.Add("@SDT", txtPhone.Text);
                    sqlCmd.ExecuteNonQuery();
                    conn.Close();
                    txtHoten.Text = "";
                    filename = "";
                    txtPhone.Text = "";
                    txtdiachi.Text = "";
                    txtngaysinh.Text="";
                    radNam.Checked=false;
                    radNu.Checked=false;
                    string script = "alert(\"Cập nhật thành công!\");";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);
                    Load_data();    
            }
            else{
                string script = "alert(\"File ảnh không hợp lệ!\");";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);
                    Load_data();
            }
                                     
               
        }
        else
        {
            SqlCommand sqlCmd = new SqlCommand("UpdateSV", conn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Add("@MaSv", Convert.ToInt32(Request.QueryString["MaSv"]));
            sqlCmd.Parameters.Add("@Ten", txtHoten.Text);
            sqlCmd.Parameters.Add("@MaLop", cbLop.SelectedValue);
            sqlCmd.Parameters.Add("@MaKhoa", cbKhoa.SelectedValue);
            sqlCmd.Parameters.Add("@Avata", "");
            sqlCmd.Parameters.Add("@NgaySinh", Convert.ToDateTime(txtngaysinh.Text));
            string gt = "";
            if (radNam.Checked == true) gt = "1"; else gt = "0";           
            sqlCmd.Parameters.Add("@GioiTinh", gt);
            sqlCmd.Parameters.Add("@QueQuan", txtdiachi.Text);
            sqlCmd.Parameters.Add("@SDT", txtPhone.Text);
            sqlCmd.ExecuteNonQuery();
            conn.Close();
            txtHoten.Text = "";            
            txtPhone.Text = "";
            txtdiachi.Text = "";
            txtngaysinh.Text = "";
            radNam.Checked = false;
            radNu.Checked = false;
            string script = "alert(\"Cập nhật thành công!\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script, true);
            Load_data();                    
        }
        }

    protected void grdTinBai_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        grdDSSV.CurrentPageIndex = e.NewPageIndex;
        Load_data();
    }

   
       
}