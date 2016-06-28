<%@ Control Language="C#" AutoEventWireup="true" CodeFile="right.ascx.cs" Inherits="LayOut_right" %>
<div >
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
     <ItemTemplate>
         <div class="row quangcaophai">
    <img src="Upload/images/quangcao/<%# Eval("HinhAnh") %>" style="width:228px" />
        </div>
         </ItemTemplate>
</asp:Repeater>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:D8CNPMConnectionString %>" SelectCommand="SELECT [HinhAnh] FROM [D8CNPM].[dbo].[QuangCao] where ViTriQuangCao ='Phai'"></asp:SqlDataSource>

</div>
