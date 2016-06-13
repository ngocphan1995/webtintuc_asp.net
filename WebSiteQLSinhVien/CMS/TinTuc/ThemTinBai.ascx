<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ThemTinBai.ascx.cs" Inherits="CMS_ThemTinBai" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<div class="themtt">
   
    
    <h3> Màn Hình Thêm Tin Bài</h3>
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
           <div class="col-md-7"> 
       
     </div>
        </div>
    <div class="row">
        <CKEditor:CKEditorControl ID="noidung" BasePath="~/ckeditor" runat="server" ></CKEditor:CKEditorControl>
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