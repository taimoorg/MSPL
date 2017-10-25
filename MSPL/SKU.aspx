<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SKU.aspx.vb" Inherits="MSPL.SKU" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SKU</title>

</head>
<body>
    <style>
        .GridView:hover {
            background-color:#5db2ff;
            color: #ffffff;
        }

        .top_cap {
            background-color: #4789c4;
            font-size: 16pt;
            font-weight: bold;
            text-align: center;
            color: #fff;
            padding: 5px;
            width: auto;
        }

        .error {
            font-size: 12pt;
            font-weight: bold;
            text-align: center;
            color: #ff0000;
        }
    </style>

    <form id="form1" runat="server">
        <div class="top_cap">
            <asp:Literal ID="litCap" runat="server"></asp:Literal>
        </div>

        <div class="error">
            <asp:Literal ID="litError" runat="server"></asp:Literal>
        </div>

        <asp:Panel ID="pnlData" runat="server" Visible="true">

            <div style="margin-left: auto; margin-right: auto; text-align: center">
                <br />
                <asp:LinkButton ID="lbAddNew" runat="server">Add New Sku</asp:LinkButton>
                <br />
                <br />
                <b>Client:</b>
                <asp:DropDownList ID="ddlClientList" runat="server" OnSelectedIndexChanged="ddlClientList_SelectedIndexChanged" AutoPostBack="true" Width="250px">
                <asp:ListItem Text="Select Client" Value="0"></asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
            </div>

            <div style="margin-left: auto; margin-right: auto; width: 90%">
                <asp:GridView ID="gvData" runat="server"  Width="85%" AutoGenerateColumns="false" DataKeyNames="Sku_ID" HeaderStyle-BackColor="#4789c4" HeaderStyle-Height="25PX" RowStyle-CssClass="GridView"  AllowPaging="true"  PageSize="30" >
                    <Columns>
                      <asp:TemplateField>
                          <HeaderStyle HorizontalAlign="Center" Width="20px"/>
                          <ItemStyle HorizontalAlign="Center" />
                          <ItemTemplate>
                              <%#CType(Container,GridViewRow).RowIndex + 1 %>
                          </ItemTemplate>
                      </asp:TemplateField>
                        <asp:BoundField DataField="SKU" HeaderText="SKU">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Description" HeaderText="Description">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                         <asp:BoundField DataField="Name" HeaderText="Client Name" >
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" /> 
                        </asp:BoundField >
                        <asp:BoundField DataField="SumUPWeight" HeaderText="Sum UP Weight">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SumUPHeight" HeaderText="Sum UP Height">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SumUPWidth" HeaderText="Sum UP Width">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SumUPDepth" HeaderText="Sum UP Depth">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                              <asp:ButtonField ButtonType="Link" CommandName="CmdEdit" HeaderStyle-HorizontalAlign="Center" HeaderText="Edit" ItemStyle-HorizontalAlign="Center" Text="Edit">
                            <HeaderStyle HorizontalAlign="Center" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:ButtonField>
                        <asp:ButtonField ButtonType="Link" CommandName="CmdDelete" HeaderStyle-HorizontalAlign="Center" HeaderText="Delete" ItemStyle-HorizontalAlign="Center" Text="Delete">
                            <HeaderStyle HorizontalAlign="Center" ForeColor="White"/>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:ButtonField>
                    </Columns>
                </asp:GridView>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlEdit" runat="server" Visible="false">

            <br />
            <table style="margin-left: auto; margin-right: auto">
                 <tr>
                    <td>Client:</td>
                    <td> <asp:DropDownList ID="ddlClient" runat="server" Width="250px"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Sku:</td>
                    <td>
                        <asp:TextBox ID="txtSku" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td>
                        <asp:TextBox ID="txtDescrp" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Sum of unit pack weight:</td>
                    <td>
                        <asp:TextBox ID="txtWeight" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Sum of unit pack Height:</td>
                    <td>
                        <asp:TextBox ID="txtHeight" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Sum of unit pack Width:</td>
                    <td>
                        <asp:TextBox ID="txtWidth" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Sum of unit pack Depth:</td>
                    <td>
                        <asp:TextBox ID="txtDepth" runat="server"></asp:TextBox></td>
                    <asp:HiddenField ID="Sku_ID" runat="server" Value="0" />
                    <asp:HiddenField ID="hdnClientList" runat="server" />
                </tr>
            </table>
            <br />
            <div style="margin-left:auto ; margin-right:auto;text-align:center">
                <asp:Button ID="btnSave" runat="server" Text="Save" Width="100px" />&nbsp;&nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="100px" />
            </div>
        </asp:Panel>




    </form>
</body>
</html>
