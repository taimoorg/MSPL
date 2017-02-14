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
                     $("#divtbl").html(response.d);

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
        <div id="divtbl" ></div>
    
    </div>
    </form>
</body>
</html>
