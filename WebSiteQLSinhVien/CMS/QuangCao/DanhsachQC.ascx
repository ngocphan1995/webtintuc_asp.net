<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DanhsachQC.ascx.cs" Inherits="CMS_DanhsachQC" %>

<div class="themtt">  
    <h3> Màn Hình Thêm Quảng Cáo</h3>
</div>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True">
    <Columns>
        <asp:BoundField DataField="TieuDe" HeaderText="Tiêu đề" />
    </Columns>
</asp:GridView>
