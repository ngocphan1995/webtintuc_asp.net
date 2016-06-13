<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Quản Lý Sinh Viên</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
    <link href="css/jquery.metisMenu.css" rel="stylesheet" />
  
    
</head>
<body>
    
    <form id="form1" runat="server">
   
                <asp:PlaceHolder ID="header" runat="server"></asp:PlaceHolder>
        <div class="wrapper">
        <div class="content_default">
           <asp:PlaceHolder ID="content" runat="server"></asp:PlaceHolder>
            </div>
             </div>
        <div class="footer">
                <asp:PlaceHolder ID="footer" runat="server"></asp:PlaceHolder>
            </div>
    </form>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery.metisMenu.js"></script>   
</body>
</html>
