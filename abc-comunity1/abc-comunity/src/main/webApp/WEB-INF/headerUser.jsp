<!-- Navigation -->
<%
Integer user_id = (Integer) request.getSession().getAttribute("user_id");
%>
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
                        <a class="nav-link page-scroll" href="../listJob" style="color : black;">List Job</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="emailConfirm" style="color : black;">Reset Password</a>
                    </li>
                    <!-- Dropdown Menu -->          
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle page-scroll" href="#video" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color : black;">VIDEO</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="article-details.html"><span class="item-text" style="color : black;">ARTICLE DETAILS</span></a>
                            <div class="dropdown-items-divide-hr"></div>
                            <a class="dropdown-item" href="terms-conditions.html"><span class="item-text" style="color : black;">TERMS CONDITIONS</span></a>
                            <div class="dropdown-items-divide-hr"></div>
                            <a class="dropdown-item" href="privacy-policy.html"><span class="item-text" style="color : black;">PRIVACY POLICY</span></a>
                        </div>
                    </li>
                    <!-- end of dropdown menu -->
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="../profileUser/<%= user_id %>" style="color : black;">PROFILE</a>
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
