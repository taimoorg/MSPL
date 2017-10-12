<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Simple_Calculator.aspx.vb" Inherits="MSPL.Simple_Calculator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="StyleSheet.css" rel="stylesheet" />

     <script type="text/javascript">
         $(document).ready(function () {
            

         
         ////    $(function () {
         ////        $('#wrapper').on('keydown', '#result', function (e) { -1 !== $.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) || /65|67|86|88/.test(e.keyCode) && (!0 === e.ctrlKey || !0 === e.metaKey) || 35 <= e.keyCode && 40 >= e.keyCode || (e.shiftKey || 48 > e.keyCode || 57 < e.keyCode) && (96 > e.keyCode || 105 < e.keyCode) && e.preventDefault() });
         ////    });
         //    $("#result").keypress(function (e) {
         //        //if the letter is not digit then display error and don't type anything
               //  if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
         //            //display error message
         //            $("#errmsg").html("Digits Only").show().fadeOut("slow");
         //            return false;
         //        }
             //    });

                    //  var phoneRegExp = //new RegExp(/^(?=.*[0-9])[+0-9]+$/);  ^[. a-zA-Z0-9€£]+$

             var phoneRegExp = new RegExp("^[0-9?=.*!@#$%^&*]+$")
             $('#result').change(function () {
                 var val = $(this).val();
                 if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57))
                 //if (!phoneRegExp.test(val)) {
                   
                     // Replace anything that isn't a number or a plus sign
                     //$(this).val(val.replace(/([^+0-9]+)/gi, ''));
                     $("#errmsg").html("Digits Only").show().fadeOut("slow");
                             return false;
                 }
             //    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
             //        //display error message
             //        $("#errmsg").html("Digits Only").show().fadeOut("slow");
             //        return false;
             //    }
             );

           

             $(".btn").click(function () {
                 $("#result").val($("#result").val() + $(this).val());
             });
             
             $("#clear").click(function () {
                 $("#result").val("");
             });

             $("#calculate").click(function () {
                 $("#result").val(eval($("#result").val()))
             });

           
     
         });

         </script>


</head>
<body>
    <form id="form1" runat="server">
        <div id="wrapper">
            <header> <%--<input type ="text" id="result" onkeypress="return  Validate(event);" /> &nbsp;<span id="errmsg"></span> --%>
                <asp:TextBox ID="result" onkeypress="return Validate(event);" runat="server" />
            </header>

            <div id="body">
                <input type ="button" value ="7" class ="btn" />
                <input type ="button" value ="8" class ="btn" />
                <input type ="button" value ="9" class ="btn" />
                <input type ="button" value ="/" class ="btn" />
                <input type ="button" value ="4" class ="btn" />
                <input type ="button" value ="5" class ="btn" />
                <input type ="button" value ="6" class ="btn" />
                <input type ="button" value ="*" class ="btn" />
                <input type ="button" value ="1" class ="btn" />
                <input type ="button" value ="2" class ="btn" />
                <input type ="button" value ="3" class ="btn" />
                <input type ="button" value ="-" class ="btn" />
                <input type ="button" value ="0" class ="btn" />
                <input type ="button" value ="." class ="btn" />
                <input type ="button" value ="=" id="calculate" />
                <input type ="button" value ="+" class ="btn" />
                <input type ="button" value ="Clear" id="clear" />
            </div>

        </div>
    </form>
</body>
</html>
