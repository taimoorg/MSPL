<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CascadeDropdown.aspx.vb" Inherits="MSPL.CascadeDropdown" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
    <title></title>

     <script type="text/javascript">
     
         $(document).ready(function () {
             EmpDropDown();

             DropDown();
             $("[id$=ddl]").change(function () {
                 DllEmp();
             });
         });

         function DllEmp() {
             $.ajax({
                 type: "POST",
                 contentType: "application/json; charset=utf-8",
                 url: "apis.aspx/EmpDropDownList",
                 data: '{DEPT_ID:"' + ($("[id$=ddl]").val()) + '"}',
                 dataType: "json",
                 success: function (Result) {
                     $("[id$=ddlEmp]").empty();
                     Result = Result.d;
                     $.each(Result, function (key, value) {
                         $("[id$=ddlEmp]").append($("<option></option>").val
                         (value.Emp_ID).html(value.Emp_Name));
                     });
                    
                 },
                 error: function (Result) {
                     alert("Emp Error");
                 }
             });

         }

         // OUTER DROP DOWN LIST
         function DropDown() {
             $.ajax({
                 type: "POST",
                 contentType: "application/json; charset=utf-8",
                 url: "apis.aspx/PopulateDropDownList",
                 data: "{}",
                 dataType: "json",
                 success: function (Result) {
                     Result = Result.d;
                     $.each(Result, function (key, value) {
                         $("[id$=ddl]").append($("<option></option>").val
                         (value.DEPT_ID).html(value.Dept_Name));
                     });
                     DllEmp();
                 },
                 error: function (Result) {
                     alert("Dept Error");
                 }
             });
         }

         function EmpDropDown() {
             $.ajax({
                 type: "POST",
                 contentType: "application/json; charset=utf-8",
                 url: "apis.aspx/EmpDropDownList",
                 data: "{}",
                 dataType: "json",
                 success: function (Result) {
                     Result = Result.d;
                     $.each(Result, function (key, value) {
                         $("[id$=ddlEmp]").append($("<option></option>").val
                         (value.Emp_ID).html(value.Emp_Name));
                     });
                 },
                 error: function (Result) {
                   alert("emp Error");
                 }
             });
         }

     

     </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <div>
                <b>Search By Department:</b>
                <asp:DropDownList ID="ddl" runat="server" Width="160px" />
            </div>

                <br />
        <b>Employee</b>
                <asp:DropDownList ID="ddlEmp" runat="server" Width="160px" />
    
    
    </form>
</body>
</html>
