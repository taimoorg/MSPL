<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="LoginPage.aspx.vb" Inherits="MSPL.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .error {
            font-size: 12pt;
            font-weight: bold;
            text-align: center;
            color: #ff0000;
        }
    </style>
</head>
<body>
    <div class="error">
        <asp:Literal ID="litError" runat="server"></asp:Literal>
    </div>
    <form id="form1" runat="server">
        <div>
            <table style="margin-left: auto; margin-right: auto; padding-top: 20px;">
              <%--  <tr>
                    <td>User ID:</td>
                    <td>
                        <asp:TextBox ID="txtID" runat="server"></asp:TextBox></td>
                </tr>--%>
                <tr>
                    <td>Name:</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>
                <%--<asp:HiddenField ID="Log_ID" runat="server" Value="0" />--%>
            </table>
            <br />
            <br />
            <div style="margin-left: auto; margin-right: auto; text-align: center">
                <asp:Button ID="LoginID" runat="server" Text="Login" />
            </div>

        </div>
    </form>
</body>
</html>

