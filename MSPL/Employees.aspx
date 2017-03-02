<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Employees.aspx.vb" Inherits="MSPL.Employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />

    <title></title>
    <script type="text/javascript">

     var editdialog
      $(document).ready(function () {
          SetDialog();
          FillEmpTable();
          DropDownList();

     // OUTER DROP DOWN LIST
          DropDown();
          $("[id$=ddl]").change(function () {
              DllEmp();
          });
      });

    function DllEmp() {
  // alert($("[id$=ddl]").val()); [ IN THIS WAY WE CAN USE THE ID OD DROP DOWN LIST ]
        $.ajax({
            type: "Post",
            url: "apisEmployee.aspx/P_Emp_GetBy_Dept",
            data: '{DEPT_ID:"' + ($("[id$=ddl]").val()) + '"}',
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
        // INNER DROP DOWN LIST
    function DropDownList() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "apis.aspx/PopulateDropDownList",
            data: "{}",
            dataType: "json",
            success: function (Result) {
                Result = Result.d;
                $.each(Result, function (key, value) {
                    $("[id$=ddlDepartments]").append($("<option></option>").val
                    (value.DEPT_ID).html(value.Dept_Name));
                });
            },
            error: function (Result) {
                alert("Error");
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
               // DllEmp();    [ SHOW RECODR BY DEFAULT VALUE IS SELECTED IN THE DROP DOWN LIST AT FIEST TIME] 
           },
            error: function (Result) {
                alert("Error");
            }
        });
    }

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
            data: '{Emp_ID: ' + $("#id").html() + ',Emp_Name:"' + $("#txtName").val() + '",Emp_Address:"' + $("#txtAddress").val() + '",DEPT_ID:"' + ($("[id$=ddlDepartments]").val()) + '",Hire_Date:"' + $("#datepicker").val() + '",Emp_Shift:"' + $("#ddlShift").val()  + '"}',
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
        $("#txtName").val("");  // IN THIS WAY THE TEXT FEILD IS EMPTY WHEN THE NEW RECORD IS INSERT
        $("#txtAddress").val("");
        $("#ddlDepartments").val($("[id$=ddl]").val()); // [THE OUTER DROPDOWN ID IS USE WITHIN THE INNER DROPDOWN TO FILL INNER DROPDOWN WITH THE SAME VALUE OF OUTER DROPDOWN LIST]
        $("#datepicker").datepicker();

        $("#ddlShift").val("")

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
            url: "apisEmployee.aspx/P_Empolyee_GetBy_Id",
            data: '{Emp_ID: ' + Emp_ID + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            beforeSend: function () { $('#overlay').show(); },
            success: function (response) {
                $('#overlay').hide();
                $("#id").html(response.d.Emp_ID);
                $("#txtName").val(response.d.Emp_Name);
                $("#txtAddress").val(response.d.Emp_Address); // RETURNED THE SAME RECORD WHICH WAS INSERTED AT NEW EMPLOYEE
                $("#ddlDepartments").val(response.d.DEPT_ID);
                $("#ddlShift").val(response.d.Emp_Shift);
                $("#datepicker").datepicker().val(response.d.Hire_Date);

                
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
                <b>Search By Department:</b>
                <asp:DropDownList ID="ddl" runat="server" Width="160px" />
            </div>
            <br />

            <div>
                <button id="btn" type="button" onclick="AddNewEmp();return false;">Add Employee </button>
            </div>

            <br />
            <br />

            <div id="Gettbl"></div>

           <div id="dialog" style="display: none">
                 <b>Id:</b> <span id="id"></span>
            <br />
                <p>
                <b>Employee Name: </b>
                    <input id="txtName" type="text" />
            <br />
                 <b>Employee Address: </b>
                   <input id="txtAddress" type="text" />
            <br />

                <b>Hire Date:</b> <input type="text" id="datepicker"/>
               <br />

         <%--USE DYNAMIC DROPDOWN LIST--%>
                <b>Select Department:</b>
                  <asp:DropDownList ID="ddlDepartments" runat="server" Width="160px" />
               <br />
              
        <%--USE MANUAL DROPDOWN LIST--%>
               <b> Select Shift </b> 
                  <select id="ddlShift" style ="width :180px">
                  <option value="Morning">Morning </option>
                  <option value="Evening">Evening </option>
                  <option value="Night">Night </option>.
                  <option value="Mid_Night">Mid Night  </option>

            </select>
                   </p>
           </div>
       </div>
    </form>
</body>
</html>
