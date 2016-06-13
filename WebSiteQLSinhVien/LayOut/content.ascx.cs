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

public partial class LayOut_content : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        slide.Controls.Add(LoadControl("../LayOut/slide.ascx"));
        left.Controls.Add(LoadControl("left.ascx"));
        right.Controls.Add(LoadControl("../LayOut/right.ascx"));
        
        center.Controls.Add(LoadControl("center.ascx"));
    }

}
