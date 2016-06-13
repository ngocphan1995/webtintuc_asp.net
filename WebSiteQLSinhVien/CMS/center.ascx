<%@ Control Language="C#" AutoEventWireup="true" CodeFile="center.ascx.cs" Inherits="CMS_center" %>
 <h3>Bảng điều khiển quản trị viên</h3>

    <div class="row state-overview">
        <div class="col-sm-6 col-lg-3">
            <section class="panel">
                <div class="symbol red">
                    <i class="fa fa-user"></i>
                </div>
                <div class="value">
                    <h1 class="count4"> <asp:Label ID="Label1" runat="server" OnLoad="Page_Load"></asp:Label></h1>
                    <p>Người dùng</p>
                </div>
            </section>
        </div>
        <div class="col-sm-6 col-lg-3">
            <section class="panel">
                <div class="symbol terques">
                    <i class="fa fa-graduation-cap"></i>
                </div>
                <div class="value">
                    <h1 class="count2"><asp:Literal  runat="server" ID="ltrSVCount"/></h1>
                    <p>Số sinh viên</p>
                </div>
            </section>
        </div>
        <div class="col-sm-6 col-lg-3">
            <section class="panel">
                <div class="symbol terques">
                    <i class="fa fa-newspaper-o"></i>
                </div>
                <div class="value">
                    <h1 class="count3"><asp:Literal  runat="server" ID="Literal1"/></h1>
                    <p>Số bài viết</p>
                </div>
            </section>
        </div>
    </div>
