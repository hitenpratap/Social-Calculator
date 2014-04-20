<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Social Calculator</title>

    <script src="${resource(dir: 'js',file: 'jquery-2.1.0.min.js')}"></script>
    <script src="${resource(dir: 'js',file: 'jquery-ui-1.10.4.min.js')}"></script>
    <script src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>

    <link href="${resource(dir: 'css',file: 'jquery-ui-1.10.4.min.css')}" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link href="${resource(dir: 'css',file: 'bootstrap.min.css')}" rel="stylesheet">

    <!-- Add custom CSS here -->
    <style>
    body {
        margin-top: 60px;
    }
    </style>

    <g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <g:link controller="socialCalc" action="index" class="navbar-brand">Social Calc</g:link>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <g:layoutBody/>

    </body>
</html>
