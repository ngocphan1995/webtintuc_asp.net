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
using System.Data;
public partial class CMS_danh_sach_the_loai : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Load_data();

        if (Convert.ToInt32(Request.QueryString["MaTheLoai"]) > 0)
        {
            read_data(Convert.ToInt32(Request.QueryString["MaTheLoai"]));
        }
    }
    protected void Command(Object sender, DataGridCommandEventArgs e)
    {
        switch (((LinkButton)e.CommandSource).CommandName)
        {
            case "Xoa":
                DeleteItem(e);
                break;
            case "Sua":
                SuaItem(e);
                break;
            default:
                // Do nothing.
                break;
        }
    }
    protected SqlConnection connect()
    {
        string connectionstring = @"server=NGOC-KUTE\NGOCPHANTHI;uid=sa;pwd=123456;database=D8CNPM";
        return new SqlConnection(connectionstring);
    }
    void SuaItem(DataGridCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        Response.Redirect(Request.Url.AbsolutePath + "?MaTheLoai=" + id);
        //Response.Redirect("Default.aspx?content=dstheloai?MaTheLoai=" + id + "");
       
    }
    void DeleteItem(DataGridCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        using (SqlConnection conn = connect())
        {
            conn.Open();
            SqlCommand sqlCmd = new SqlCommand("xoa_TheLoai", conn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Add("@id", id);
            DataSet ds = new DataSet();
            SqlDataAdapter adap = new SqlDataAdapter(sqlCmd);
            adap.Fill(ds);
            sqlCmd.ExecuteNonQuery();
        }
        Load_data();
    }
    void Load_data()
    {
        using (SqlConnection conn = connect())
        {
            conn.Open();
            SqlCommand sqlCmd = new SqlCommand("select * from tblTheLoai", conn);
            DataSet dt = new DataSet();
            SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);
            sqlAdap.Fill(dt);
            grdTheLoai.DataSource = dt;
            grdTheLoai.DataBind();
            conn.Close();

            
        }
    }
    void read_data(int matheloai)
    {
        SqlConnection conn = connect();
        //Them 1 ban ghi moi vao bang tblUser
        conn.Open();
        SqlCommand sqlCmd = new SqlCommand("select * from tblTheLoai WHERE MaTheLoai=" + matheloai + "", conn);
        SqlDataReader reader = sqlCmd.ExecuteReader();
        if (reader.Read())
        {
            txttentheloai.Text = reader["TenTheLoai"].ToString(); ;
        }
        conn.Close();
    }
    protected void btncapnhat_Click(object sender, EventArgs e)
    {
       int id = Convert.ToInt32(Request.QueryString["MaTheLoai"]);
        using (SqlConnection conn = connect())
        {
            conn.Open();
            if (id > 0)
            {
                SqlCommand sqlCmd = new SqlCommand("update_TheLoai", conn);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.Add("@id", Request.QueryString["MaTheLoai"]);
                sqlCmd.Parameters.Add("@tentheloai", txttentheloai.Text);
                DataSet ds = new DataSet();
                SqlDataAdapter adap = new SqlDataAdapter(sqlCmd);
                adap.Fill(ds);
                sqlCmd.ExecuteNonQuery();
            }
            else
            {
                
                SqlCommand sqlCmd = new SqlCommand("NhapTheLoai", conn);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.Add("@tentheloai", txttentheloai.Text);
                sqlCmd.ExecuteNonQuery();
                conn.Close();
            }
        }
        Load_data();
    }
   
    protected void grdTheLoai_ItemCommand(object source, DataGridCommandEventArgs e)
    {

    }
}
