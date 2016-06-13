<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DiemSV.ascx.cs" Inherits="WebSiteQLSinhVien_SinhVien_DiemSV" %>
<div class="themtl">
    <h3>Điểm Sinh Viên </h3>      
    </div>
<asp:Repeater ID="DiemSV" runat="server">
    <HeaderTemplate><table border="1" width="100%">
        <div class="row">
            <span><%# Eval("HoTen") %></span>
        </div>
        <tr>            
            <td>Mã Sinh Viên</td>
            <td>Môn</td>
            <td>Điểm TP</td>            
            <td>Điểm Thi</td>
            <td>Điểm Tổng Kết</td>
            <td>Ngày Cập Nhật</td>
            
        </HeaderTemplate>
    <ItemTemplate>

        <tr>            
            <td><%# Eval("MaSV") %></td>
            <td><%# Eval("TenMon") %></td>
            <td><%# Eval("DiemTP") %></td>           
            <td><%# Eval("DiemThi") %></td>
            <td><%# Eval("DiemTongKet") %></td>
            <td><%# Eval("NgayCapNhat") %></td>
            
        </tr>
    </ItemTemplate>
    <FooterTemplate></table></FooterTemplate>
</asp:Repeater>
<table>
    <tr>
        <td>Điểm trung bình:</td>
        <td><asp:Label ID="DiemTB" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <td>Xếp loại:</td>
        <td><asp:Label ID="XepLoai" runat="server" Text=""></asp:Label></td>
    </tr>
</table>
