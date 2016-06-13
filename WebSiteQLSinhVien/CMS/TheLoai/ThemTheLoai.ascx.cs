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
public partial class CMS_ThemTheLoai : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void tbnCapNhat_Click(object sender, EventArgs e)
    {
        //Cau hinh ket noi voi CSDL DBWeb
        string connectionstring = @"server=NGOC-KUTE\NGOCPHANTHI;uid=sa;pwd=123456;database=D8CNPM";
        //Them 1 ban ghi moi vao bang tblTinBai
        using (SqlConnection conn = new SqlConnection(connectionstring))
        {
            conn.Open();
            SqlCommand sqlCmd = new SqlCommand("NhapTheLoai", conn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Add("@tentheloai", txtTenTheLoai.Text);
            sqlCmd.ExecuteNonQuery();
            conn.Close();
            //Dong ket noi
        }
        Response.Redirect("Default.aspx?content=dstheloai");
    }
}
