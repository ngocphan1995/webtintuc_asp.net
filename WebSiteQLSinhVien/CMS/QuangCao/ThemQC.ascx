<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ThemQC.ascx.cs" Inherits="CMS_ThemTinBai" %>

<div class="themtt">
   
    
    <h3> Màn Hình Thêm Quảng Cáo</h3>
     <div class="row">
       <div class="col-md-3"> <span>Tiêu đề:</span></div>
           <div class="col-md-7"> <asp:TextBox ID="tieude" runat="server" CssClass="form-control" ></asp:TextBox></div>
         </div>
     <div class="row">
      <div class="col-md-3"> <span>Hình ảnh:</span></div>
          <div class="col-md-7">  <asp:FileUpload ID="fileInput" runat=server /></div>
         </div>
             <div class="row">
            
       <div class="col-md-3"><span>Link liên kết:</span></div>
           <div class="col-md-7"> <asp:TextBox ID="linhlk" runat="server" CssClass="form-control" ></asp:TextBox></div>
                 </div>
    <div class="row">
            <div class=" date datetimepicker1">
                <div class='col-md-3'>
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
            <div class=" date datetimepicker1">
                <div class='col-md-3'>
                  <span>Thời gian kết thúc:</span>  
                    </div>
                <div class='col-md-6'>
                    <asp:TextBox ID="txtketthuc" runat="server"  class="form-control dp-ketthuc"></asp:TextBox>
                    </div>
                    <span class="input-group-btn col-md-2">
                            <button type="button" class="btn btn-primary" onclick="$('.dp-ketthuc').datetimepicker('show');"><i class="fa fa-calendar"></i></button>
                        </span>
                
            </div>
        </div>
     <div class="row">
       <div class="col-md-3"><span> Vị trí:</span></div>
           <div class="col-md-7"> <asp:TextBox ID="vitri" runat="server" CssClass="form-control" ></asp:TextBox>
       
     </div>
        </div>
    
    <div class="row">
       <div class="col-md-3"><span> Trạng Thái Tin:</span></div>

        <div class="col-md-7"><asp:DropDownList ID="trangthai"  runat="server" CssClass=" form-control">
                            <asp:ListItem Value='0'>Chưa Đăng</asp:ListItem>
                            <asp:ListItem Value='1'>Đăng</asp:ListItem>
                              </asp:DropDownList></div>
            
          </div>
     <div class="row">  
        <asp:Button ID="btnNhap" runat="server" Text="Thêm mới" OnClick="btnNhap_Click1" CssClass="btn btn-default" />
         </div>
</div>