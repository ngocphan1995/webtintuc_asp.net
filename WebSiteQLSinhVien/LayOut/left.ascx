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

<img src="images/Libol.jpg"style="width: 270px;" />
 
<div style="margin-top:10px; ">
<img src="images/ngon-ngu-lap-trinh-tot-nhat-28092015.jpg"style="width: 270px;border:1px solid #fff" />
</div>
<div style="margin-top:10px; ">
<img src="images/MOBILE2.jpg"style="width: 270px;border:1px solid #fff" />
</div>