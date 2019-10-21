<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="crearUsuario.aspx.cs" Inherits="Proyecto.UI.crearUsuario" %>

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
             <asp:TextBox ID="txtId" runat="server" placeholder="Id" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtUsuario" runat="server" placeholder=" Usuario" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtClave" runat="server" placeholder=" Clave" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtCorreo" runat="server" placeholder=" Correo" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtEstado" runat="server" placeholder=" Estado Usuario" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            
            <div>
            <div>
            <div style="text-align:right">
                <asp:Button ID="btnInsertar" runat="server" Text="Insertar" OnClick="btnInsertar_Click" /></div>
            <div style="text-align:right">
                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" OnClick="btnActualizar_Click" /></div>
            <div style="text-align:right">
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" /></div>
            <div style="text-align:right">
                <asp:Button ID="btnMostrar" runat="server" Text="Mostrar" OnClick="btnMostrar_Click" /></div>
        </div>

        <div>
            <div >
                <asp:GridView ID="gridview" runat="server" Width="100%" Height="100%"></asp:GridView>

            </div>
        </div>
        </div>
    </form>
        </div>
</body>
</html>
