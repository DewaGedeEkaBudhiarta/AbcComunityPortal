<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>header</title>
<!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700&display=swap&subset=latin-ext" rel="stylesheet">
    <link href="CSS/bootstrap.css" rel="stylesheet">
    <link href="CSS/fontawesome-all.css" rel="stylesheet">
	<link href="CSS/styles.css" rel="stylesheet">
	
<!-- Favicon  -->
    <link rel="icon" href="images/favicon.png">	
</head>

<body>
<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top bg-primary">
        <div class="container-fluid">

            <!-- Text Logo - Use this if you don't have a graphic logo -->
            <a class="navbar-brand logo-text page-scroll" href="home">ABC</a>

            <!-- Image Logo -->
           <!--<a class="navbar-brand logo-image" href="/"><img src="images/logo.svg" alt="alternative"></a>-->
            
            <!-- Mobile Menu Toggle Button -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-awesome fas fa-bars"></span>
                <span class="navbar-toggler-awesome fas fa-times"></span>
            </button>
            <!-- end of mobile menu toggle button -->

            <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="../home" style="color : black;">HOME <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="../jobPost" style="color : black;">Job Posting</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="../view" style="color : black;">LIST USER</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link page-scroll" href="../formEmail" style="color : black;">BULK EMAIL</a>
                    </li>
                </ul>
                <span class="nav-item">
                    <a class="btn-outline-sm" href="/logout" style="color : black;">LOG OUT</a>
                </span>
            </div>
            <form class="d-flex" method="post" action="/search">
            	<input type ="hidden" name ="${_csrf.parameterName }" value ="${_csrf.token }"/>
	        	<input class="form-control me-sm-2" type="text" placeholder="Search" name="search">
	        	<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
	      	</form>
        </div> <!-- end of container -->
    </nav> <!-- end of navbar -->
    <!-- end of navigation -->
</body>
</html>