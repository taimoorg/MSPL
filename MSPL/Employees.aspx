<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Employees.aspx.vb" Inherits="MSPL.Employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
     <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
     <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />

    <title></title>
    <script type ="text/javascript">

        var editdialog
        $(document).ready(function () {
            SetDialog();
            FillEmpTable();
        });

        function FillEmpTable() {
            $.ajax({
                type: "Post",
                url: "apisEmployee.aspx/GetEmpTable",
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
                model: true,
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
                url: "apisEmployee.aspx/P_Empolyee_IU",
                data: '{Emp_ID: ' + $("#id").html() + ',Emp_Name:"' + $("#txtName").val() + '",Emp_Address:"'+$("#txtAddress").val()+'"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () { $('#overlay').show(); },
                success: function (response) {
                    $('#overlay').hide();
                    editdialog.dialog("close");
                    FillEmpTable();
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

        function AddNewEmp() {
            $("#id").html(0);
            $("#txtName").val("");

            editdialog.dialog("open");
        }

        function Del_Record(Emp_ID) {
            $.ajax({
                type: "POST",
                url: "apisEmployee.aspx/P_Empolyee_Delete",
                data: '{Emp_ID: ' + Emp_ID + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    FillEmpTable();
                }
            });
        }

        function OpenDialog(Emp_ID) {
            $.ajax({
                type: "Post",
                url: "apisEmployee.aspx/P_Department_GetBy_Id",
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

    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            <button id="btn" type="button" onclick="AddNewEmp();return false;">Add Employee </button>
        </div>
        <br />
        <br />
        <div id="Gettbl"></div>
        
        <div id="dialog" style ="display :none " >
            <b>Id:</b> <span id="id"></span> <br />
            <b>Employee Name </b>
            <input id ="txtName" type="text" /> 
            <b>Employee Address </b>
            <input id ="txtAddress" type="text" /> 


        </div>
    
    </div>
    </form>
</body>
</html>
