<%@ taglib prefix="ud" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="search_index" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile User</title>
<link rel="stylesheet" href="CSS/profile.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700&display=swap&subset=latin-ext" rel="stylesheet">
<link href="/CSS/bootstrap.css" rel="stylesheet">
<link href="CSS/fontawesome-all.css" rel="stylesheet">
<link href="CSS/styles.css" rel="stylesheet">
<style>
width:100%;
</style>
</head>

<body data-spy="scroll" data-target=".fixed-top">
<%if(session.getAttribute("user_role").equals("ADMIN")){%>
	<jsp:include page="header.jsp"/>
<%} %>
<%if(session.getAttribute("user_role").equals("USER")){%>
	<jsp:include page="headerUser.jsp"/>
<%} %>

<div class="container">
<form action="update" method="get">
<div class="row gutters">
<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
<div class="card h-100">
	<div class="card-body">
		<div class="account-settings">
			<div class="user-profile">
				<div class="user-avatar">
					<img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Maxwell Admin">
				</div>
				<h5 class="user-name">${User.username}</h5>
				<h6 class="user-email">${User.email}</h6>
			</div>
		</div>
	</div>
</div>
</div>
<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
<div class="card h-100">
	<form action="update" method="post">
	<div class="card-body">
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<h6 class="mb-2 text-primary">Personal Details</h6>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group" style="display:none;">
					<label for="id">id</label>
					<input type="text" class="form-control" id="id" name="uid" readonly="readonly" value="${viewProfile.id_user}" style="display:none;">
				</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="UserName">username</label>
					<input type="text" class="form-control" id="username" placeholder="Enter username" name="username" value="${viewProfile.username}" >
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12" style="display:none;">
				<div class="form-group">
					<label for="password">password</label>
					<input type="text" class="form-control" id="password" placeholder="Enter password" name="password" value="${viewProfile.password}">
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="FirstName">First name</label>
					<input type="text" class="form-control" id="firstName" placeholder="Enter first name" name="firstname" value="${viewProfile.firstname}" >
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="LastName">Last name</label>
					<input type="text" class="form-control" id="lastName" placeholder="Enter last name" name="lastname" value="${viewProfile.lastname}" >
				</div>
			</div>
			<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<h6 class="mt-3 mb-2 text-primary">Address</h6>
				<input type="text" class="form-control" id="address" placeholder="Enter address" name="Address" value="${viewProfile.address}">
			</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="eMail">Email</label>
					<input type="email" class="form-control" id="eMail" placeholder="Enter email ID" name="Email" value="${viewProfile.email}">
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="phone">Phone</label>
					<input type="text" class="form-control" id="phone" placeholder="Enter phone number" name="Phone" value="${viewProfile.phone}">
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12" style="display:none;">
				<div class="form-group">
					<label for="phone">Role</label>
					<input type="text" class="form-control" id="role" readonly="readonly" name="Role" value="${viewProfile.role}" style="display:none;">
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="website">Website URL</label>
					<input type="url" class="form-control" id="website" placeholder="Website url" value="www.websutekln.com" readonly="readonly">
				</div>		
			</div>
		</div>
			<div>
			<center>
			<input type="submit" class="btn-outline-sm" href="update" style="color : black;" value="Submit">
            </center>
			</div>
		</div>
	</div>
	</form>
</div>
</div>
</div>
</form>
</div>

 <!-- Footer -->
    <svg class="footer-frame" data-name="Layer 2" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none" viewBox="0 0 1920 79"><defs><style>.cls-2{fill:#5f4def;}</style></defs><title>footer-frame</title><path class="cls-2" d="M0,72.427C143,12.138,255.5,4.577,328.644,7.943c147.721,6.8,183.881,60.242,320.83,53.737,143-6.793,167.826-68.128,293-60.9,109.095,6.3,115.68,54.364,225.251,57.319,113.58,3.064,138.8-47.711,251.189-41.8,104.012,5.474,109.713,50.4,197.369,46.572,89.549-3.91,124.375-52.563,227.622-50.155A338.646,338.646,0,0,1,1920,23.467V79.75H0V72.427Z" transform="translate(0 -0.188)"/></svg>
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="footer-col first">
                        <h4>About ABC Jobs</h4>
                        <p class="p-small">We're passionate about designing and developing one of the best marketing apps in the market</p>
                    </div>
                </div> <!-- end of col -->
                <div class="col-md-4">
                    <div class="footer-col middle">
                        <h4>Important Links</h4>
                        <ul class="list-unstyled li-space-lg p-small">
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">Our business partners <a class="white" href="#your-link">startupguide.com</a></div>
                            </li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">Read our <a class="white" href="terms-conditions.html">Terms & Conditions</a>, <a class="white" href="privacy-policy.html">Privacy Policy</a></div>
                            </li>
                        </ul>
                    </div>
                </div> <!-- end of col -->
                <div class="col-md-4">
                    <div class="footer-col last">
                        <h4>Contact</h4>
                        <ul class="list-unstyled li-space-lg p-small">
                            <li class="media">
                                <i class="fas fa-map-marker-alt"></i>
                                <div class="media-body">22 Innovative, San Francisco, CA 94043, US</div>
                            </li>
                            <li class="media">
                                <i class="fas fa-envelope"></i>
                                <div class="media-body"><a class="white" href="mailto:contact@tivo.com">contact@ABCJobs.com</a> <i class="fas fa-globe"></i><a class="white" href="#your-link">www.ABCJobs.com</a></div>
                            </li>
                        </ul>
                    </div> 
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of footer -->  
    <!-- end of footer -->
    
     <!-- Copyright -->
    <div class="copyright">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p class="p-small">Copyright © 2020 <a href="https://inovatik.com">Template by Inovatik</a><br>
                        Distributed By <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
                    </p>
                </div> <!-- end of col -->
            </div> <!-- enf of row -->
        </div> <!-- end of container -->
    </div> <!-- end of copyright --> 
    <!-- end of copyright -->

</body>
</html>