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

public partial class tin_tuc_noi_bat_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        header.Controls.Add(LoadControl("../LayOut/header.ascx"));
        content.Controls.Add(LoadControl("content.ascx"));
        footer.Controls.Add(LoadControl("../LayOut/footer.ascx"));
    }
}