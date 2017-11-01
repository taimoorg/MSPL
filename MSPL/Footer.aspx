﻿<html lang="en">
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

  <%--<a class="btnShow"> <img src="https://multiplestates.files.wordpress.com/2014/12/dsc04184.jpg?w=1200" /> </a>--%>

 <%--   <div id="dialog" style="display: none" align="center">
   <img src="https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2015/08/1476830355set_timeout_2-01.png" style="width:auto;height:auto;" />
    </div>--%>
    
    
      

     <div class="wrapper row1">
            <header id="header" class="hoc clear">
                <!-- ################################################################################################ -->
                <div id="logo" class="fl_left">
                    <h1><a href="index.html">Bronea</a></h1>
                </div>
                <!-- ################################################################################################ -->
                <nav id="mainav" class="fl_right">
                    <ul class="clear">
                        <li class="active"><a href="">Home</a></li>
                        <li>
                            <a class="drop" href="#">Pages</a>
                            <ul>
                                <li><a href="pages/gallery.html">Gallery</a></li>
                                <li><a href="pages/full-width.html">Full Width</a></li>
                                <li><a href="pages/sidebar-left.html">Sidebar Left</a></li>
                                <li><a href="pages/sidebar-right.html">Sidebar Right</a></li>
                                <li><a href="pages/basic-grid.html">Basic Grid</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="drop" href="#">Dropdown</a>
                            <ul>
                                <li><a href="#">Level 2</a></li>
                                <li>
                                    <a class="drop" href="#">Level 2 + Drop</a>
                                    <ul>
                                        <li><a href="#">Level 3</a></li>
                                        <li><a href="#">Level 3</a></li>
                                        <li><a href="#">Level 3</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Level 2</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Link Text</a></li>
                        <li><a href="#">Link Text</a></li>
                    </ul>
                </nav>
                <!-- ################################################################################################ -->
            </header>
        </div>

       
    <style>
        @charset "utf-8";
/*
Template Name: Bronea
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
Licence: Free to use under our free template licence terms
Licence URI: http://www.os-templates.com/template-terms
File: Layout CSS
*/

@import url("font-awesome.min.css");
@import url("framework.css");

/* Rows
--------------------------------------------------------------------------------------------------------------- */
.row0{border-top:1px solid;}
.row1, .row1 a{}
.row2, .row2 a{}
.row3, .row3 a{}
.row4, .row4 a{}
.row5, .row5 a{}


/* Top Bar
--------------------------------------------------------------------------------------------------------------- */
#topbar{padding:15px 0; font-size:.8rem; text-transform:uppercase;}

#topbar *{margin:0;}
#topbar ul li{display:inline-block; margin-right:10px; padding-right:15px; border-right:1px solid;}
#topbar ul li:last-child{margin-right:0; padding-right:0; border-right:none;}
#topbar i{margin:0 5px 0 0; line-height:normal;}


/* Header
--------------------------------------------------------------------------------------------------------------- */
#header{}

#header #logo{margin-top:25px;}
#header #logo *{margin:0; padding:0; line-height:1;}
#header #logo h1{font-size:32px; font-variant:small-caps;}


/* Page Intro
--------------------------------------------------------------------------------------------------------------- */
#pageintro{padding:150px 0;}

#pageintro article{}
#pageintro article div{margin-bottom:80px;}
#pageintro article div *{margin:0; padding:0; line-height:1;}
#pageintro article div .heading{margin-bottom:50px; font-size:40px;}
#pageintro article div p:first-of-type{margin-bottom:20px; font-size:18px;}
#pageintro article div p:last-of-type{}
#pageintro article footer{}


/* Content Area
--------------------------------------------------------------------------------------------------------------- */
.container{padding:80px 0;}

/* Content */
.container .content{}

.sectiontitle{display:block; max-width:55%; margin:0 auto 80px; text-align:center;}
.sectiontitle *{margin:0;}

.cta{}
.cta article{display:block; position:relative; padding:0 0 0 95px; line-height:normal;}
.cta article *{margin:0; padding:0;}
.cta article i{display:inline-block; position:absolute; top:0; left:0; width:85px; overflow:hidden; line-height:1; font-size:65px;}
.cta article .heading{margin-bottom:10px;}

.services{}
.services article{display:block; padding:30px; padding-top:150px;}
.services article *{margin:0; padding:0;}
.services article i{margin-bottom:15px;}
.services article .heading{margin-bottom:10px;}

/* Comments */
#comments ul{margin:0 0 40px 0; padding:0; list-style:none;}
#comments li{margin:0 0 10px 0; padding:15px;}
#comments .avatar{float:right; margin:0 0 10px 10px; padding:3px; border:1px solid;}
#comments address{font-weight:bold;}
#comments time{font-size:smaller;}
#comments .comcont{display:block; margin:0; padding:0;}
#comments .comcont p{margin:10px 5px 10px 0; padding:0;}

#comments form{display:block; width:100%;}
#comments input, #comments textarea{width:100%; padding:10px; border:1px solid;}
#comments textarea{overflow:auto;}
#comments div{margin-bottom:15px;}
#comments input[type="submit"], #comments input[type="reset"]{display:inline-block; width:auto; min-width:150px; margin:0; padding:8px 5px; cursor:pointer;}

/* Sidebar */
.container .sidebar{}

.sidebar .sdb_holder{margin-bottom:50px;}
.sidebar .sdb_holder:last-child{margin-bottom:0;}


/* Footer
--------------------------------------------------------------------------------------------------------------- */
#footer{padding:80px 0;}

#footer .heading{margin-bottom:50px; font-size:1.2rem;}

#footer .linklist li{display:block; margin-bottom:15px; padding:0 0 15px 0; border-bottom:1px solid;}
#footer .linklist li:last-child{margin:0; padding:0; border:none;}
#footer .linklist li::before, #footer .linklist li::after{display:table; content:"";}
#footer .linklist li, #footer .linklist li::after{clear:both;}

#footer .contact{}
#footer .contact.linklist li, #footer .contact.linklist li:last-child{position:relative; padding-left:40px;}
#footer .contact li *{margin:0; padding:0; line-height:1.6;}
#footer .contact li i{display:block; position:absolute; top:0; left:0; width:30px; font-size:16px; text-align:center;}


/* Copyright
--------------------------------------------------------------------------------------------------------------- */
#copyright{padding:20px 0;}
#copyright *{margin:0; padding:0;}


/* Transition Fade
This gives a smooth transition to "ALL" elements used in the layout - other than the navigation form used in mobile devices
If you don't want it to fade all elements, you have to list the ones you want to be faded individually
Delete it completely to stop fading
--------------------------------------------------------------------------------------------------------------- */
*, *::before, *::after{transition:all .3s ease-in-out;}
#mainav form *{transition:none !important;}


/* ------------------------------------------------------------------------------------------------------------ */
/* ------------------------------------------------------------------------------------------------------------ */
/* ------------------------------------------------------------------------------------------------------------ */
/* ------------------------------------------------------------------------------------------------------------ */
/* ------------------------------------------------------------------------------------------------------------ */


/* Navigation
--------------------------------------------------------------------------------------------------------------- */
nav ul, nav ol{margin:0; padding:0; list-style:none;}

#mainav, #breadcrumb, .sidebar nav{line-height:normal;}
#mainav .drop::after, #mainav li li .drop::after, #breadcrumb li a::after, .sidebar nav a::after{position:absolute; font-family:"FontAwesome"; font-size:10px; line-height:10px;}

/* Top Navigation */
#mainav{margin-left: 300px;}
#mainav ul.clear{margin-top:3px;}
#mainav ul{text-transform:uppercase;}
#mainav ul ul{z-index:9999; position:absolute; width:180px; text-transform:none;}
#mainav ul ul ul{left:180px; top:0;}
#mainav li{display:inline-block; position:relative; margin:0 15px 0 0; padding:0;}
#mainav li:last-child{margin-right:0;}
#mainav li li{width:100%; margin:0;}
#mainav li a{display:block; padding:30px 0;}
#mainav li li a{border:solid; border-width:0 0 1px 0;}
#mainav .drop{padding-left:15px;}
#mainav li li a, #mainav li li .drop{display:block; margin:0; padding:10px 15px;}
#mainav .drop::after, #mainav li li .drop::after{content:"\f0d7";}
#mainav .drop::after{top:35px; left:5px;}
#mainav li li .drop::after{top:15px; left:5px;}
#mainav ul ul{visibility:hidden; opacity:0;}
#mainav ul li:hover > ul{visibility:visible; opacity:1;}

#mainav form{display:none; margin:0; padding:0;}
#mainav form select, #mainav form select option{display:block; cursor:pointer; outline:none;}
#mainav form select{width:100%; padding:5px; border:none;}
#mainav form select option{margin:5px; padding:0; border:none;}

/* Breadcrumb */
#breadcrumb{padding:120px 0 30px;}
#breadcrumb ul{margin:0 0 30px 0; padding:0 0 8px 0; list-style:none; text-transform:uppercase; border-bottom:1px solid;}
#breadcrumb li{display:inline-block; margin:0 6px 0 0; padding:0;}
#breadcrumb li a{display:block; position:relative; margin:0; padding:0 12px 0 0; font-size:12px;}
#breadcrumb li a::after{top:3px; right:0; content:"\f101";}
#breadcrumb li:last-child a{margin:0; padding:0; font-weight:700;}
#breadcrumb li:last-child a::after{display:none;}
#breadcrumb .heading{margin:0; font-size:2rem;}

/* Sidebar Navigation */
.sidebar nav{display:block; width:100%;}
.sidebar nav li{margin:0 0 3px 0; padding:0;}
.sidebar nav a{display:block; position:relative; margin:0; padding:5px 10px 5px 15px; text-decoration:none; border:solid; border-width:0 0 1px 0;}
.sidebar nav a::after{top:9px; left:5px; content:"\f101";}
.sidebar nav ul ul a{padding-left:35px;}
.sidebar nav ul ul a::after{left:25px;}
.sidebar nav ul ul ul a{padding-left:55px;}
.sidebar nav ul ul ul a::after{left:45px;}

/* Pagination */
.pagination{display:block; width:100%; text-align:center; clear:both;}
.pagination li{display:inline-block; margin:0 2px 0 0;}
.pagination li:last-child{margin-right:0;}
.pagination a, .pagination strong{display:block; padding:8px 11px; border:1px solid; background-clip:padding-box; font-weight:normal;}

/* Back to Top */
#backtotop{z-index:999; display:inline-block; position:fixed; visibility:hidden; bottom:20px; right:20px; width:36px; height:36px; line-height:36px; font-size:16px; text-align:center; opacity:.2;}
#backtotop i{display:block; width:100%; height:100%; line-height:inherit;}
#backtotop.visible{visibility:visible; opacity:.5;}
#backtotop:hover{opacity:1;}


/* Tables
--------------------------------------------------------------------------------------------------------------- */
table, th, td{border:1px solid; border-collapse:collapse; vertical-align:top;}
table, th{table-layout:auto;}
table{width:100%; margin-bottom:15px;}
th, td{padding:5px 8px;}
td{border-width:0 1px;}


/* Gallery
--------------------------------------------------------------------------------------------------------------- */
#gallery{display:block; width:100%; margin-bottom:50px;}
#gallery figure figcaption{display:block; width:100%; clear:both;}
#gallery li{margin-bottom:30px;}


/* ------------------------------------------------------------------------------------------------------------ */
/* ------------------------------------------------------------------------------------------------------------ */
/* ------------------------------------------------------------------------------------------------------------ */
/* ------------------------------------------------------------------------------------------------------------ */
/* ------------------------------------------------------------------------------------------------------------ */


/* Colours
--------------------------------------------------------------------------------------------------------------- */
body{color:#7F7F7F; background-color:#252525;}
a{color:#D01818;}
a:active, a:focus{background:transparent;}/* IE10 + 11 Bugfix - prevents grey background */
hr, .borderedbox{border-color:#D7D7D7;}
label span{color:#FF0000; background-color:inherit;}
input:focus, textarea:focus, *:required:focus{border-color:#D01818;}
.overlay{color:#FFFFFF; background-color:inherit;}
.overlay::after{color:inherit; background-color:rgba(0,0,0,.55);
                 background-image:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAIAAAACCAYAAABytg0kAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAABhJREFUeNpiYGBgePz//38GRhABAgABBgBFTAbfCBNE2AAAAABJRU5ErkJggg==");}

.btn, .btn.inverse:hover{color:#FFFFFF; background-color:#D01818; border-color:#D01818;}
.btn:hover, .btn.inverse{color:inherit; background-color:transparent; border-color:inherit;}


/* Rows */
.row0, .row0 a{color:#7F7F7F;}
.row0{border-color:#D01818;}
.row1{color:#FFFFFF; background-color:rgba(37,37,37,.5);/* #252525 */}
.row2{color:#141414; background-color:#F3F3F3;}
.row3{color:#141414; background-color:#FFFFFF;}
.row4{color:#7F7F7F; background-color:#010101;}
.row5, .row5 a{color:#7F7F7F; background-color:#252525;}


/* Top Bar */
#topbar ul li{border-color:rgba(255,255,255,.2);}
#topbar div:first-of-type li:first-child a{color:#D01818;}


/* Header */
#header #logo h1 a{color:inherit; background-color:inherit;}


/* Content Area */
.cta article i{color:rgba(0,0,0,.2);}
.cta article:hover .heading a, .cta article:hover i{color:inherit;}

.services article *{color:#FFFFFF;}
.services article:hover{box-shadow:5px 5px 0px #D01818;}
.services article:hover a{color:#D01818;}


/* Footer */
#footer .heading{color:#FFFFFF;}
#footer hr, #footer .borderedbox, #footer .linklist li{border-color:rgba(255,255,255,.2);}


/* Navigation */
#mainav li a{color:inherit;}
#mainav .active a, #mainav a:hover, #mainav li:hover > a{color:#D01818; background-color:inherit;}
#mainav li li a, #mainav .active li a{color:#FFFFFF; background-color:rgba(37,37,37,.5);/* #252525 */ border-color:rgba(0,0,0,.6);}
#mainav li li:hover > a, #mainav .active .active > a{color:#FFFFFF; background-color:#D01818;}
#mainav form select{color:#FFFFFF; background-color:#141414;}

#breadcrumb ul{border-color:rgba(255,255,255,.1);}
#breadcrumb a{color:inherit; background-color:inherit;}
#breadcrumb li:last-child a{color:#D01818;}

.container .sidebar nav a{color:inherit; border-color:#D7D7D7;}
.container .sidebar nav a:hover{color:#D01818;}

.pagination a, .pagination strong{border-color:#D7D7D7;}
.pagination .current *{color:#FFFFFF; background-color:#D01818;}

#backtotop{color:#FFFFFF; background-color:#D01818;}


/* Tables + Comments */
table, th, td, #comments .avatar, #comments input, #comments textarea{border-color:#D7D7D7;}
#comments input:focus, #comments textarea:focus, #comments *:required:focus{border-color:#D01818;}
th{color:#FFFFFF; background-color:#373737;}
tr, #comments li, #comments input[type="submit"], #comments input[type="reset"]{color:inherit; background-color:#FBFBFB;}
tr:nth-child(even), #comments li:nth-child(even){color:inherit; background-color:#F7F7F7;}
table a, #comments a{background-color:inherit;}


/* ------------------------------------------------------------------------------------------------------------ */
/* ------------------------------------------------------------------------------------------------------------ */
/* ------------------------------------------------------------------------------------------------------------ */
/* ------------------------------------------------------------------------------------------------------------ */
/* ------------------------------------------------------------------------------------------------------------ */


/* Media Queries
--------------------------------------------------------------------------------------------------------------- */
@-ms-viewport{width:device-width;}


/* Max Wrapper Width - Laptop, Desktop etc.
--------------------------------------------------------------------------------------------------------------- */
@media screen and (min-width:978px){
	.hoc{max-width:978px;}
}


/* Mobile Devices
--------------------------------------------------------------------------------------------------------------- */
@media screen and (max-width:900px){
	.hoc{max-width:90%;}

	#topbar{}

	#header{padding:30px 0;}
	#header #logo{margin:0;}

	#mainav{}
	#mainav ul{display:none;}
	#mainav form{display:block; margin-top:5px;}

	#breadcrumb{}

	.container{}
	#comments input[type="reset"]{margin-top:10px;}
	.pagination li{display:inline-block; margin:0 5px 5px 0;}

	#footer{}

	#copyright{}
	#copyright p:first-of-type{margin-bottom:10px;}
}


@media screen and (max-width:750px){
	.imgl, .imgr{display:inline-block; float:none; margin:0 0 10px 0;}
	.fl_left, .fl_right{display:block; float:none;}
	.group .group > *:last-child, .clear .clear > *:last-child, .clear .group > *:last-child, .group .clear > *:last-child{margin-bottom:0;}/* Experimental - Needs more testing in different situations, stops double margin when stacking */
	.one_half, .one_third, .two_third, .one_quarter, .two_quarter, .three_quarter{display:block; float:none; width:auto; margin:0 0 30px 0; padding:0;}

	#topbar{padding-top:15px; text-align:center;}
	#topbar ul{margin:0 0 15px 0; line-height:normal;}

	#header{text-align:center;}
	#header #logo{margin:0 0 30px 0;}

	#mainav form{margin-top:0;}

	#pageintro article div .heading{margin-bottom:30px; font-size:38px;}
	#pageintro article div p:first-of-type{margin-bottom:20px; font-size:18px;}

	.services article{max-width:320px;}

	.container, #footer{padding-bottom:50px;}/* Not neccessary - just looks better */
}


@media screen and (max-width:450px){
	#topbar ul li{margin-bottom:2px; padding-right:0; border-right:none;}
}


/* Other
--------------------------------------------------------------------------------------------------------------- */
@media screen and (max-width:650px){
	.scrollable{display:block; width:100%; margin:0 0 30px 0; padding:0 0 15px 0; overflow:auto; overflow-x:scroll;}
	.scrollable table{margin:0; padding:0; white-space:nowrap;}

	.inline li{display:block; margin-bottom:10px;}
	.pushright li{margin-right:0;}

	.font-x2{font-size:1.4rem;}
	.font-x3{font-size:1.6rem;}
}
    </style>


</body>
</html>
