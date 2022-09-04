<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    <div class="  fw-semibold mb-4">Add Info</div>
    <div>
      <form:form action="add-new" id="form" method="post" modelAttribute="user">
        
        <div class="d-flex justify-content-center mt-3 ">
          <form:label path="fullName"  class="col-4">Full Name:</form:label>
          <div class="w-100">
            <form:input id="fulName"  path="fullName" class="w-100 form-control" />
            <div class="ps-2 d-none text-danger" id="fullNameError"></div>
          </div>
        </div>
        
        <div class="d-flex justify-content-center mt-3">
          <form:label path="nic"  class="col-4">NIC No:</form:label>
          <div class="w-100">
            <form:input id="nic"  path="nic" class="w-100 form-control" />
            <div class="ps-2 d-none text-danger" id="nicError"></div>
          </div>
        </div>

        <div class="d-flex justify-content-center mt-3">
          <form:label path="dob"  class="col-4">Date of birth:</form:label>
          <div class="w-100">
            <form:input type="date" id="dob" path="dob" class="w-100 form-control" />
            <div class="ps-2 d-none text-danger" id="dobError"></div>
          </div>
        </div>

        <div class="d-flex justify-content-center mt-3">
          <form:label path="address" class="col-4">Address:</form:label>
          <div class="w-100">
            <form:textarea id="address" path="address" class="w-100 form-control" />
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
          <form:label path="gender" class="col-4">Gender:</form:label>
          <div class="w-100">
            <form:radiobutton  path="gender" value="Male" /> Male
            <form:radiobutton  class="ms-5" path="gender" value="Female" /> Female
            <div class="ps-2 d-none text-danger" id="genderError"></div>
          </div>
        <div class="d-flex justify-content-end mt-3">
        
          <form:button type="reset" class="btn btn-secondary me-2 px-4">Clear</form:button>
          <form:button  type="button" id="btn-submit" class="btn btn-success px-4" >Save</form:button>
          </div>
      </form:form>
    </div>

     <script>
      const nicField = document.getElementById("nic");
      const nicError = document.getElementById("nicError");

      const fulNameField = document.getElementById("fulName");
      const fulNameError = document.getElementById("fulNameError");

      const dobField = document.getElementById("dob");
      const dobError = document.getElementById("dobError");

      const addressField = document.getElementById("address");
      const addressError = document.getElementById("addressError");

      const nationalityField = document.getElementById("nationality");
      const nationalityError = document.getElementById("nationalityError");

      const genderError = document.getElementById("genderError");

      const nic = nicField.value;
      const months = [31,29,31,30,31,30,31,31,30,31,30,31];
    
      const validateNIC = () => {
        let validNic = false;
        let oldNIC = false;

        if(nic.length === 0){
          nicField.classList.add("is-invalid")
          nicError.innerText = "Please enter NIC number";
          nicError.classList.remove("d-none");
        }
        else{

        if(nic.length === 12){
          validNic = true;
          oldNIC = false;
        }
        else if(nic.length === 10){
          validNic = true;
          oldNIC = true;
        }

        let gender = "";
        let year;
        let month;
        let date;
        let monthDate;
        let yearDigits;

        if(validNic){
          
          //set nic as correct
          nicField.classList.add("is-valid");
          nicField.classList.remove("is-invalid");
          nicError.classList.add("d-none");
          

          if(oldNIC){
          yearDigits = Number(nic.substring(0,2));
          monthDate = Number(nic.substring(2,5));
          year = 1900 + yearDigits;
          }
          else{
            yearDigits = Number(nic.substring(0,4));
            monthDate = Number(nic.substring(4,7));
            year = yearDigits;
          }

          if(monthDate > 500){
            monthDate = monthDate-500;
            gender = "Female";
          }else{
            gender = "Male";
          }


          let tempMd = monthDate;

          for(let i=0; i<12; i++){
              if(tempMd <= months[i]){
                  month = i+1;
                  break;
              }
              else{

                  tempMd = tempMd - months[i];
              }
          }

          // date
          for(let i=0; i < month-1; i++){
              monthDate = monthDate - months[i];
          }
          date = monthDate;

          return [year,month,date,gender];

        }else{
          //invalid nic
          //set field validation fail
          nicField.classList.add("is-invalid");
          nicError.innerText = "Please enter a valid NIC number";
          nicError.classList.remove("d-none");

        }
                  
        }

      }



      const buttonClick = document.getElementById("btn-submit")
      const form = document.getElementById('form')
      buttonClick.addEventListener('click',() => {
        const [year,month,date,gender] = validateNIC();
      })
    </script>
    
  </div>

  


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>