<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DanhsachDiem.ascx.cs" Inherits="WebSiteQLSinhVien_CMS_Diem_DanhsachDiem" %>
<div class="themdiem">
    <h3>Cập nhật Danh sách điểm</h3>
    <div class="row">
        <div class="col-md-3"><span>Mã sinh viên:</span></div>
        <div class="col-md-6">
            <asp:TextBox ID="txtMaSv" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3"><span>Môn học:</span></div>
        <div class="col-md-6">
            <asp:DropDownList ID="ddlMonHoc" runat="server" DataTextField="TenMon" DataValueField="MaMon" CssClass="form-control">
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
    <div class="row">
        <div class="col-md-3"><span>Điểm tổng kết:</span></div>
        <div class="col-md-6">
            <asp:TextBox ID="txtdiemTK" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    
    <div class="row">  
        <asp:Button ID="btnUpdateDiem" runat="server" Text="Cập nhật" CssClass="btn btn-default" OnClick="btnUpdateDiem_Click" />
    </div>
    <h3>Danh sách điểm</h3>
</div>


<asp:Repeater ID="DSDiem" runat="server">
    <HeaderTemplate><table border="1" width="100%">
        <tr> 
            <td>Mã Sinh Viên</td>
            <td>Tên</td>
            <td>Môn Học</td>
            <td>Điểm Thành Phần</td>
            <td>Điểm Thi</td>
            <td>Điểm Tổng Kết</td>
            <td>Ngày Cập Nhật</td>
            <td></td>
            <td></td>
        </HeaderTemplate>
    <ItemTemplate>

        <tr> 
            <td><%# Eval("MaSV") %></td>
            <td><%# Eval("HoTen") %></td>
            <td><%# Eval("MaMon") %></td>           
            <td><%# Eval("DiemTP") %></td>
            <td><%# Eval("DiemThi") %></td>
            <td><%# Eval("DiemTongKet") %></td>
            <td><%# Eval("NgayCapNhat") %></td>
            <td><a href="?content=dsdiem&action=0&Masv=<%# Eval("MaSV") %>&MaMon=<%# Eval("MaMon") %>">Sửa</a></td>
            <td><a href="?content=dsdiem&action=1&MaSV=<%# Eval("MaSv") %>&MaMon=<%# Eval("MaMon") %>">Xóa</a></td>
        </tr>
    </ItemTemplate>
    <FooterTemplate></table></FooterTemplate>
</asp:Repeater>
<asp:Button ID="btnExport" runat="server" Text="Tải về" OnClick = "ExportToExcel" />
