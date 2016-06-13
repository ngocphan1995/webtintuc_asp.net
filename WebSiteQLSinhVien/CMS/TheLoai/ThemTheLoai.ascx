<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ThemTheLoai.ascx.cs" Inherits="CMS_ThemTheLoai" %>
<div class="themtl">
    <h3>Thêm thể loại</h3>
<div class="row" >
    <div class="col-md-3"><span>Tên thể loại:</span></div>
    <div class="col-md-5 ">
            <asp:TextBox ID="txtTenTheLoai" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
 </div>
       
            <asp:Button ID="tbnCapNhat" runat="server" Text="Cập nhật" OnClick="tbnCapNhat_Click" CssClass=" tbnCapNhat btn btn-default" />
    </div>
        