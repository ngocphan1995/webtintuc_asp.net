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

public partial class WebSiteQLSinhVien_SinhVien_DiemSV : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Load_data();
        Tinh_Diem();
    }
    void Load_data()
    {
        if (Convert.ToInt32(Request.QueryString["MaSv"]) > 0)
        {
            int Masv = (Convert.ToInt32(Request.QueryString["Masv"]));

            using (var conn = SQL.GetConnection())
            {
                //conn.Open();
                SqlCommand sqlCmd = new SqlCommand("select MonHoc.*,Diem.*,HoTen from Diem,MonHoc,SinhVien where Diem.MaMon=MonHoc.MaMon and Diem.MaSv=SinhVien.MaSv and SinhVien.MaSv='" + Masv + "'", conn);
                DataSet dt = new DataSet();
                SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
                sqlAdap.Fill(dt);
                DiemSV.DataSource = dt;
                DiemSV.DataBind();
                conn.Close();

            }
        }
    }
    void Tinh_Diem()
    {
        if (Convert.ToInt32(Request.QueryString["MaSv"]) > 0)
        {
            int Masv = (Convert.ToInt32(Request.QueryString["Masv"]));

            using (var conn = SQL.GetConnection())
            {
                //conn.Open();
                SqlCommand sqlCmd = new SqlCommand("select AVG(DiemTongKet) from Diem where MaSV='" + Masv + "'", conn);
                SqlDataReader reader = sqlCmd.ExecuteReader();
                while (reader.Read())
                {
                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        DiemTB.Text = reader[i].ToString();                        
                    }
                }
                reader.Close();
                float diem = float.Parse(DiemTB.Text);
                if (diem <= 5.0) XepLoai.Text = "yếu";
                if (diem > 5.0 && diem <= 6.5) XepLoai.Text = "Trung bình";
                if (diem > 6.5 && diem <= 8.0) XepLoai.Text = "Khá";
                if (diem > 8.0) XepLoai.Text = "Giỏi";
            }
        }
    }
    protected void ExportToExcel(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=BangDiem.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        hw.WriteLine("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">");
        DiemSV.RenderControl(hw);
        Response.Output.Write(sw.ToString());
        Response.Flush();
        Response.End();
    }
}