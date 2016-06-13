<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />

<link href="login/css/reset.css" rel="stylesheet" />
 <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'/>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'/>
<link href="login/css/style.css" rel="stylesheet" />

     <script type="text/javascript" src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script type="text/javascript" src="login/js/index.js"></script>

</head>
<body>
    <form id="form1" runat="server" class="form-group">
<div class="container">
  <div class="card"></div>
  <div class="card">
    <h1 class="title">Login</h1>
      <div class="input-container">
      <asp:TextBox ID="txtUsername" runat="server" required="required"></asp:TextBox>
		<asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        
        <asp:TextBox ID="txtPassword" runat="server" required="required" style="top: 0px; left: 0px" TextMode="Password"></asp:TextBox>
		<asp:Label ID="Label2" runat="server" Text="Password" ></asp:Label>
        <div class="bar"></div>
      </div>
      <div class="button-container">
	 <span> <asp:Button ID="tbnDangNhap" runat="server" Text="Đăng nhập"  CssClass="btnDangNhap"
                onclick="tbnDangNhap_Click"/></span>
        
      </div>
      <asp:Label ID="thongbao" runat="server" Visible="false" ForeColor="Red" Font-Italic="True" ></asp:Label>
      <div class="footer"><a href="#">Forgot your password?</a></div>
  
  </div>
</div>
    </form>
</body>
</html>
