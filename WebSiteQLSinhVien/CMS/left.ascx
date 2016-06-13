<%@ Control Language="C#" AutoEventWireup="true" CodeFile="left.ascx.cs" Inherits="CMS_left" %>
<aside>
      <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
                  <li>
                      <a class="active" href="../Default.aspx">
                          <i class="fa fa-dashboard"></i>
                          <span>Trang chủ</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-laptop"></i>
                          <span>Quản lý Thể loại</span>
                      </a>
                      <ul class="sub">
                          <li> <a href="Default.aspx?content=themtheloai">Thêm Thể loại</a></li>
                           <li><a href="Default.aspx?content=dstheloai">Danh sách Thể loại</a></li>
                      </ul>
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-book"></i>
                          <span>Quản lý tin bài</span>
                      </a>
                      <ul class="sub">
                          <li><a href="Default.aspx?content=dstin">Danh sách tin bài</a></li>
                         <li> <a href="Default.aspx?content=themtin">Thêm tin bài</a></li>
                        <li><a href="Default.aspx?content=timkiem">Tìm kiếm</a></li>
                      </ul>
                  </li>
                 
                 
                   <li class="sub-menu">
                      <a  href="login.html">
                          <i class="fa fa-user"></i>
                          <span>Quản lý TT Sinh Viên</span>
                      </a>
                        <ul class="sub">
                          <li><a href="Default.aspx?content=dssv">Danh sách sinh viên</a></li>
                          <li><a href="Default.aspx?content=addsv">Thêm sinh viên</a></li>
                          <li><a href="Default.aspx?content=searchsv">Tìm kiếm</a></li>
                      </ul>
                  </li>
                   
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class=" fa fa-bar-chart-o"></i>
                          <span>Quản lý điểm</span>
                      </a>
                      <ul class="sub">
                          <li><a href="Default.aspx?content=dsdiem">Danh sách điểm</a></li>
                          <li><a href="Default.aspx?content=themdiem">Thêm điểm</a></li>
                          <li><a href="Default.aspx?content=timdiem">Tìm kiếm</a></li>
                      </ul>
                  </li>
                   <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-tasks"></i>
                          <span>Quản lý lịch thi,học,kiểm tra</span>
                      </a>
                      <ul class="sub">
                           <li><a href="Default.aspx?content=dslich">Danh sách Lịch</a></li>
                           <li><a href="Default.aspx?content=themlich">Thêm Lịch</a></li>
                           <li><a href="Default.aspx?content=themtin">Tìm kiếm</a></li>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-th"></i>
                          <span>Quản lý quảng cáo</span>
                      </a>
                      <ul class="sub">
                          <li><a href="Default.aspx?content=themqc">Thêm quảng cáo</a></li>
                          <li><span>Danh sách quảng cáo</span></li>
                      </ul>
                  </li>
                 
                  <li>
                      <a  href="login.aspx">
                          <i class="fa fa-user"></i>
                          <span>Login Page</span>
                      </a>
                  </li>

                  <!--multi level menu start-->
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-sitemap"></i>
                          <span>Multi level Menu</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="javascript:;">Menu Item 1</a></li>
                          <li class="sub-menu">
                              <a  href="boxed_page.html">Menu Item 2</a>
                              <ul class="sub">
                                  <li><a  href="javascript:;">Menu Item 2.1</a></li>
                                  <li class="sub-menu">
                                      <a  href="javascript:;">Menu Item 3</a>
                                      <ul class="sub">
                                          <li><a  href="javascript:;">Menu Item 3.1</a></li>
                                          <li><a  href="javascript:;">Menu Item 3.2</a></li>
                                      </ul>
                                  </li>
                              </ul>
                          </li>
                      </ul>
                  </li>
                  <!--multi level menu end-->

              </ul>
              <!-- sidebar menu end-->
          </div>    
      </aside>