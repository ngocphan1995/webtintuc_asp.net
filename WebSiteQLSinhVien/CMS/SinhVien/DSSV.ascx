<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DSSV.ascx.cs" Inherits="WebSiteQLSinhVien_CMS_SinhVien_DSSV" %>

<div class="themtl">
    <h3>Cập nhật Sinh Viên</h3>
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
        <asp:Button ID="btncapnhatSV" runat="server" Text="Cập Nhật" CssClass="btn btn-default" OnClick="btncapnhatSV_Click"/>
    </div>
</div>
<asp:DataGrid ID="grdDSSV" AutoGenerateColumns="False" runat="server" AllowPaging="True" PageSize="5"  CssClass="table table-bordered table-hover" OnItemCommand="Command" OnPageIndexChanged="grdTinBai_PageIndexChanged">  
    
     
     
    <FooterStyle ForeColor="#000066" BackColor="White"></FooterStyle>
    <Columns>
        <asp:TemplateColumn HeaderText="Mã Sinh Viên">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "MaSv")%>'
                   ID="Masv">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>

        <asp:TemplateColumn HeaderText="Họ Tên">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "HoTen")%>'
                   ID="HoTen">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>

        <asp:TemplateColumn HeaderText="Mã Lớp">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "MaLop")%>'
                   ID="lop">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Mã Khoa">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "MaKhoa")%>'
                   ID="khoa">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Ngày Sinh">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "NgaySinh")%>'
                   ID="ngaysinh">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Quê Quán">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "QueQuan")%>'
                   ID="diachi">
                                                </asp:Label>
           </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Phone">
            <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "SDT")%>'
                   ID="phone">
                                                </asp:Label>
           </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Ảnh Đại Diện">
            <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Avata")%>'
                   ID="image">
                                                </asp:Label>
           </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Sửa">
                                            <ItemTemplate>
                                         <asp:LinkButton ID="sua" runat="server" CommandArgument='<%# Eval("MaSv")%>'
                                             CommandName="Sua" Text="Sửa" CssClass="btn btn-sm btn-warning">
                                         </asp:LinkButton>
                                         </ItemTemplate>
                                        </asp:TemplateColumn>
                                       
                                     <asp:TemplateColumn HeaderText="Xóa">
                                    <ItemTemplate>
                                    <asp:LinkButton ID="xoa" runat="server" CommandArgument='<%# Eval("MaSv")%>'
                                    CommandName="Xoa" Text="Xóa" CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Bạn có thực sự muốnxóa không?')">
                                    </asp:LinkButton>
                                    </ItemTemplate>
                                 </asp:TemplateColumn>


     
    </Columns>
    <PagerStyle Position="Bottom" Mode="NumericPages" CssClass="dg-pager"/>
</asp:DataGrid>
