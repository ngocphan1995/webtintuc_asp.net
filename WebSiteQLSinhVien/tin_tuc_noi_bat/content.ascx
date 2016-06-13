<%@ Control Language="C#" AutoEventWireup="true" CodeFile="content.ascx.cs" Inherits="tin_tuc_noi_bat_content" %>
<asp:Repeater ID="RpTinTuc" runat="server">
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
        <div class="row col-md-12"><p style="text-align:justify"><%# Eval("NoiDung") %></p></div>
         </td>
    </tr>
    
</ItemTemplate>

<FooterTemplate>
</table>
</FooterTemplate>
</asp:Repeater>
