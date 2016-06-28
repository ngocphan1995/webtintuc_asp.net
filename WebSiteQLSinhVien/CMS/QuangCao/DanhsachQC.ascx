<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DanhsachQC.ascx.cs" Inherits="CMS_DanhsachQC" %>

<div class="themtt">  
    <h3> Màn Hình Thêm Quảng Cáo</h3>
</div>
<asp:DataGrid ID="grdQuangCao" AutoGenerateColumns="False"  runat="server" AllowPaging="True" PageSize="5" CssClass="table table-bordered table-hover">  
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
           <image src="../Upload/images/<%# Eval("HinhAnh") %>" style="width:65px;"></image>
                                               
                                            </ItemTemplate>
        </asp:TemplateColumn>

         <asp:TemplateColumn HeaderText="Link Liên Kết">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"LinkLK")%>'
                   ID="TieuDe">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>

         <asp:TemplateColumn HeaderText="Ngày Bắt Đầu">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NgayBatDau")%>'
                   ID="TieuDe">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
 <asp:TemplateColumn HeaderText="Ngày Kết Thúc">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NgayKetThuc")%>'
                   ID="TieuDe">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
 <asp:TemplateColumn HeaderText="Vị Trí Quảng Cáo">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ViTriQuangCao")%>'
                   ID="TieuDe">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
 <asp:TemplateColumn HeaderText="Trạng Thái">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"TrangThai")%>'
                   ID="TieuDe">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>


     
    </Columns>
    <PagerStyle Position="Bottom" Mode="NumericPages" CssClass="dg-pager"/>
</asp:DataGrid>
