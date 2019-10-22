<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="crearUsuario.aspx.cs" Inherits="Agencia_Carros.crearUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="css/AdminLTE.css" rel="stylesheet" />

    <title></title>
</head>
<body>
    <header>
        <div class="logo">
            Royal Motors
        </div>
        <nav>
            <a href="*">Inicio</a>
            <a href="*">Mantenimientos</a>
            <a href="*">Correo</a>
            <a href="*">Otros</a>
        </nav>
    </header>
    <div class="form-box">
    <form id="form1" runat="server" >
        <div class="form form">
            <div class="header">Agregar Usuario</div><br />
            <div class="form-row"></div>
            <asp:TextBox ID="txtUsuario" runat="server" placeholder=" Usuario" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtClave" runat="server" placeholder=" Clave" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtCorreo" runat="server" placeholder=" Correo" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtApellido2" runat="server" placeholder=" Estado Usuario" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            
            <p>
                <asp:Button ID="Crear" CssClass="btn-login" runat="server" Text="Crear" />

            </p>
        </div>
    </form>
        </div>
</body>
</html>
