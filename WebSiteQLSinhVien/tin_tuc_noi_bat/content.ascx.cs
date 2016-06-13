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

public partial class tin_tuc_noi_bat_content : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Load_data();

    }
    protected SqlConnection connect()
    {
        string connectionstring = @"server=NGOC-KUTE\NGOCPHANTHI;uid=sa;pwd=123456;database=D8CNPM";
        return new SqlConnection(connectionstring);
    }
    void Load_data()
    {
        using (SqlConnection conn = connect())
        {
            conn.Open();
           int matin= Convert.ToInt32(Request.QueryString["id"]);
           SqlCommand sqlCmd = new SqlCommand("SELECT MaTinTuc,[HinhDaiDien], [Mota], [TieuDe], [NoiDung], [NgayUpdate] FROM [tblTinBai] where MaTinTuc="+matin+"", conn);
            DataSet dt = new DataSet();
            SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
            sqlAdap.Fill(dt);
            RpTinTuc.DataSource = dt;
            RpTinTuc.DataBind();
            conn.Close();

            //cbTinh.DataSource = dt;
            //cbTinh.DataValueField = "MaTinh";
            //cbTinh.DataTextField = "TenTinh";
            //cbTinh.DataBind();
            //conn.Close();
            //Dong ket noi
        }
    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DataGrid1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
