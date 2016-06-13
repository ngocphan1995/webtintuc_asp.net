<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ThemDiem.ascx.cs" Inherits="WebSiteQLSinhVien_CMS_Diem_ThemDiem" %>
<div class="themdiem">
    <h3>Nhập Điểm cho sinh viên</h3>
    <div class="row">
        <div class="col-md-3"><span>Mã sinh viên:</span></div>
        <div class="col-md-6">
            <asp:TextBox ID="txtMaSv" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3"><span>Môn học:</span></div>
        <div class="col-md-6">
            <asp:DropDownList ID="ddlMonHoc" runat="server" DataTextField="TenMon" DataValueField="MaMon">
            </asp:DropDownList>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3"><span>Điểm thành phần:</span></div>
        <div class="col-md-6">
            <asp:TextBox ID="txtDiemTP" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3"><span>Điểm thi:</span></div>
        <div class="col-md-6">
            <asp:TextBox ID="txtDiemThi" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="row" style="margin-left:300px">  
        <asp:Button ID="btnThemDiem" runat="server" Text="Thêm" CssClass="btn btn-default" OnClick="btnThemDiem_Click" />
    </div>
    
</div>
