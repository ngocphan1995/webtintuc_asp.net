<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DSLop.ascx.cs" Inherits="WebSiteQLSinhVien_SinhVien_DSLop" %>
<div class="themtl">
    <h3>Danh sách sinh viên</h3>
    <table>
        <tr>
            <td>
                <div class="row1">
                    <div class="col-md-3"><span>Lớp:</span></div>
                    <div class="col-md-7">  <asp:DropDownList ID="cbLop"  runat="server" CssClass="form-control" Width="200px"></asp:DropDownList></div>       
            
    </div>   </td>
        </tr>
        <tr>
            <td>
                <div class="row" style="margin-left: 100px;
    margin-top: 10px;">
                <asp:Button ID="btnLoc" runat="server" Text="Lọc" CssClass="btn btn-default" OnClick="btnLoc_Click"/>
                 </div>

            </td>
        </tr>
    </table>  
    </div>
<table border="1" width="100%" class="table table-bordered table-hover">
<asp:Repeater ID="DSLop" runat="server">
    <HeaderTemplate>
        <tr>            
            <td>ID</td>
            <td>Tên</td>
            <td>Lớp</td>
            <!--<td>Khoa</td>-->
            <td>Ngày Sinh</td>
            <td>Giới Tính</td>
            <td>Địa Chỉ</td>
            <td>Phone</td>
            <td>Ảnh đại diện</td>
            <td></td>
           </tr>
        </HeaderTemplate>
    <ItemTemplate>

        <tr>            
            <td><%# Eval("MaSV") %></td>
            <td><%# Eval("HoTen") %></td>
            <td><%# Eval("TenLop") %></td>
           
            <td><%# Eval("NgaySinh") %></td>
            <td><%# Eval("GioiTinh") %></td>
            <td><%# Eval("QueQuan") %></td>
            <td><%# Eval("SDT") %></td>
            <td><div style="width:65px;height:65px"><image src="Upload/images/<%# Eval("Avata") %>" style="width:65px;"></image></div></td>
            <td><a href="?content=diem&Masv=<%# Eval("MaSV") %>">Điểm</a></td>
        </tr>
    </ItemTemplate>
    <FooterTemplate></FooterTemplate>
</asp:Repeater>
    </table>
  
