<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<% int i = 10;%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  <script src="https://kit.fontawesome.com/4f128951c5.js" crossorigin="anonymous"></script>
</head>
<body>
<h2>User Registration</h2>
        <form:form action="register" method="post" modelAttribute="car">
            <form:label path="name">Full name:</form:label>
            <form:input path="name" class="form-control"/><br/>
             
            <form:button>Register</form:button>
            <form:button type="reset">Clear</form:button>
        </form:form>
</body>
</html>