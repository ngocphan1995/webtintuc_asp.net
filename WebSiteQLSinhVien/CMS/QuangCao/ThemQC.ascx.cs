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
public partial class CMS_ThemTinBai : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        

    }
    protected SqlConnection connect()
    {
        string connectionstring = @"server=NGOC-KUTE\NGOCPHANTHI;uid=sa;pwd=123456;database=D8CNPM";
        return new SqlConnection(connectionstring);
    }
   
    protected void NhapTinBai(object sender, EventArgs e)
    {
       
    }
    protected void btnNhap_Click1(object sender, EventArgs e)
    {
        using (SqlConnection conn = connect())
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
                sqlCmd.Parameters.Add("@thoigianbatdau", txtngaybatdau.Text);
                sqlCmd.Parameters.Add("@thoigianketthuc", txtketthuc.Text);
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
                //TextBox1.Text = data.ToString();

            }
            
        }
       
    }

   
}

