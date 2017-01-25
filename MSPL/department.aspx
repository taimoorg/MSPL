<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="department.aspx.vb" Inherits="MSPL.department" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:GridView ID="GridView1" runat="server"  CellPadding="14" ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="false">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                   
                    <asp:BoundField DataField="Name" HeaderStyle-HorizontalAlign="Left" HeaderText="Name"  ItemStyle-HorizontalAlign="Left" SortExpression="Name" ItemStyle-Width="800px" />

                    <asp:ButtonField CommandName="CmdDel" ButtonType="Link" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderText="Delete" Text="Delete">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                    </asp:ButtonField>


                    <asp:ButtonField CommandName="CmdEdit" ButtonType="Link" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderText="Edit" Text="Edit">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                    </asp:ButtonField>

                </Columns>


            </asp:GridView>
        </div>
    </form>
</body>
</html>
