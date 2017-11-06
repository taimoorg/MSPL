<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ContractorDriver.aspx.vb" Inherits="MSPL.ContractorDriver" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="pnlData" runat="server" Visible="true">
            <div style="margin-left: auto; margin-right: auto; width: 90%">
                <asp:GridView ID="gvData" runat="server" Width="85%" AutoGenerateColumns="false" DataKeyNames="Driver_ID" HeaderStyle-BackColor="#4789c4" HeaderStyle-Height="25PX" RowStyle-CssClass="GridView" AllowPaging="true" PageSize="30">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Center" Width="20px" />
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <%#CType(Container,GridViewRow).RowIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Driver_ID" HeaderText="Driver ID">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="First_Name" HeaderText="First Name">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Last_Name" HeaderText="Last Name">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Is_Assign" HeaderText="Is Assign">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Columns>

                </asp:GridView>
            </div>
        </asp:Panel>


    </form>
</body>
</html>
