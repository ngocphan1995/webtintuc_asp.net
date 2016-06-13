<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Default.ascx.cs" Inherits="WebSite31_Lich_thi_hoc_content" %>
<h3>Lịch thi,lịch học</h3>
<asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
     <HeaderTemplate>
<table border="0" width="100%">
</HeaderTemplate>

<ItemTemplate>
 <tr>
     <td>
             <div class="col-md-7">
         <p>
             <ul>
                 <li><a href='Default.aspx?content=lich&id=<%# DataBinder.Eval(Container.DataItem, "MaLich")%>'><%# Eval("TieuDe") %></li>
             </ul>
         </p>
                 </div>
          </div>
       </td>
     
  </tr>
    
</ItemTemplate>

<FooterTemplate>
</table>
</FooterTemplate>
</asp:Repeater>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:D8CNPMConnectionString %>" SelectCommand="SELECT MaLich,[TieuDe] FROM [LichThi] order by MaLich desc"></asp:SqlDataSource>

