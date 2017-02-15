<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="showInHtmlTable.aspx.vb" Inherits="MSPL.showInHtmlTable" %>

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
            FillTable();
        });
        function FillTable() {
            $.ajax({
                type: "Post",
                url: "apis.aspx/GetDeptTable",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () { $('#overlay').show(); },
                success: function (response) {
                    $("#Gettbl").html(response.d);

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
                data: '{DEPT_ID: ' + $("#id").html() + ',Name:"' + $("#txtName").val() + '",Last_Name:"' + $("#txtLName").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () { $('#overlay').show(); },
                success: function (response) {
                    $('#overlay').hide();
                    editdialog.dialog("close");
                    FillTable();
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

        function OpenDialog(DEPT_ID) {
            $.ajax({
                type: "Post",
                url: "apis.aspx/P_Department_GetBy_Id",
                data: '{DEPT_ID: ' + DEPT_ID + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () { $('#overlay').show(); },
                success: function (response) {
                    $('#overlay').hide();
                    $("#id").html(response.d.DEPT_ID);
                    $("#txtName").val(response.d.Name);
                    $("#txtLName").val(response.d.Last_Name);
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

        function AddNewDept() {

            $("#id").html(0);
            $("#txtName").val("");
            $("#txtLName").val("");

            editdialog.dialog("open");
        }

        function Del_Record(DEPT_ID) {
            $.ajax({
                type: "POST",
                url: "apis.aspx/P_Department_Delete",
                data: '{DEPT_ID: ' + DEPT_ID + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    FillTable();
                }
            });
        }

        function NameSearch() {
            $.ajax({
                type: "POST",
                url: "apis.aspx/P_Department_GetBy_Name",
                data: '{Name: "' + $("#textbox").val() + '",sOptions:"' + $("#ddlName").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () { $('#overlay').show(); },
                success: function (response) {
                    $("#Gettbl").html(response.d);
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

        <div style="padding: 10px">

            <label>Name:</label>
            &nbsp;
           
            <select id="ddlName">
                <option value="1">Starting with </option>
                <option value="2">containing </option>
                <option value="3">Ending with </option>
            </select>

            <input id="textbox" type="text" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input id="Button1" type="button" value="Filter" onclick="NameSearch()" />
        </div>

        <div>
            <button class="btn" type="button" onclick="AddNewDept();return false;">NEW Name</button>
        </div>
        <br />

        <div id="Gettbl"></div>
        <br />
        <div id="dialog" style="display: none">
            <b>Id:</b> <span id="id"></span>
            <br />
            <b>Name:</b>
            <input id="txtName" type="text" />
            <b>Last Name:</b>
            <input id="txtLName" type="text" />

        </div>
        <br />





    </form>
</body>
</html>
