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
        
        ComBoxTheLoai();

    }
    protected SqlConnection connect()
    {
        string connectionstring = @"server=NGOC-KUTE\NGOCPHANTHI;uid=sa;pwd=123456;database=D8CNPM";
        return new SqlConnection(connectionstring);
    }
    void ComBoxTheLoai()
    {


        using (SqlConnection conn = connect())
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
                fileInput.SaveAs(Server.MapPath("~/WebSiteQLSinhVien/Upload/images/") + filename);
                var data = File.ReadAllText(Server.MapPath("~/WebSiteQLSinhVien/Upload/images/") + filename);

                conn.Open();
                SqlCommand sqlCmd = new SqlCommand("them_tinbai", conn);
                sqlCmd.CommandType = CommandType.StoredProcedure;
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
                //TextBox1.Text = data.ToString();

            }
            else
            {
                conn.Open();
                SqlCommand sqlCmd = new SqlCommand("them_tinbai", conn);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.Add("@matheloai", cbtheloai.SelectedValue);
                sqlCmd.Parameters.Add("@tieude", tieude.Text);
                sqlCmd.Parameters.Add("@hinhdaidien", "no-image-large.jpg");
                sqlCmd.Parameters.Add("@mota", motatin.Text);
                sqlCmd.Parameters.Add("@noidung", noidung.Text);
                sqlCmd.Parameters.Add("@trangthai", Convert.ToInt32(trangthai.Text));
                sqlCmd.ExecuteNonQuery();
                conn.Close();
                tieude.Text = "";
                //filename = "";
                motatin.Text = "";
                noidung.Text = "";
                string script = "alert(\"Thêm tin thành công!\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }
        }
       
    }

   
}

