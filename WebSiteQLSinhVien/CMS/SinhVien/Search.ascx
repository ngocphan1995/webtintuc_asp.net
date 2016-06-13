<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search.ascx.cs" Inherits="WebSiteQLSinhVien_CMS_SinhVien_Search" %>
<div class="themtl">
<h3>Tìm kiếm theo tên</h3>
<div class="row">
    <div class="col-md-4">
    <span>Nhập từ khóa:</span>
        </div>
    <div class="col-md-5">
    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    
</div>
<div class="row">
    <asp:Button ID="btntimkiem" runat="server" Text="Tìm Kiếm" CssClass="btn btn-default" OnClick="btntimkiem_Click"/>
</div>
    <h3>Danh sách kết quả</h3>
    </div>


<asp:DataGrid ID="grdDSSV" AutoGenerateColumns="False" runat="server" AllowPaging="True" PageSize="5"  CssClass="table table-bordered table-hover">  
    
     
     
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


     
    </Columns>
    <PagerStyle Position="Bottom" Mode="NumericPages" CssClass="dg-pager"/>
</asp:DataGrid>
