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
<body class="d-flex justify-content-center align-items-center vh-100">

  <div class="container-fluid d-flex p-4 justify-content-center">
    
    <div class="col-6 border p-4 shadow " >
    <div class=" fs-2 fw-semibold mb-4">NIC Validator</div>
    <div class="  fw-semibold mb-4">Update Info</div>
      
      <form:form action="/editUser" method="post" modelAttribute="user">
        
        <div class="d-flex justify-content-center mt-3 ">
          <form:label path="fullName"  class="col-4">Full Name:</form:label>
          <form:input  path="fullName" class="w-100 form-control" />
        </div>
        
        <div class="d-flex justify-content-center mt-3">
          <form:label path="nic"  class="col-4">NIC No:</form:label>
          <form:input   path="nic" class="w-100 form-control" />
        </div>

        <div class="d-flex justify-content-center mt-3">
          <form:label path="dob"  class="col-4">Date of birth:</form:label>
          <form:input type="date" path="dob" class="w-100 form-control" />
        </div>

        <div class="d-flex justify-content-center mt-3">
          <form:label path="address" class="col-4">Address:</form:label>
          <form:textarea  path="address" class="w-100 form-control" />
        </div>

        <div class="d-flex justify-content-center mt-3">
          <form:label path="nationality"  class="col-4">Nationality:</form:label>
          <form:select path="nationality" items="${nationalityList}"  class="form-select w-100" />
        </div>

        <div class="d-flex justify-content-center mt-3">
          <form:label path="gender" class="col-4">Gender:</form:label>
          <div class="w-100">
            <form:radiobutton  path="gender" value="Male" /> Male
            <form:radiobutton  class="ms-5" path="gender" value="Female" /> Female
            </div>
        <div class="d-flex justify-content-end mt-3">
        
          <form:button type="reset" class="btn btn-secondary me-2 px-4">Clear</form:button>
          <form:button  type="submit" class="btn btn-success px-4" >Update</form:button>
          </div>
      </form:form>
    </div>
    
  </div>

  


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>