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
<header>
    <div class="d-flex bg-light py-3 shadow"> 

        <div class="col-6 ps-3 fs-3 fw-bold">
          User Management System
        </div>

        <div class="d-flex col-6 justify-content-end pe-5">
          <div class="col-7 d-flex align-items-center">
            <input type="text" class="w-100 p-2  ps-3" placeholder="Search">
            <button class="btn btn-primary h-100 ms-2 px-3"><i class="fa-solid fa-magnifying-glass"></i></button>
          </div>
        </div>

    </div>
  </header>
 

  <div class="container-fluid d-flex p-4 justify-content-center">
    
    <div class=" col-6 border p-4 shadow " >
      <div class=" fs-3 mb-4">New User</div>
      <form:form action="saveUser" method="post" modelAttribute="user">
        <div class="d-flex justify-content-center mt-3 ">
          <form:label  class="col-4">Full Name:</label>
          <form:input  path="full_name" class="w-100 form-control" />
        </div>

        <div class="d-flex justify-content-center mt-3">
          <form:label  class="col-4">NIC No:</form:label>
          <form:input  id="nic" path="nic" class="w-100 form-control" />
        </div>

        <div class="d-flex justify-content-center mt-3">
          <form:label  class="col-4">Date of birth:</form:label>
          <form:input type="date" path="dob" class="w-100 form-control" />
        </div>

        <div class="d-flex justify-content-center mt-3">
          <form:label path="address" class="col-4">Address:</form:label>
          <form:textarea  path="address" class="w-100 form-control" ></form:textarea>
        </div>

        <div class="d-flex justify-content-center mt-3">
          <form:label  class="col-4">Nationality:</form:label>
          <form:select path="nationality"  class="form-select w-100">
            <form:option value="Sinhalese">Sinhalese</form:option>
            <form:option value="Tamil">Tamil</form:option>
          </form:select>
        </div>

        <div class="d-flex justify-content-center mt-3">
          <form:label for="gender" class="col-4">Gender:</form:label>
          <div class="w-100">
            <form:radiobutton  path="gender" value="Male" /> Male
            <form:radiobutton  class="ms-5" path="gender" value="Female" /> Female
          </div>
        </div>

        <div class="d-flex justify-content-end mt-3">
          <form:button value="Reset" class="btn btn-secondary me-2 px-4" />
          <form:button  value="Save" class="btn btn-success px-4" />
        </div>
      </form:form>
    </div>
    
  </div>

  


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>