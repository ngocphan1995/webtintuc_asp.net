<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TimKiem.ascx.cs" Inherits="CMS_center" %>
<div class="themtl">
<h3>Tìm kiếm theo tiêu đề</h3>
<div class="row">
    <div class="col-md-4">
    <span>Nhập từ cần tìm:</span>
        </div>
    <div class="col-md-5">
    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    
</div>
<div class="row">
    <asp:Button ID="btntimkiem" runat="server" Text="Tìm Kiếm" CssClass="btn btn-default" OnClick="btntimkiem_Click"/>
</div>
    <h3>Danh sách bài tin</h3>
    </div>


<asp:DataGrid ID="grdtimkiem" AutoGenerateColumns="False" runat="server" OnItemCommand="grdtimkiem_ItemCommand" AllowPaging="True" PageSize="5"  CssClass="table table-bordered table-hover" OnPageIndexChanged="grdtimkiem_PageIndexChanged">  
    
     
     
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
        <asp:TemplateColumn HeaderText="Mô tả">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Mota")%>'
                   ID="MoTa">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Nội dung">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NoiDung")%>'
                   ID="NoiDung">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Thể loại">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"tentheloai")%>'
                   ID="TenTheLoai">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Ngày update">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"NgayUpdate")%>'
                   ID="ngayupdate">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Mô tả">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Mota")%>'
                   ID="Motatin">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Trạng thái">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"TrangThaiTin")%>'
                   ID="trangthai">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>
    </Columns>
    <PagerStyle Position="Bottom" Mode="NumericPages" CssClass="dg-pager"/>
</asp:DataGrid>


