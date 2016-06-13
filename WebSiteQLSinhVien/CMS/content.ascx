<%@ Control Language="C#" AutoEventWireup="true" CodeFile="content.ascx.cs" Inherits="CMS_content" %>
<link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet"/>
    <!--external css-->
   <link href="css/font-awesome.css" rel="stylesheet" />
   <link href="css/datetimepicker.css" rel="stylesheet" />
      <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
      <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="js/bootstrap-datetimepicker.js"></script>
            <asp:PlaceHolder ID="left" runat="server"></asp:PlaceHolder>
        <section id="main-content">
          <section class="wrapper site-min-height">
              <asp:PlaceHolder ID="center" runat="server"></asp:PlaceHolder>     
              <!--state overview end-->                
          </section>
      </section>
            