<%@ Control Language="C#" AutoEventWireup="true" CodeFile="danh_sach_the_loai.ascx.cs" Inherits="CMS_danh_sach_the_loai" %>



<div class="themtl">
    <h3>Cập nhật thể loại</h3>
<div class="row" >
    <div class="col-md-3"><span>Tên thể loại:</span></div>
    <div class="col-md-7 ">
            <asp:TextBox ID="txttentheloai" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
 </div>
       
            <asp:Button ID="tbnCapNhat" runat="server" Text="Cập nhật" OnClick="btncapnhat_Click" CssClass=" tbnCapNhat btn btn-default" />
   
    <h3>Danh sách thể loại tin</h3>
     </div>
        


<asp:DataGrid ID="grdTheLoai" AutoGenerateColumns="False"  runat="server"
    AllowPaging="True" PageSize="5" OnItemCommand="Command" CssClass="table table-bordered table-hover">  
    
     
     
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

        <asp:TemplateColumn HeaderText="Sửa">
                                            <ItemTemplate>
                                         <asp:LinkButton ID="sua" runat="server" CommandArgument='<%# Eval("MaTheLoai") %>'
                                             CommandName="Sua" Text="Sửa" CssClass="btn btn-sm btn-warning">
                                         </asp:LinkButton>
                                         </ItemTemplate>
                                        </asp:TemplateColumn>
                                       
                                     <asp:TemplateColumn HeaderText="Xóa">
                                    <ItemTemplate>
                                    <asp:LinkButton ID="xoa" runat="server" CommandArgument='<%# Eval("MaTheLoai") %>'
                                    CommandName="Xoa" Text="Xóa" CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Bạn có thực sự muốnxóa không?')">
                                    </asp:LinkButton>
                                    </ItemTemplate>
                                 </asp:TemplateColumn>


     
    </Columns>
    <PagerStyle Position="Bottom" Mode="NumericPages" CssClass="dg-pager"/>
</asp:DataGrid>