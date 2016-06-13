<%@ Control Language="C#" AutoEventWireup="true" CodeFile="content_defaut.ascx.cs" Inherits="LayOut_right" %>
<%@ Import Namespace="System.Data" %>
<h3>Tin Nổi Bật</h3>
<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
</HeaderTemplate>

<ItemTemplate>
     <div class="row">
               <span class="titile"><a href='Default.aspx?content=cttin&id=<%# DataBinder.Eval(Container.DataItem, "MaTinTuc")%>'><%# Eval("TieuDe") %></a></span>
           </div>
         <div  class="row">
             <div class="col-md-3">
     <img src='Upload/images/<%# DataBinder.Eval(Container.DataItem, "HinhDaiDien") %>'  
alt="" style="height:100px;width:100px;border:1px solid #fff; margin-left:10px"/>
              </div>
             <div class="col-md-7">
         <p>
             <%# Eval("Mota") %>
         </p>
                 </div>
          </div>
     
    
</ItemTemplate>

<FooterTemplate>
</FooterTemplate>
</asp:Repeater>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:D8CNPMConnectionString %>" SelectCommand="SELECT Top 5 [MaTinTuc], [MaTheLoai], [NgayUpdate], [NoiDung], [TrangThaiTin], [HinhDaiDien], [Mota], [TieuDe] FROM [tblTinBai] order by NgayUpdate desc"></asp:SqlDataSource>

<div class="row banner">
    <img src="Upload/images/CLC_EPU.jpg" style="width:100%;height:100px"/>
</div>
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
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:D8CNPMConnectionString %>" SelectCommand="SELECT TOP 5 MaLich,[TieuDe] FROM [LichThi] order by MaLich desc"></asp:SqlDataSource>

