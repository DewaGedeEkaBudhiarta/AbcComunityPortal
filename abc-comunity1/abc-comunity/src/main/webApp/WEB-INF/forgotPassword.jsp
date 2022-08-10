<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/forgotPassword.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css%22/%3E">
</head>
<body>
  
    <div class="container">
      <div class="wrapper">
        <div class="title"><span>Forgot Password</span></div>
        <form action="resetPassword" method="post">
        
        <input type="text" class="form-control" id="id" name="uid" readonly="readonly" value="${formForgotPassword.id_user}" style="display:none;">
        
        <input type="text" class="form-control" id="username" placeholder="Enter username" name="username" value="${formForgotPassword.username}" readonly="readonly" style="display:none;">
        
        <input type="text" class="form-control" id="firstName" placeholder="Enter first name" name="firstname" value="${formForgotPassword.firstname}" readonly="readonly" style="display:none;">
        
        <input type="text" class="form-control" id="lastName" placeholder="Enter last name" name="lastname" value="${formForgotPassword.lastname}" readonly="readonly" style="display:none;">
        
        <input type="text" class="form-control" id="address" placeholder="Enter address" name="Address" value="${formForgotPassword.address}" readonly="readonly" style="display:none;">
        
        <input type="email" class="form-control" id="eMail" placeholder="Enter email ID" name="Email" value="${formForgotPassword.email}" readonly="readonly" style="display:none;">
        
        <input type="text" class="form-control" id="phone" placeholder="Enter phone number" name="Phone" value="${formForgotPassword.phone}" readonly="readonly" style="display:none;">
        
        <input type="text" class="form-control" id="role" readonly="readonly" name="Role" value="${formForgotPassword.role}" style="display:none;" readonly="readonly" style="display:none;">
        
        
          <div class="row">
            <i class="fas fa-lock"></i>
            <input type="password" placeholder="New Password" required name="password">
          </div>
          <div class="row">
            <i class="fas fa-lock"></i>
            <input type="password" placeholder="Re-enter Password" required name="confirmPassword">
          </div>
          <div class="pass"><a href="login">Login</a></div>
          <div class="row button">
            <input type="submit" value="Reset">
          </div>
          <div class="signup-link">Not a member? <a href="register">Signup now</a></div>
          
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          
        </form>
      </div>
    </div>

  </body>
</html>