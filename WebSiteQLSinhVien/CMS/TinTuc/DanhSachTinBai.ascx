<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DanhSachTinBai.ascx.cs" Inherits="WebSiteQLSinhVien_CMS_DanhSachTinBai" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<div class="themtt">
    <h3>Cập nhật thông tin bài viết</h3>
      <div class="row">
       <div class="col-md-3"><span> Thể loại:</span></div>
        <div class="col-md-7"><asp:DropDownList ID="cbtheloai"  runat="server" CssClass=" form-control"></asp:DropDownList></div>
            
          </div>
     <div class="row">
       <div class="col-md-3"> <span>Tiêu đề:</span></div>
           <div class="col-md-7"> <asp:TextBox ID="tieude" runat="server" CssClass="form-control" ></asp:TextBox></div>
         </div>
     <div class="row">
      <div class="col-md-3"> <span>Ảnh trang chủ:</span></div>
          <div class="col-md-7">  <asp:FileUpload ID="fileInput" runat=server /></div>
         </div>
             <div class="row">
            
       <div class="col-md-3"><span>Mô tả tin:</span></div>
           <div class="col-md-7"> <asp:TextBox  ID="motatin" runat="server" TextMode="MultiLine" Rows="5" MaxLength="10" CssClass="form-control"></asp:TextBox></div>
                 </div>
     <div class="row">
       <div class="col-md-3"><span> Nội dung:</span></div>
           
         </div>
    <div class="row">
        <CKEditor:CKEditorControl ID="noidung" BasePath="~/ckeditor" runat="server" BodyClass="ckeditor" ></CKEditor:CKEditorControl>
        </div>
    <div class="row">
       <div class="col-md-3"><span> Trạng Thái Tin:</span></div>

        <div class="col-md-7"><asp:DropDownList ID="trangthai"  runat="server" CssClass=" form-control">
                            <asp:ListItem Value='0'>Chưa Đăng</asp:ListItem>
                            <asp:ListItem Value='1'>Đăng</asp:ListItem>
                              </asp:DropDownList></div>
            
          </div>
     <div class="row">  
        <asp:Button ID="btnNhap" runat="server" Text="Cập Nhật"  CssClass="btn btn-default" OnClick="btnNhap_Click" />
         </div>
    <h3>Danh sách tin</h3>
</div>




<asp:DataGrid ID="grdTinBai" AutoGenerateColumns="False" runat="server" OnItemCommand="grdTinBai_ItemCommand" AllowPaging="True" PageSize="5"  CssClass="table table-bordered table-hover" OnPageIndexChanged="grdTinBai_PageIndexChanged">  
    
     
     
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
           <a href='../Default.aspx?content=cttin&id=<%# DataBinder.Eval(Container.DataItem, "MaTinTuc")%>'><%# Eval("TieuDe") %></a>
                                            </ItemTemplate>
        </asp:TemplateColumn>

        <asp:TemplateColumn HeaderText="Mô tả">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Mota")%>'
                   ID="MoTa">
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
       
        <asp:TemplateColumn HeaderText="Trạng thái">
           <ItemTemplate>
           <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"TrangThaiTin")%>'
                   ID="trangthai">
                                                </asp:Label>
                                            </ItemTemplate>
        </asp:TemplateColumn>

        <asp:TemplateColumn HeaderText="Sửa">
                                            <ItemTemplate>
                                         <asp:LinkButton ID="sua" runat="server" CommandArgument='<%# Eval("MaTinTuc") %>'
                                             CommandName="Sua" Text="Sửa" CssClass="btn btn-sm btn-warning">
                                         </asp:LinkButton>
                                         </ItemTemplate>
                                        </asp:TemplateColumn>
                                       
                                     <asp:TemplateColumn HeaderText="Xóa">
                                    <ItemTemplate>
                                    <asp:LinkButton ID="xoa" runat="server" CommandArgument='<%# Eval("MaTinTuc") %>'
                                    CommandName="Xoa" Text="Xóa" CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Bạn có thực sự muốnxóa không?')">
                                    </asp:LinkButton>
                                    </ItemTemplate>
                                 </asp:TemplateColumn>


     
    </Columns>
    <PagerStyle Position="Bottom" Mode="NumericPages" CssClass="dg-pager"/>
</asp:DataGrid>


