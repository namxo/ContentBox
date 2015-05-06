﻿<cfoutput>
#html.doctype()#
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
    <head>
        <!--- charset --->
        <meta charset="utf-8" />
        <!--- IE Stuff --->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--- Robots --->
        <meta name="robots" content="noindex,nofollow" />
        <!--- SES --->
        <base href="#cb.siteBaseURL()#" />
        <!--- Title --->
        <title>ContentBox Modular CMS - #cb.r( "common.login@security" )#</title>
        <!--- Description --->
        <meta name="description" content="ContentBox Modular CMS - Admin">
        <!--- Viewport for scaling --->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

        <!--- ********************************************************************* --->
        <!---                           FAVICONS                                    --->
        <!--- ********************************************************************* --->

        <!--- Favicon --->
        <link href="#prc.cbroot#/includes/images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
        <!--- For non-Retina iPhone, iPod Touch, and Android 2.2+ devices: --->
        <link href="#prc.cbroot#/includes/images/ContentBox-Circle-57.png" rel="apple-touch-icon"/>
        <!--- For first-generation iPad: --->
        <link href="#prc.cbroot#/includes/images/ContentBox-Circle-72.png" rel="apple-touch-icon" sizes="72x72"/>
        <!--- For iPhone 4 with high-resolution Retina display: --->
        <link href="#prc.cbroot#/includes/images/ContentBox-Circle-114.png" rel="apple-touch-icon" sizes="114x114"/>
        <!-- Favicon -->
        <link href="#prc.cbroot#/includes/images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
        
        <!--- ********************************************************************* --->
        <!---                           CSS 	                                    --->
        <!--- ********************************************************************* --->

        <!--// Bootstrap core CSS-->
        <link href="#prc.cbroot#/includes/spacelab/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <!--// custom admintheme files-->
        <link href="#prc.cbroot#/includes/css/contentbox.css" rel="stylesheet" />
        <!--// fonts from font awesome-->
        <link href="#prc.cbroot#/includes/spacelab/css/font-awesome.min.css" rel="stylesheet" />
        <!--// css animate-->
        <link href="#prc.cbroot#/includes/spacelab/css/animate.css" rel="stylesheet" />
        <!--// toastr-->
        <link href="#prc.cbroot#/includes/css/toastr.min.css" rel="stylesheet" />
        <!--// custom styles for spacelab-->
        <link href="#prc.cbroot#/includes/spacelab/css/main.css" rel="stylesheet" />
        
       	<!--- ********************************************************************* --->
        <!---                           JAVASCRIPT                                  --->
        <!--- ********************************************************************* --->

        <!--// modernizr for feature detection-->
        <script src="#prc.cbroot#/includes/spacelab/js/modernizr-2.6.2.min.js"></script>
        <!--// jquery main-->
        <script src="#prc.cbroot#/includes/spacelab/js/jquery-1.10.2.min.js"></script>
        <!--// bootstrap js-->
        <script src="#prc.cbroot#/includes/spacelab/plugins/bootstrap/js/bootstrap.min.js"></script>
        <!--// spacelab js-->
        <script src="#prc.cbroot#/includes/spacelab/js/application.js"></script>
        <!--// cookie helper-->
        <script src="#prc.cbroot#/includes/js/jquery.cookie.js"></script>
        <!--// validation-->
        <script src="#prc.cbroot#/includes/spacelab/plugins/validation/js/jquery.validate.min.js"></script>
        <!--// jwerty-->
        <script src="#prc.cbroot#/includes/js/jwerty.js"></script>
        <!--// toastr-->
        <script src="#prc.cbroot#/includes/js/toastr.min.js"></script>
        <!--// main ContentBox scripts-->
        <script src="#prc.cbroot#/includes/js/contentbox.js"></script>
	    
	    <!--- ********************************************************************* --->
        <!---                           FONTS 	                                    --->
        <!--- ********************************************************************* --->

	    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,900,300italic,400italic,600italic,700italic,900italic' rel='stylesheet' type='text/css'>
	    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
	   
	    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
	    <script src="assets/js/html5shiv.js"></script>
	    <script src="assets/js/respond.min.js"></script>
	    <![endif]-->

		<!--- cbadmin Event --->
		#announceInterception("cbadmin_beforeLoginHeadEnd")#
	</head>
	<body class="animated fadeIn">
		<!--- cbadmin Event --->
		#announceInterception("cbadmin_afterLoginBodyStart")#
		
		<div id="wrapper">
			<!--- NavBar --->
			<div class="navbar navbar-fixed-top navbar-inverse" id="adminMenuTopNav">
			    <div class="navbar-inner">
			    	<div class="container">
			    		<!--- Logo --->
						<img src="#prc.cbroot#/includes/images/ContentBox_30.png" id="logo" title="ContentBox Modular CMS"/>
						<!--- Brand, future multi-site switcher --->
						<a class="brand">
							ContentBox
						</a>
						<!--- i18n navbar --->
						<ul class="nav pull-right">
							<li class="dropdown">
								<a href="##" class="dropdown-toggle" data-toggle="dropdown" role="button">
									<i class="fa fa-globe"></i> #cb.r( "lang.localize@cbcore" )# <b class="caret"></b>
									<ul role="menu" class="dropdown-menu">
										<cfloop array="#prc.langs#" index="thisLang">
										<li><a href="#prc.xehLang#/#thisLang#">#cb.r( "lang.#listFirst( thisLang, "_" )#@cbcore" )#</a></li>
										</cfloop>
									</ul>
								</a>
							</li>
						</ul>
					</div> <!---end container --->
			    </div> <!--- end navbar-inner --->
		    </div> <!---end navbar --->
			
			<!--- Container --->
			<section id="login-container">
				<!--- cbadmin event --->
				#announceInterception("cbadmin_beforeLoginContent")#
				<!--- Main Content --->
				#renderView()#
				<!--- cbadmin event --->
				#announceInterception("cbadmin_afterLoginContent")#
			</section>
		</div>
		<!--- Footer --->
		#renderView(view="_tags/footer", module="contentbox-admin")#
		<!--- cbadmin Event --->
		#announceInterception("cbadmin_beforeLoginBodyEnd")#
	</body>
</html>
</cfoutput>