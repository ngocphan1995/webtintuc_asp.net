<%@ Control Language="C#" AutoEventWireup="true" CodeFile="content.ascx.cs" Inherits="WebSite31_Lich_thi_hoc_content" %>
<asp:Repeater ID="Repeater1" runat="server">
     <HeaderTemplate>
<table border="0" width="100%">
</HeaderTemplate>

<ItemTemplate>
    <tr>
        <td>
            <div class="col-md-12"><h4><%# Eval("TieuDe") %></h4></div>
        </td>
    </tr>
    <tr>
        <td>
        <div class="row col-md-12"><p style="text-align:justify"><%# Eval("NoiDung") %></p></div<br />
         <div class="row col-md-12"><p style="text-align:left">Thời gian bắt đầu:<%# Eval("ThoiGianBatDau") %></p></div><br />
         <div class="row col-md-12"><p style="text-align:left">Thời gian kết thúc:<%# Eval("ThoiGianKetThuc") %></p></div><br />
             <div class="row col-md-12"><p style="text-align:left">Địa điểm:<%# Eval("DiaChi") %></p></div>
         </td>
    </tr>
    
</ItemTemplate>

<FooterTemplate>
</table>
</FooterTemplate>
</asp:Repeater>


