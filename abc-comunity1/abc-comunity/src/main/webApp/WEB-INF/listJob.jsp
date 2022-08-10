<%@ taglib prefix="ud" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="search_index" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List JOb</title>

<!-- style -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css" integrity="sha256-3sPp8BkKUE7QyPSl6VfBByBroQbKxKG7tsusY2mhbVY=" crossorigin="anonymous" />
<link rel="stylesheet" href="CSS/jobList.css">

<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700&display=swap&subset=latin-ext" rel="stylesheet">
<link href="CSS/bootstrap.css" rel="stylesheet">
<link href="CSS/fontawesome-all.css" rel="stylesheet">
<link href="CSS/styles.css" rel="stylesheet">

</head>
<body>

<%if(session.getAttribute("user_role").equals("ADMIN")){%>
	<jsp:include page="header.jsp"/>
<%} %>
<%if(session.getAttribute("user_role").equals("USER")){%>
	<jsp:include page="headerUser.jsp"/>
<%} %>

<div class="row" style="padding-top: 120px">
                <div class="col-lg-10 mx-auto">
                    <div class="career-search mb-60">

                        <div class="filter-result">
                        	<ud:forEach var="jobList" items="${jobListing}">
                            <div class="job-box d-md-flex align-items-center justify-content-between mb-30">
                                <div class="job-left my-4 d-md-flex align-items-center flex-wrap">
                                    <div class="img-holder mr-md-4 mb-md-0 mb-4 mx-auto mx-md-0 d-md-none d-lg-flex">
                                        FD
                                    </div>
                                    <div class="job-content">
                                        <h5 class="text-center text-md-left">${jobList.getTitle()}</h5>
                                        <ul class="d-md-flex flex-wrap text-capitalize ff-open-sans">
                                            <li class="mr-md-4">
                                                <i class="zmdi zmdi-pin mr-2"></i> ${jobList.getLocation()}
                                            </li>
                                            <li class="mr-md-4">
                                                <i class="zmdi zmdi-money mr-2"></i> ${jobList.getSalary()}
                                            </li>
                                            <li class="mr-md-4">
                                                <i class="zmdi zmdi-city mr-2"></i> ${jobList.getCompany()}
                                            </li>
                                            <li class="mr-md-4">
                                                <i class="zmdi zmdi-time mr-2"></i> ${jobList.getJobType()}
                                            </li>
                                        </ul>
                                        <p style="font-weight:bold;"> ${jobList.getDescription()}</p>
                                    </div>
                                </div>
                                <div class="job-right my-4 flex-shrink-0">
                                    <a href="${jobList.getLinkApply()}" class="btn d-block w-100 d-sm-inline-block btn-light">Apply now</a>
                                </div>
                            </div>
                            </ud:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
</body>
</html>