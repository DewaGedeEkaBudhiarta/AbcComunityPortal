<%@ taglib prefix="ud" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="search_index" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bulk Email</title>

<!-- style -->
  <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:200,300">
  <link rel="stylesheet" href="CSS/bulkEmail.css">

<!-- style navigation -->  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700&display=swap&subset=latin-ext" rel="stylesheet">
  <link href="CSS/bootstrap.css" rel="stylesheet">
  <link href="CSS/fontawesome-all.css" rel="stylesheet">
  <link href="CSS/styles.css" rel="stylesheet">
  
</head>
<body data-spy="scroll" data-target=".fixed-top">

<%if(session.getAttribute("user_role").equals("ADMIN")){%>
	<jsp:include page="header.jsp"/>
<%} %>
<%if(session.getAttribute("user_role").equals("USER")){%>
	<jsp:include page="headerUser.jsp"/>
<%} %>

<main class="main bg-white px-6 md:px-16 py-6" style="padding-top: 120px">
<!-- /.compose message -->
      <div class="dialog">
        <div class="content">
          <div class="body" style="display: flex; justify-content: center;">
            <sf:form role="form" class="form-horizontal" action="sendEmail" method="post" modelAttribute="sendEmail" style="width: 80%;">
                <div class="form-group">
                  <label class="col-sm-2" for="inputTo"><span class="glyphicon glyphicon-user"></span>To</label>
                  <div class="col-sm-10"><sf:input type="email" path="receiver" class="form-control" id="inputTo" placeholder="email of user" /></div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2" for="inputSubject"><span class="glyphicon glyphicon-list-alt"></span>Subject</label>
                  <div class="col-sm-10"><sf:input type="text" path="subject" class="form-control" id="inputSubject" placeholder="subject" /></div>
                </div>
                <div class="form-group">
                  <label class="col-sm-12" for="inputBody"><span class="glyphicon glyphicon-list"></span>Message</label>
                  <div class="col-sm-10"><sf:textarea class="form-control" path="message" id="inputBody" rows="8"></sf:textarea></div>
                </div>
                <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                  <button type="submit" class="btn btn-primary" >Send<i class="fa fa-arrow-circle-right fa-lg"></i></button>
                </div>
            </sf:form>
      	</div><!-- body -->
        </div><!-- /.content -->
      </div><!-- /.dialog -->
</main>

</body>
</html>