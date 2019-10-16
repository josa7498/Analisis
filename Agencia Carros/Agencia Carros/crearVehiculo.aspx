<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="crearVehiculo.aspx.cs" Inherits="Agencia_Carros.crearVehiculo" %>

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
            <div class="header">Agregar Empleado</div><br />
            <div class="form-row"></div>
            <asp:TextBox ID="txtProveedor" runat="server" placeholder=" Cedula" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtTipo" runat="server" placeholder=" Nombre" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
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
            
            <p>
                <asp:Button ID="Crear" runat="server" Text="Crear" />

            </p>
        </div>
    </form>
        </div>
</body>
</html>
