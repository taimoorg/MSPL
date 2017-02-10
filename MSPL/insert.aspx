<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="insert.aspx.vb" Inherits="MSPL.insert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="width:50px" >
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Label"> Name</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
            </td>
        </tr>

        <br />

        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Button" />
            </td>
        </tr>

    </table>
    </div>
    </form>
</body>
</html>
