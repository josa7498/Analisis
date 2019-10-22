<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="crearEmpleado.aspx.cs" Inherits="Agencia_Carros.crearEmpleado" %>

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
            <asp:TextBox ID="txtCedula" runat="server" placeholder=" Cedula" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtNombre" runat="server" placeholder=" Nombre" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtApellido1" runat="server" placeholder=" Apellido 1" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtApellido2" runat="server" placeholder=" Apellido 2" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <p>Genero</p>
            <asp:RadioButton ID="rbMasculino" runat="server"  Text="  Masculino"/><br />
            <asp:RadioButton ID="rbFemenino" runat="server" Text="  Femenino" />
            <hr />
            <asp:TextBox ID="txtTelefono" runat="server" placeholder=" Telefono" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
    
            <asp:TextBox ID="txtCelular" runat="server" placeholder=" Celular" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <asp:TextBox ID="txtCorreo" runat="server" placeholder=" Correo" BorderColor="Gray" Width="284px" CssClass="textbox"></asp:TextBox><hr />
            <p>Provincia</p>
            <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
            <hr />
            <p>Canton</p>
            <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
            <hr />
            <p>Distrito</p>
            <asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList>
            <hr />
            <p>Direccion Exacta</p>
            <hr />
            <p>Sede</p>
            <asp:DropDownList ID="DropDownList4" runat="server"></asp:DropDownList>
            <hr />
            <p>Departamento</p>
            <asp:DropDownList ID="DropDownList5" runat="server"></asp:DropDownList>
            <hr />
            <p>Usuario</p>
            <asp:DropDownList ID="DropDownList6" runat="server"></asp:DropDownList>
            <hr />
            <p>Estado Empleado</p>
            <asp:DropDownList ID="DropDownList7" runat="server"></asp:DropDownList>
            <hr />
            <p>
                <asp:Button ID="Crear" runat="server" Text="Crear" />

            </p>
        </div>
    </form>
        </div>
</body>
</html>
