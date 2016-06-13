<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ThemSV.ascx.cs" Inherits="WebSiteQLSinhVien_CMS_SinhVien_ThemSV" %>
<div class="themtl">
    <h3>Thêm Mới Sinh Viên</h3>
    <div class="row">
        <div class="col-md-3"><span>Họ Tên:</span></div>
        <div class="col-md-6">
            <asp:TextBox ID="txtHoten" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="row">
       <div class="col-md-3"><span>Lớp:</span></div>
        <div class="col-md-6">  <asp:DropDownList ID="cbLop"  runat="server" CssClass="form-control"></asp:DropDownList></div>
       
            
    </div>
    <div class="row">
       <div class="col-md-3"><span>Khoa:</span></div>
        <div class="col-md-6">  <asp:DropDownList ID="cbKhoa"  runat="server" CssClass="form-control"></asp:DropDownList></div>     
            
    </div>
    <div class="row">
        <div class='col-md-3'>
                  <span>Ngày Sinh:</span>  
                    </div>
            <div class="form-group input-group date datetimepicker1">
                
                <div class='col-md-6'>
                    <asp:TextBox ID="txtngaysinh" runat="server"  class="form-control dp-bt"></asp:TextBox>
                    </div>
                    <span class="input-group-btn col-md-2">
                            <button type="button" class="btn btn-primary" onclick="$('.dp-bt').datetimepicker('show');"><i class="fa fa-calendar"></i></button>
                        </span>
                
            </div>
        </div>
    <div class="row">
       <div class="col-md-3"><span>Giới Tính:</span></div>
        <div class="col-md-6">   
            <asp:RadioButton ID="radNam"  class="radGioTinh" runat="server"/>Nam&nbsp;&nbsp; 
            <asp:RadioButton ID="radNu"  class="radGioTinh" runat="server"/>Nữ

        </div>     
            
    </div>
    
     <div class="row">
        <div class="col-md-3"><span>Quê Quán:</span></div>
        <div class="col-md-6">
            <asp:TextBox ID="txtdiachi" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3"><span>Số Điện Thoại:</span></div>
        <div class="col-md-6">
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3"><span>Ảnh đại diện:</span></div>
        <div class="col-md-6">
            <asp:FileUpload ID="fileInput" runat=server />
        </div>
    </div>
    <div class="row">
        <asp:Button ID="btnThemSV" runat="server" Text="Thêm" CssClass="btn btn-default" OnClick="btnThemSV_Click"/>
    </div>
</div>
