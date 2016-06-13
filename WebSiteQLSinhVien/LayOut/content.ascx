<%@ Control Language="C#" AutoEventWireup="true" CodeFile="content.ascx.cs" Inherits="LayOut_content" %>
 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
      <li class="active"><a href="Default.aspx">Trang Chủ</a></li>
        <li><a href="#">Giới Thiệu</a></li> 
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Tin Tức
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="Default.aspx?content=tinmuc&matheloai=2">Giáo Dục</a></li>
          <li><a href="Default.aspx?content=tinmuc&matheloai=3">Văn Hóa</a></li>
          <li><a href="Default.aspx?content=tinmuc&matheloai=1">Xã Hội</a></li> 
        </ul>
      </li>
      <li><a href="?content=dslop">Danh Sách Sinh Viên</a></li> 
       <li><a href="#">Hỏi Đáp</a></li> 
      <li><a href="#">Diễn Đàn</a></li>
        <li><a href="#">Liên Hệ</a></li> 
        <li><a href="#">Tìm Kiếm</a></li> 
    </ul>
  </div>
</nav>
<div class="row"> 
    <div class="slide" style="width:1180px;">
    <asp:PlaceHolder ID="slide" runat="server"></asp:PlaceHolder>
      </div>
<div class="col-md-3 left">
   
            <asp:PlaceHolder ID="left" runat="server"></asp:PlaceHolder>
       </div>
<div class="col-md-6 center">
        <asp:PlaceHolder ID="center" runat="server"></asp:PlaceHolder>
  </div>

       <div class="col-md-3 right">
           <asp:PlaceHolder ID="right" runat="server"></asp:PlaceHolder>

       </div>
   
</div>