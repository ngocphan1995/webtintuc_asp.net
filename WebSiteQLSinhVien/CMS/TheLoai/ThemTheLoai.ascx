<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ThemTheLoai.ascx.cs" Inherits="CMS_ThemTheLoai" %>
<div class="themtl">
    <h3>Thêm thể loại</h3>
    <div class="row">
    <asp:FileUpload ID="FileUpload" runat="server" CssClass="col-md-3" />
    <asp:Button ID="Button1" runat="server" Text="Thêm mới" OnClick="Button1_Click" CssClass=" tbnCapNhatTL btn btn-default" />
    
        </div>   
    </div>
<asp:DataGrid ID="grdTheLoai" AutoGenerateColumns="False"  runat="server" AllowPaging="True" PageSize="5" CssClass="table table-bordered table-hover">  
    
     
     
    <FooterStyle ForeColor="#000066" BackColor="White"></FooterStyle>
    <Columns>
        <asp:TemplateColumn HeaderText="ID">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"MaTheLoai")%>'
                   ID="MaTheLoai">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>

        <asp:TemplateColumn HeaderText="Tiêu đề">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"TenTheLoai")%>'
                   ID="TenTheLoai">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>


     
    </Columns>
    <PagerStyle Position="Bottom" Mode="NumericPages" CssClass="dg-pager"/>
</asp:DataGrid>

