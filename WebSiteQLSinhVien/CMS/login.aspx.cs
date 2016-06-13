using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void tbnDangNhap_Click(object sender, EventArgs e)
    {
        string connectionstring = @"server=NGOC-KUTE\NGOCPHANTHI;uid=sa;pwd=123456;database=D8CNPM";
        SqlConnection con = new SqlConnection(connectionstring);
        con.Open();

       

        SqlCommand sqlCmd = new SqlCommand("KiemTraUser", con);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@username", txtUsername.Text);
        sqlCmd.Parameters.Add("@password", txtPassword.Text);
        
        DataSet ds = new DataSet();
        SqlDataAdapter adap = new SqlDataAdapter(sqlCmd);
        adap.Fill(ds);
        con.Close();
        con.Dispose();
        if (ds.Tables[0].Rows.Count > 0)
        {
             Session["UserName"] = txtUsername.Text;
             Session["PassWord"] = txtPassword.Text;
             Response.Redirect("Default.aspx");
        }
        else
        {
            thongbao.Visible = true;
            thongbao.Text = "Bạn vào username hoặc password chưa đúng!";
        }
        
    }
    
}
