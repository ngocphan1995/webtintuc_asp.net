<%@ Control Language="C#" AutoEventWireup="true" CodeFile="left.ascx.cs" Inherits="LayOut_left" %>
<div>
    <div class="clearfix panel metismenu">
	<aside class="sidebar">
		<nav class="sidebar-nav">
			<ul id="Ul1">
					<li><a href="#"> Tin Tức</a>
										<span class="fa arrow expand">&nbsp;</span>
					<ul class="collapse" aria-expanded="false" style="height: 0px;">
		<asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
            <li><a href="Default.aspx?content=tinmuc&matheloai=<%# DataBinder.Eval(Container.DataItem, "MaTheLoai")%>"><%# DataBinder.Eval(Container.DataItem, "tentheloai")%></a></li>
             </ItemTemplate>
            </asp:Repeater>
</ul>
                        </li>
				 <li><a href="Default.aspx?content=licht">Lịch Thi</a></li>
            <li><a href="?content=dslop">Danh sách sinh viên</a></li>
            <li><a href="CMS/Default.aspx">Admin</a></li>
			</ul>
		</nav>
	</aside>
</div>
    <script type="text/javascript">
        $(function () {
            $('#Ul1').metisMenu({
                toggle: false
            });
        });
</script>
  </div>     
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:D8CNPMConnectionString %>" SelectCommand="SELECT * FROM [tblTheLoai]"></asp:SqlDataSource>


<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
     <ItemTemplate>
         <img src="Upload/images/quangcao/<%# Eval("HinhAnh") %>"style="width: 270px;border:1px solid #fff" />
         </ItemTemplate>
</asp:Repeater>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:D8CNPMConnectionString %>" SelectCommand="SELECT [HinhAnh]FROM [D8CNPM].[dbo].[QuangCao] where ViTriQuangCao='Bên Trái'"></asp:SqlDataSource>
