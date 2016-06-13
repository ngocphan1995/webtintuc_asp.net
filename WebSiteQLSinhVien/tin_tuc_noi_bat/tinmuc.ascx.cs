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

using NgocPhan;

public partial class tin_tuc_noi_bat_tinmuc : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Load_data();
    }
    void Load_data()
    {
        using (var conn = SQL.GetConnection())
        {
           // conn.Open();
            int matheloai = Convert.ToInt32(Request.QueryString["matheloai"]);

            SqlCommand sqlCmd2 = new SqlCommand("select tentheloai from tblTheLoai where MaTheLoai=" + matheloai + "", conn);
            DataSet dt2 = new DataSet();
            SqlDataAdapter sqlAdap2 = new SqlDataAdapter(sqlCmd2);
            sqlAdap2.Fill(dt2);
            Repeater1.DataSource = dt2;
            Repeater1.DataBind();

            SqlCommand sqlCmd = new SqlCommand("select tblTinBai.* from tblTinBai,tblTheLoai where tblTinBai.MaTheLoai=tblTheLoai.MaTheLoai and tblTinBai. MaTheLoai=" + matheloai + "", conn);
            DataSet dt = new DataSet();
            SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
            sqlAdap.Fill(dt);
            Rptinmuc.DataSource = dt;
            Rptinmuc.DataBind();

            

            conn.Close();

            //cbTinh.DataSource = dt;
            //cbTinh.DataValueField = "MaTinh";
            //cbTinh.DataTextField = "TenTinh";
            //cbTinh.DataBind();
            //conn.Close();
            //Dong ket noi
        }
    }
}