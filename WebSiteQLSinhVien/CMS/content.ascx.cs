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

public partial class CMS_content : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        left.Controls.Add(LoadControl("left.ascx"));
        string c = Request.QueryString["content"];
        string b = Request.QueryString["MaTheLoai"];
        string a = Request.QueryString["MaBaiTin"];
        string d = Request.QueryString["MaQuangCao"];
           if (c == "themtin")
               center.Controls.Add(LoadControl("TinTuc/ThemTinBai.ascx"));
           else if (c == "dstin" || a != null)
               center.Controls.Add(LoadControl("TinTuc/DanhSachTinBai.ascx"));
           else if (c == "themtheloai")
               center.Controls.Add(LoadControl("TheLoai/ThemTheLoai.ascx"));
           else if (c == "dstheloai" || b != null) center.Controls.Add(LoadControl("TheLoai/danh_sach_the_loai.ascx"));
           else if (c == "timkiem") center.Controls.Add(LoadControl("TinTuc/TimKiem.ascx"));
           else if (c == "dslich") center.Controls.Add(LoadControl("LichThiLichHoc/DanhsachLich.ascx"));
           else if (c == "themlich") center.Controls.Add(LoadControl("LichThiLichHoc/ThemLich.ascx"));
           else if (c == "themqc") center.Controls.Add(LoadControl("QuangCao/ThemQC.ascx"));
           else if (c == "dssv") center.Controls.Add(LoadControl("SinhVien/DSSV.ascx"));
           else if (c == "addsv") center.Controls.Add(LoadControl("SinhVien/ThemSV.ascx"));
           else if (c == "searchsv") center.Controls.Add(LoadControl("SinhVien/Search.ascx"));
           else if (c == "dsdiem") center.Controls.Add(LoadControl("Diem/DanhsachDiem.ascx"));
           else if (c == "themdiem") center.Controls.Add(LoadControl("Diem/ThemDiem.ascx"));
           else if (c == "timdiem") center.Controls.Add(LoadControl("Diem/TimDiem.ascx"));
           else if (d != null) center.Controls.Add(LoadControl("QuangCao/ThemQC.ascx"));
           else
               center.Controls.Add(LoadControl("center.ascx"));
        
    }
}
