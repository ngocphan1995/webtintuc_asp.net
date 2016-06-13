using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebSiteQLSinhVien_CMS_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
            Response.Redirect("login.aspx");

        header.Controls.Add(LoadControl("header.ascx"));
        content.Controls.Add(LoadControl("content.ascx"));
        footer.Controls.Add(LoadControl("footer.ascx"));
    }
}