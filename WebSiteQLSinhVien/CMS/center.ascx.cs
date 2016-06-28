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
using NgocPhan;
using System.Data.SqlClient;

public partial class CMS_center : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (var con = SQL.GetConnection())
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT (*) FROM tblUser", con);
                Label1.Text = cmd.ExecuteScalar().ToString();
                cmd = new SqlCommand("SELECT COUNT (*) FROM SinhVien", con);
                ltrSVCount.Text = cmd.ExecuteScalar().ToString();
                cmd = new SqlCommand("SELECT COUNT (*) FROM tblTinBai", con);
                ltrSVBV.Text = cmd.ExecuteScalar().ToString();
            }
        }
    }
}
