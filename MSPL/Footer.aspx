<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
        rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        $(function (e) {
            $("#dialog").dialog({
                modal: true,
                autoOpen: false,
                //title: "jQuery Dialog",
                width: 1400,
                height: 950
            });
            $(".btnShow").click(function () {
                $('#dialog').dialog('open');
             
            });
        });
    </script>

 <%--   <style>
        #dialog {
            width:auto;
            height:auto;
        }
    </style>--%>
</head>
<body>

  <a class="btnShow"> <img src="https://multiplestates.files.wordpress.com/2014/12/dsc04184.jpg?w=1200" /> </a>

    <div id="dialog" style="display: none" align="center">
   <img src="https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2015/08/1476830355set_timeout_2-01.png" style="width:auto;height:auto;" />
    </div>
    
    
      
       
    


</body>
</html>
