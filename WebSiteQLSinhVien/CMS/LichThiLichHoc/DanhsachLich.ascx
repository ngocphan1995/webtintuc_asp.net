<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DanhsachLich.ascx.cs" Inherits="CMS_DanhsachLich" %>

<div class="themtl">
    <h3>Cập nhật lịch</h3>
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
        <asp:Button ID="btncapnhatLich" runat="server" Text="Cập Nhật" CssClass="btn btn-default" OnClick="btncapnhatLich_Click"/>
    </div>
</div>
<asp:DataGrid ID="grdLich" AutoGenerateColumns="False" runat="server" OnItemCommand="grdLich_ItemCommand" AllowPaging="True" PageSize="5"  CssClass="table table-bordered table-hover" OnPageIndexChanged="grdLich_PageIndexChanged">  
    
     
     
    <FooterStyle ForeColor="#000066" BackColor="White"></FooterStyle>
    <Columns>
        <asp:TemplateColumn HeaderText="STT">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#Container.DataSetIndex+1 %>'
                   ID="STT">
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

        <asp:TemplateColumn HeaderText="Nội Dung">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NoiDung")%>'
                   ID="MoTa">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Thời Gian Bắt Đầu">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ThoiGianBatDau")%>'
                   ID="NoiDung">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Thời Gian Kết Thúc">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ThoiGianKetThuc")%>'
                   ID="TenTheLoai">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Địa Chỉ">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"DiaChi")%>'
                   ID="ngayupdate">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Sửa">
                                            <ItemTemplate>
                                         <asp:LinkButton ID="sua" runat="server" CommandArgument='<%# Eval("MaLich") %>'
                                             CommandName="Sua" Text="Sửa" CssClass="btn btn-sm btn-warning">
                                         </asp:LinkButton>
                                         </ItemTemplate>
                                        </asp:TemplateColumn>
                                       
                                     <asp:TemplateColumn HeaderText="Xóa">
                                    <ItemTemplate>
                                    <asp:LinkButton ID="xoa" runat="server" CommandArgument='<%# Eval("MaLich") %>'
                                    CommandName="Xoa" Text="Xóa" CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Bạn có thực sự muốnxóa không?')">
                                    </asp:LinkButton>
                                    </ItemTemplate>
                                 </asp:TemplateColumn>


     
    </Columns>
    <PagerStyle Position="Bottom" Mode="NumericPages" CssClass="dg-pager"/>
</asp:DataGrid>

