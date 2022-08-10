<%@ taglib prefix="ud" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="search_index" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=">
  <title>Job Posting</title>
  
<!-- style -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.4.6/tailwind.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css">
  
<!-- style navigation -->  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700&display=swap&subset=latin-ext" rel="stylesheet">
  <link href="CSS/bootstrap.css" rel="stylesheet">
  <link href="CSS/fontawesome-all.css" rel="stylesheet">
  <link href="CSS/styles.css" rel="stylesheet">
  
<!-- javascript description -->
<script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>
  
</head>

<body data-spy="scroll" data-target=".fixed-top">

<%if(session.getAttribute("user_role").equals("ADMIN")){%>
	<jsp:include page="header.jsp"/>
<%} %>
<%if(session.getAttribute("user_role").equals("USER")){%>
	<jsp:include page="headerUser.jsp"/>
<%} %>
  
  <main class="main bg-white px-6 md:px-16 py-6" style="padding-top: 120px">
    <div class="w-full max-w-xl mx-auto">
      <sf:form action="jobPost" method="post" modelAttribute="postJob">
        <h1 class="text-2xl mb-2">Post new job</h1>
        
        <div class="job-info border-b-2 py-2 mb-5">
          <!--    Title      -->
          <div class="mb-4">
            <label class="block text-gray-700 text-sm mb-2" for="job-title">Title</label>
            <sf:input class="appearance-none block w-full bg-white text-gray-700 border border-gray-400 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:border-gray-500" type="text" id="job-title" name="job-title" path="Title" placeholder="Frontend Developer" autofocus="autofocus" />
          </div>

          <!--     Link to apply     -->
          <div class="mb-4">
            <label class="block text-gray-700 text-sm mb-2" for="apply-link">Link to apply</label>
            <sf:input class="appearance-none block w-full bg-white text-gray-700 border border-gray-400 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:border-gray-500" type="text" id="apply-link" name="apply-link" path="LinkApply" placeholder="https://www.djangoproject.com/apply" />
          </div>

          <div class="md:flex md:justify-between">
            <!--      Job Type      -->
            <div class="w-full md:w-3/12 mb-4 md:mb-0">
                <label class="block text-gray-700 text-sm mb-2" for="job-type">
                  Job Type
                </label>
                <div class="relative">
                  <sf:select class="block appearance-none w-full bg-white border border-gray-400 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:border-gray-500" id="job-type" name="job-type" path="JobType">
                    <option>Full-time</option>
                    <option>Part-time</option>
                    <option>Freelance</option>
                    <option>Contract</option>
                  </sf:select>

                  <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
                    <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
                  </div>
                </div>
            </div>

            <!--     Location       -->
            <div class="w-full md:w-8/12 mb-4 md:mb-0">
              <label for="location" class="block text-gray-700 text-sm mb-2">Location</label>
              <sf:input type="text" class="appearance-none block w-full bg-white text-gray-700 border border-gray-400 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:border-gray-500" id="location" name="location" path="Location" placeholder="Schwerin" />

              <div>
                <label class="text-gray-600 flex items-center" for="remote">
                  <input class="mr-2 leading-tight" type="checkbox" id="remote">
                  <span class="text-sm">Work can be done remotely</span>
                </label>
              </div>
            </div>
          </div> <!-- end group -->

          <!--    Description      -->
          <div>
            <label for="description" class="block text-gray-700 text-sm mb-2">Description</label>
            <sf:textarea name="description" id="description" cols="" rows="" path="Description"></sf:textarea>
          </div>

          <div class="flex flex-wrap -mx-3">
            <!--     Company       -->
            <div class="w-full md:w-1/2 px-3 mb-4 md:mb-0">
              <label for="company" class="block text-gray-700 text-sm mb-2">Company</label>
              <sf:input type="text" class="appearance-none block w-full bg-white text-gray-700 border border-gray-400 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:border-gray-500" id="company" name="company" path="Company" placeholder="Company" />
            </div>
            
            <!--     Salary       -->
            <div class="w-full md:w-1/2 px-3 mb-4 md:mb-0">
              <label for="salary" class="block text-gray-700 text-sm mb-2">salary</label>
              <sf:input type="integer" class="appearance-none block w-full bg-white text-gray-700 border border-gray-400 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:border-gray-500" id="Salary" name="Salary" path="Salary" placeholder="$" />
            </div>
           
          </div> <!-- end group -->
        </div> <!-- end job-info -->
        <!--     Submit     -->
        <div>
          <button class="bg-teal-500 hover:bg-teal-600 text-white py-2 px-3 rounded" type="submit">Create job</button>
        </div>
        
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      </sf:form>
    </div>
  </main>
  
<script type="text/javascript">

let simpleMde = new SimpleMDE({
	  element: document.getElementById("description")
	})
</script>

</body>
</html>
