<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Order.aspx.vb" Inherits="MSPL.Order" %>

<!DOCTYPE html>

<head runat="server">
    <title></title>
</head>

<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDM7-igdY9_vzj7-1ASLXQmLHPxNDB3OHE&libraries=drawing"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

<script>
    $(function () {

        $("[id$=txtDate]").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'yy-mm-dd',
            beforeShowDay: function (date) {
                var day = date.getDay();
                return [day != 0, ''];
            }
        });
    });

    $(function () {

        $("[id$=ToDate]").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'yy-mm-dd',
            beforeShowDay: function (date) {
                var day = date.getDay();
                return [day != 0, ''];
            }
        });
    });
    $(function () {

        $("[id$=FromDate]").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'yy-mm-dd',
            beforeShowDay: function (date) {
                var day = date.getDay();
                return [day != 0, ''];
            }
        });
    });
</script>



<body>
    <form id="form1" runat="server">

        <div class="top_cap">
            <asp:Literal ID="litCap" runat="server"></asp:Literal>
        </div>
        <div class="error">
            <asp:Literal ID="litError" runat="server" Visible="false"></asp:Literal>
        </div>
        <br />

        <asp:Panel ID="pnlData" runat="server" Visible="true">
            <div style="margin-left: auto; margin-right: auto; text-align: center;">
                <asp:LinkButton ID="lbAddNew" runat="server">Add New </asp:LinkButton>
                <br />
                <br />
                <br />
            </div>
              <div style="margin-left: auto; margin-right: auto; width: 80%">
         
            Name:
                  <asp:TextBox ID="filterName" runat="server"></asp:TextBox> &nbsp;
          From Date:
                  <asp:TextBox ID="FromDate" runat="server"></asp:TextBox> &nbsp;
          To Date:
                  <asp:TextBox  ID="ToDate" runat="server"></asp:TextBox>  &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:Button ID="btnSearch" Text="Search" runat="server" OnClick="btnfilter_Click" />
        </div>
         <br />

            <div style="margin-left: auto; margin-right: auto; width: 80%">
                <asp:GridView ID="gvOrder" runat="server" Width="80%" AutoGenerateColumns="false" DataKeyNames="Order_ID"
                    HeaderStyle-BackColor="#4789c4" HeaderStyle-Height="25px">
                    <Columns>
                        <asp:BoundField DataField="Order_ID" HeaderText="Order ID">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Name" HeaderText="Name">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Price" HeaderText="Price">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Order_Date" HeaderText="Order Date">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>

                    </Columns>
                </asp:GridView>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlEdit" runat="server" Visible="false">
            <div>
                <table style="margin-left: auto; margin-right: auto;">
                    <tr>
                        <td>Name: </td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" Width="300"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Price: </td>
                        <td>
                            <asp:TextBox ID="txtPrice" runat="server" Width="300"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Order Date: </td>
                        <td>
                            <asp:TextBox ID="txtDate" runat="server" Width="300"></asp:TextBox>
                        </td>
                        <td>
                            <asp:HiddenField ID="Order_ID" runat="server"></asp:HiddenField>
                        </td>
                    </tr>
                </table>
            </div>

            <div style="margin-left: auto; margin-right: auto; text-align: center;">
                <asp:Button ID="btnSave" runat="server" Text="Save" Width="100px" />&nbsp;&nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="100px" />
            </div>
        </asp:Panel>


    </form>
</body>
</html>
