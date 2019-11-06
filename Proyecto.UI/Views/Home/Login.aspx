
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Proyecto.UI.Views.Home.Login" %>

<!DOCTYPE html>

<html class="bg-olive" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Acceso al Sistema</title>
    <link href="css/AdminLTE.css" rel="stylesheet" type="text/css"/>
</head>
<body class="bg-olive">
    <div class="form-box form" id="login">
        <div class="header">Iniciar sesion</div>
    <form id="form1" runat="server">
        <div class="body bg-olive">
            <div class="form-group">
                <asp:TextBox ID="txtUser" CssClass="textbox" runat="server" Width="312px" placeholder="Ingrese su usuario" Height="30px"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtPass" CssClass="textbox" TextMode="Password" runat="server" Width="312px" placeholder="Ingrese su contraseña" Height="30px"></asp:TextBox>
            </div>
            <br />
            <div class="footer bg-olive">
                <asp:Button ID="btnLogin" CssClass="btn-login" runat="server" Text="Iniciar Sesion" Width="280px" />
            </div>
        </div>
        <div>
        </div>
    </form>
        </div>
</body>
</html>
