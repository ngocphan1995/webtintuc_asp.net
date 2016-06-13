<%@ Control Language="C#" AutoEventWireup="true" CodeFile="tinmuc.ascx.cs" Inherits="tin_tuc_noi_bat_tinmuc" %>
<asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
        <h3><%# Eval("tentheloai") %></h3>
    </ItemTemplate>
</asp:Repeater>

<asp:Repeater ID="Rptinmuc" runat="server">
    <ItemTemplate>
           <div class="row">
               <span class="titile"><a href='Default.aspx?content=cttin&id=<%# DataBinder.Eval(Container.DataItem, "MaTinTuc")%>'><%# Eval("TieuDe") %></a></span>
           </div>
         <div  class="row">
             <div class="col-md-3">
     <img src='Upload/images/<%# DataBinder.Eval(Container.DataItem, "HinhDaiDien") %>'  
alt="" style="height:100px;width:100px;border:1px solid #fff; margin-left:10px"/>
              </div>
             <div class="col-md-7">
         <p>
             <%# Eval("Mota") %>
         </p>
                 </div>
          </div>
      
    </ItemTemplate>

</asp:Repeater>
    
