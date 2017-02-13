<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="department.aspx.vb" Inherits="MSPL.department" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css" rel="stylesheet" type="text/css" />


    <title></title>
    <script type="text/javascript">

        var editdialog
        $(document).ready(function () {
            SetDialog();
        });

        function SetDialog() {
            editdialog = $("#dialog").dialog({
                autoOpen: false,
                title: "View Details",
                modal: true,
                buttons: {
                    "Save": SaveData,
                    Cancel: function () {
                        $(this).dialog("close");
                    }
                },

            });
        }

        function SaveData() {
               $.ajax({
                type: "POST",
                url: "apis.aspx/P_Department_IU",
                data: '{DEPT_ID: ' + $("#id").html() + ',Name:"' + $("#txtName").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () { $('#overlay').show(); },
                success: function (response) {
                    $('#overlay').hide();
                    editdialog.dialog("close");
                },
                failure: function (response) {
                    $('#overlay').hide();
                    alert(response.d);
                },
                error: function (response) {
                    $('#overlay').hide();
                    alert(response.d);
                }
            });
        }

        function AddNewDept()
        {
            $("#id").html(0);
            $("#Name").val("");

            editdialog.dialog("open");
        }

        function Del_Record(DEPT_ID) {
            $.ajax({
                type: "POST",
                url: "apis.aspx/P_Department_Delete",
                data: '{DEPT_ID: ' + DEPT_ID + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
            });
        }


        function OpenDialog(DEPT_ID) {
            $.ajax({
                type: "POSt",
                url: "apis.aspx/P_Department_GetBy_Id",
                data: '{DEPT_ID: ' + DEPT_ID + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () { $('#overlay').show(); },
                success: function (response) {
                    $('#overlay').hide();
                    $("#id").html(response.d.DEPT_ID);
                    $("#txtName").val(response.d.Name);
                    editdialog.dialog("open");
                },
                failure: function (response) {
                    $('#overlay').hide();
                    alert(response.d);
                },
                error: function (response) {
                    $('#overlay').hide();
                    alert(response.d);
                }
            });
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
              <button class="btn" type="button" onclick="AddNewDept();return false;">NEW Name</button> 

        </div>
        <br/>
        <div>
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="White" />

                <Columns>

                    <asp:BoundField DataField="Name" HeaderStyle-HorizontalAlign="Left" HeaderText="Name" ItemStyle-HorizontalAlign="Left" SortExpression="Name" ItemStyle-Width="800px">

                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>

                        <ItemStyle HorizontalAlign="Left" Width="800px"></ItemStyle>
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="Edit" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:LinkButton Text="Edit" ID="lnkEdit" runat="server" />
                        </ItemTemplate>   <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                        <ItemStyle Width="100px"></ItemStyle>
                           </asp:TemplateField>

                        
               

                    <asp:TemplateField HeaderText="Delete" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate> <asp:LinkButton Text="Delete" ID="lnkDel" runat="server" /> </ItemTemplate>
                          <HeaderStyle HorizontalAlign="Left"></HeaderStyle>   
                        
                       
                        <ItemStyle Width="100px"></ItemStyle>
                    </asp:TemplateField>

                </Columns>

                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />

            </asp:GridView>

           <div id="dialog" style="display: none">
                <b>Id:</b> <span id="id"></span>
                <br />
                <b>Name:</b>
                <input id="txtName" type="text" />
               
            </div>



        </div>
    </form>
</body>
</html>
