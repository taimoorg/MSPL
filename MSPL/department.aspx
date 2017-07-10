<%@ Page Language="vb" AutoEventWireup="false" EnableEventValidation="false" CodeBehind="department.aspx.vb" Inherits="MSPL.department" %>

<%--EnableEventValidation = "false" Use to Export gridview in Excel--%>

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
            AutoComplete();
            KeySearch();
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
                data: '{DEPT_ID: ' + $("#id").html() + ',Dept_Name:"' + $("#txtName").val() + '"}',
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

        function AddNewDept() {
            $("#id").html(0);
            $("#Dept_Name").val("");

            editdialog.dialog("open");
        }

        function Del_Record(DEPT_ID) {
            if(confirm("Are u sure?"))
            $.ajax({
                type: "POST",
                url: "apis.aspx/P_Department_Delete",
                data: '{DEPT_ID: ' + DEPT_ID + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
            });
            SetDialog();
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
                    $("#txtName").val(response.d.Dept_Name);
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


        function AutoComplete() {
            $("#<%=txtSearch.ClientID %>").autocomplete({
                autoFocus: true,
                source: function (request, response) {
                    $.ajax({
                        url: "apis.aspx/AutoSearch",
                        data: "{'SearchText': '" + request.term + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                return {
                                    label: item.Dept_Name,
                                    val:item.DEPT_ID
                                }
                            }))
                        },
                        error: function (response) {
                            alert(response.responseText);
                        },
                        failure: function (response) {
                            alert(response.responseText);
                        }
                    });
                },
                 select: function (e, i) {
                     $('#<%=Dept_Val.ClientID %>').val(i.item.val);
                    __doPostBack("<%= btnGo.UniqueID%>", "OnClick");
                },

                minLength: 0,
            }).bind('focus', function () { $(this).autocomplete("search"); }); //SHOW LIST ON CLICK
            //});
        }

        //Another Way To  SEARCH DATA FORM GRIDVIEW

       function KeySearch() {
            var coldata;
            $('#KeySearch').keyup(function () {
                $('#<%=GridView1.ClientID%>').find('tr:gt(0)').hide();
                var data = $('#KeySearch').val();
                var len = data.length;
                if (len > 0) {
                    $('#<%=GridView1.ClientID%>').find('tbody tr').each(function () {
                        coldata = $(this).children().eq(1);
                        var temp = coldata.text().toUpperCase().indexOf(data.toUpperCase());
                        if (temp === 0) {
                            $(this).show();
                        }
                    });
                } else {
                    $('#<%=GridView1.ClientID%>').find('tr:gt(0)').show();
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
        <br />
        <center>
     
     <%--AUTO COMPLETE SEARCH--%> 
             <b>Search</b>
            <div>
                <asp:TextBox ID="txtSearch" placeholder="Search by Department" runat="server"></asp:TextBox>
                 <asp:HiddenField ID="Dept_Val" runat="server" />
                <asp:Button ID="btnGo" runat="server" Text="Button" style="display:none;"/>
            </div>
            <br />
             <br />

      <b>Key Search</b>
            <div>
                <asp:TextBox ID="KeySearch" placeholder="Search by Name" runat="server"></asp:TextBox>
            </div>

             <br />
             <br />

      
        <div>
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="False" AllowPaging="true" PageSize="12" OnPageIndexChanging ="GridView1_PageIndexChanging" enablepagingandcallback= "false"   >
                <AlternatingRowStyle BackColor="White" />

                <Columns>
                    <asp:BoundField DataField="DEPT_ID" HeaderStyle-HorizontalAlign="Left" HeaderText="DEPT_ID" ItemStyle-HorizontalAlign="Left" SortExpression="DEPT_ID" ItemStyle-Width="80px">
                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" Width="80px"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="Dept_Name" HeaderStyle-HorizontalAlign="Left" HeaderText="Name" ItemStyle-HorizontalAlign="Left" SortExpression="Dept_Name" ItemStyle-Width="80px">
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

         <%--   PAGING WORK--%>
           <asp:Label ID="Label1" runat="server" Text="Choose No." Font-Bold="True" ForeColor="#CC3300"></asp:Label>
           <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                <asp:ListItem Text="15" Value="15"></asp:ListItem>
                <asp:ListItem Text="20" Value="20"></asp:ListItem>
           </asp:DropDownList>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

        <%--Export To Excel--%>
           <asp:Button ID="btnExport" runat="server" Text="Export To Excel" OnClick = "ExportToExcel" />
           <br /> 

           <div id="dialog" style="display: none">
                <b>Id:</b> <span id="id"></span>
                <br />
                <b>Name:</b>
                <input id="txtName" type="text" />
           </div>
            <br />
            <br />
            <%--<div>
                <fieldset style="width: 400px; height :40px;">
                    <legend> DropDownList</legend>
                    Select Department ID: &nbsp;
                    <asp:DropDownList ID="ddlDepartments" runat="server" Width="180px" />
                </fieldset>
            </div>--%>
            <br />
        </div>
    </center>
    </form>
</body>
</html>
