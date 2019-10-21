<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="crearVehiculo.aspx.cs" Inherits="Proyecto.UI.crearVehiculo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/bootstrap-wysihtml5/bootstrap.min.css" rel="stylesheet" />
    <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
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
            <div class="header">Agregar Empleado</div><br />
            <div class="form-row"></div>
            <asp:TextBox ID="txtId" runat="server" placeholder="Id" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtProveedor" runat="server" placeholder=" proveedor" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtTipo" runat="server" placeholder=" Tipo" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtCodigo" runat="server" placeholder=" Codigo" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtMarca" runat="server" placeholder=" Marca" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtModelo" runat="server" placeholder=" Modelo" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtParametros" runat="server" placeholder=" Parametros" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtAnnio" runat="server" placeholder=" Año" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtCantidad" runat="server" placeholder=" Cantidad" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <p>Fecha Ingreso</p>
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            <hr />
            <p>Fecha Salida</p>
                <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
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
 </form>
        </div>
</body>
</html>
