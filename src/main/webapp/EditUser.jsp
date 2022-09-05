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
      
      <form:form action="editUser" id="form" method="post" modelAttribute="user">
        <input id="old-nic" hidden  name="old-nic" class="w-100 form-control" />
        
        <div class="d-flex justify-content-center mt-3 ">
          <form:label path="fullName"  class="col-4">Full Name:</form:label>
          <div class="w-100">
            <form:input id="fullName" onblur="validateName(fullNameField,fullNameError)"  path="fullName" class="w-100 form-control" />
            <div class="ps-2 d-none text-danger" id="fullNameError"></div>
          </div>
        </div>
        
        <div class="d-flex justify-content-center mt-3">
          <form:label path="nic"  class="col-4">NIC No:</form:label>
          <div class="w-100">
            <form:input id="nic" onblur="generateDobGenderAge()"  path="nic" class="w-100 form-control" />
            <div class="ps-2 d-none text-danger" id="nicError"></div>
          </div>
        </div>

        <div class="d-flex justify-content-center mt-3">
          <form:label path="dob"  class="col-4">Date of birth:</form:label>
          <div class="w-100">
            <form:input id="dob"  disabled="true" type="date" path="dob" class="w-100 form-control" />
            <div class="ps-2 d-none text-danger" id="dobError"></div>
          </div>
        </div>

        <div class="d-flex justify-content-center mt-3">
          <form:label path="age"  class="col-4">Age:</form:label>
          <div class="w-100">
            <form:input id="age" disabled="true" path="age" class="w-100 form-control" />
          </div>
        </div>

        <div class="d-flex justify-content-center mt-3">
          <form:label path="address" class="col-4">Address:</form:label>
          <div class="w-100">
            <form:textarea id="address" onblur="validateAddress(addressField,addressError)" path="address" class="w-100 form-control" />
            <div class="ps-2 d-none text-danger" id="addressError"></div>
          </div>
        </div>

        <div class="d-flex justify-content-center mt-3">
          <form:label path="nationality"  class="col-4">Nationality:</form:label>
          <div class="w-100">
            <form:select id="nationality" path="nationality" items="${nationalityList}"  class="form-select w-100" />
            <div class="ps-2 d-none text-danger" id="nationalityError"></div>
          </div>
        </div>

        <div class="d-flex justify-content-center mt-3">
          <form:label  path="gender" class="col-4">Gender:</form:label>
          <div class="w-100">
            <form:radiobutton id="male" disabled="true" path="gender" value="Male" /> Male
            <form:radiobutton id="female" disabled="true" class="ms-5" path="gender" value="Female" /> Female
            <div class="ps-2 d-none text-danger" id="genderError"></div>
          </div>
        <div class="d-flex justify-content-end mt-3">
        
          <form:button type="reset" class="btn btn-secondary me-2 px-4">Clear</form:button>
          <form:button  type="button" id="btn-submit" class="btn btn-success px-4" >Save</form:button>
          </div>
      </form:form>
    </div>
    
  </div>

     <script src="./script.js" ></script>
<script>
      let dob = new Date("${user.getDob()}").getFullYear();
      let currentYear = new Date().getFullYear();
      let age = currentYear - dob;
      ageField.value = age + " yrs";

      document.getElementById("old-nic").value = document.getElementById("nic").value;
</script>
  


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>