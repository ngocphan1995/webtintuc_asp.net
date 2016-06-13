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

public partial class WebSiteQLSinhVien_CMS_SinhVien_ThemSV : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ComBoxLop();
        ComBoxKhoa();
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
    protected void btnThemSV_Click(object sender, EventArgs e)
    {
        var conn = SQL.GetConnection();
        if (fileInput.HasFile)
        {
            if (CheckFileType(fileInput.FileName))
            {
                string filename = Path.GetFileName(fileInput.FileName);
                fileInput.SaveAs(Server.MapPath("~/WebSiteQLSinhVien/Upload/images/") + filename);
                var data = File.ReadAllText(Server.MapPath("~/WebSiteQLSinhVien/Upload/images/") + filename);
                SqlCommand sqlCmd = new SqlCommand("ThemSV", conn);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.Add("@Ten", txtHoten.Text);
                sqlCmd.Parameters.Add("@MaLop", cbLop.SelectedValue);
                sqlCmd.Parameters.Add("@MaKhoa", cbKhoa.SelectedValue);
                sqlCmd.Parameters.Add("@Avata", filename);
                sqlCmd.Parameters.Add("@NgaySinh", txtngaysinh.Text);
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
                txtngaysinh.Text = "";
                radNam.Checked = false;
                radNu.Checked = false;
                Response.Write(@"<script>alert('Thêm thành công')</script>");
                Response.Redirect(Request.Url.AbsolutePath + "?content=dssv"); 

            }
            else Response.Write(@"<script>alert('File ảnh không hợp lệ!')</script>");
        }
    }
}