<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirm reset</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
   <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700&display=swap&subset=latin-ext" rel="stylesheet">
    <link href="CSS/bootstrap.css" rel="stylesheet">
    <link href="CSS/fontawesome-all.css" rel="stylesheet">
	<link href="CSS/styles.css" rel="stylesheet">
	
	<!-- Favicon  -->
    <link rel="icon" href="images/favicon.png">
</head>
<!-- Header -->
    <header id="header" class="ex-2-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Reset Password Confirmation</h1>                                  
                    <div class="form-container">
                    
                        <form id="code" data-toggle="validator" data-focus="false" action="forgotPassword" method="get">
                            <div class="form-group">
                                <input type="text" class="form-control-input" id="code" 
                                required="required" minlength="4" maxlength="4" title="please enter the valid code">
                                <label class="label-control" for="code">Code</label>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <input type="submit" class="form-control-submit-button" ></input>
                            </div>
                            </form>
                            
              			</div> <!-- end of form container -->
                    <!-- end of sign up form -->

                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </header> <!-- end of ex-header -->
    <!-- end of header -->               
</body>
</html>