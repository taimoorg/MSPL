<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Report.aspx.vb" Inherits="MSPL.Report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css" rel="stylesheet" type="text/css" />
    <title></title>

    <script type="text/javascript">

 
        $(document).ready(function () {

            DropDownList();
            $("[id$=ddlDepartments]").change(function () {
                FillEmp();
            });
        });
        function FillEmp()
        {
            alert($("[id$=ddlDepartments]").val());
        }
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
                              $("#ddlDepartments").append($("<option></option>").val
                              (value.DEPT_ID).html(value.Dept_Name));

                          });

                      },
                      error: function (Result) {
                          alert("Error");
                      }
                  });
              }
            

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server">
             <div>
                <fieldset style="width: 300px; height: 40px;">
                    <legend>Populate DropDownList</legend>
                    Select Department:
                    <asp:DropDownList ID="ddlDepartments" runat="server" Width="160px" />
                </fieldset>
            </div>
            <br />
            </asp:Panel>
    </form>
</body>
</html>
