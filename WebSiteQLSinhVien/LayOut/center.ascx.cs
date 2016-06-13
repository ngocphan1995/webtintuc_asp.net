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

public partial class LayOut_center : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string c = Request.QueryString["content"];
        if (c == "cttin")
        {
            content_defaut.Controls.Add(LoadControl("../tin_tuc_noi_bat/content.ascx"));
        }
        else if (c == "lich")
        {
             content_defaut.Controls.Add(LoadControl("../Lich_thi_hoc/content.ascx"));
             
        }
        else if (c == "licht")
        {

            content_defaut.Controls.Add(LoadControl("../Lich_thi_hoc/Default.ascx"));
        }
        else if (c == "tinmuc")
        {
            content_defaut.Controls.Add(LoadControl("../tin_tuc_noi_bat/tinmuc.ascx"));
        }
        else if (c == "dslop")
        {
            content_defaut.Controls.Add(LoadControl("../SinhVien/DSLop.ascx"));
        }
        else if (c == "diem")
        {
            content_defaut.Controls.Add(LoadControl("../SinhVien/DiemSV.ascx"));
        }
        else
            content_defaut.Controls.Add(LoadControl("content_defaut.ascx"));
    }
}
