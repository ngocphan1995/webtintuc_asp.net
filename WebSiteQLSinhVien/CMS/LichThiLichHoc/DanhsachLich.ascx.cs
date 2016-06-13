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
public partial class CMS_DanhsachLich : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Load_data();
    }
    void Load_data()
    {
        using (var conn = SQL.GetConnection())
        {
            //conn.Open();
            SqlCommand sqlCmd = new SqlCommand("select*from LichThi", conn);
            DataSet dt = new DataSet();
            SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
            sqlAdap.Fill(dt);
            grdLich.DataSource = dt;
            grdLich.DataBind();
            conn.Close();


            //Dong ket noi
        }
    }
    protected void btncapnhatLich_Click(object sender, EventArgs e)
    {

    }
    protected void grdLich_ItemCommand(object source, DataGridCommandEventArgs e)
    {

    }
    protected void grdLich_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {

    }
}
