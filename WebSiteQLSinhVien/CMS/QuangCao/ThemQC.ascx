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
           <div class="col-md-7">
               <asp:DropDownList ID="vitri" runat="server" class="form-control">
                   <asp:ListItem Enabled="true" Text="Vị Trí" Value="-1"></asp:ListItem>
             <asp:ListItem Text="Bên Trái" Value="Bên Trái"></asp:ListItem>
                <asp:ListItem Text="Bên Phải" Value="Phai"></asp:ListItem>
               </asp:DropDownList>
                
       
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
        <asp:Button ID="btnNhap" runat="server" Text="Cập Nhật" OnClick="btnNhap_Click1" CssClass="btn btn-default" />
         <asp:Button ID="Button1" runat="server" Text="Làm Mới" CssClass="btn btn-default" OnClick="Button1_Click" />
         </div>
</div>
<asp:DataGrid ID="grdQuangCao" AutoGenerateColumns="False"  runat="server" AllowPaging="True" OnItemCommand="grdQuangCao_ItemCommand" PageSize="5" CssClass="table table-bordered table-hover" OnSelectedIndexChanged="grdQuangCao_SelectedIndexChanged" OnPageIndexChanged="grdQuangCao_PageIndexChanged">  
    <FooterStyle ForeColor="#000066" BackColor="White"></FooterStyle>
    <Columns>
        <asp:TemplateColumn HeaderText="Mã Quảng Cáo">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"MaQuangCao")%>'
                   ID="MaQuangCao">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>

        <asp:TemplateColumn HeaderText="Tiêu đề">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"TieuDe")%>'
                   ID="TieuDe">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
         <asp:TemplateColumn HeaderText="Hình Ảnh">
           <ItemTemplate>
           <image src="../Upload/images/quangcao/<%# Eval("HinhAnh") %>" style="width:65px;"></image>
                                               
                                            </ItemTemplate>
        </asp:TemplateColumn>

         <asp:TemplateColumn HeaderText="Link Liên Kết">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"LinkLK")%>'
                   ID="LinkLK">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>

         <asp:TemplateColumn HeaderText="Ngày Bắt Đầu">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NgayBatDau")%>'
                   ID="NgayBatDau">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
 <asp:TemplateColumn HeaderText="Ngày Kết Thúc">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NgayKetThuc")%>'
                   ID="NgayKetThuc">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
 <asp:TemplateColumn HeaderText="Vị Trí Quảng Cáo">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ViTriQuangCao")%>'
                   ID="ViTriQuangCao">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
 <asp:TemplateColumn HeaderText="Trạng Thái">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"TrangThai")%>'
                   ID="TrangThai">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Sửa">
                                            <ItemTemplate>
                                         <asp:LinkButton ID="sua" runat="server" CommandArgument='<%# Eval("MaQuangCao") %>'
                                             CommandName="Sua" Text="Sửa" CssClass="btn btn-sm btn-warning">
                                         </asp:LinkButton>
                                         </ItemTemplate>
                                        </asp:TemplateColumn>
                                       
                                     <asp:TemplateColumn HeaderText="Xóa">
                                    <ItemTemplate>
                                    <asp:LinkButton ID="xoa" runat="server" CommandArgument='<%# Eval("MaQuangCao") %>'
                                    CommandName="Xoa" Text="Xóa" CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Bạn có thực sự muốnxóa không?')">
                                    </asp:LinkButton>
                                    </ItemTemplate>
                                 </asp:TemplateColumn>

     
    </Columns>
    <PagerStyle Position="Bottom" Mode="NumericPages" CssClass="dg-pager"/>
</asp:DataGrid>
