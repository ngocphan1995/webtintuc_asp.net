<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ThemLich.ascx.cs" Inherits="WebSite31_CMS_LichThiLichHoc_ThemLich" %>
<div class="themtl">
    <h3>Thêm lịch</h3>
    <div class="row">
        <div class="col-md-3"><span>Tiêu Đề:</span></div>
        <div class="col-md-6">
            <asp:TextBox ID="txttieude" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="row">
       <div class="col-md-3"><span>Nội  Dung:</span></div>
        <div class="col-md-6"> <asp:TextBox ID="txtnoidung" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox></div>
       
            
          </div>
    <div class="row">
            <div class="form-group input-group date datetimepicker1">
                <div class='col-md-4'>
                  <span>Thời gian bắt đầu:</span>  
                    </div>
                <div class='col-md-6'>
                    <asp:TextBox ID="txtngaybatdau" runat="server"  class="form-control dp-bt"></asp:TextBox>
                    </div>
                    <span class="input-group-btn col-md-2">
                            <button type="button" class="btn btn-primary" onclick="$('.dp-bt').datetimepicker('show');"><i class="fa fa-calendar"></i></button>
                        </span>
                
            </div>
        </div>
    <div class="row">
            <div class="form-group input-group date datetimepicker1">
                <div class='col-md-5'>
                  <span>Thời gian kết thúc:</span>  
                    </div>
                <div class='col-md-5'>
                    <asp:TextBox ID="txtketthuc" runat="server"  class="form-control dp-ketthuc"></asp:TextBox>
                    </div>
                    <span class="input-group-btn col-md-2">
                            <button type="button" class="btn btn-primary" onclick="$('.dp-ketthuc').datetimepicker('show');"><i class="fa fa-calendar"></i></button>
                        </span>
                
            </div>
        </div>
     <div class="row">
        <div class="col-md-3"><span>Địa Chỉ:</span></div>
        <div class="col-md-6">
            <asp:TextBox ID="txtdiachi" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <asp:Button ID="btnthemLich" runat="server" Text="Thêm mới" CssClass="btn btn-default" OnClick="btnthemLich_Click"/>
    </div>
</div>