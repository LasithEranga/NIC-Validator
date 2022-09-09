<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<% int i = 10;%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NIC Validator</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  <script src="https://kit.fontawesome.com/4f128951c5.js" crossorigin="anonymous"></script>
  <style>
    @media screen and (min-width: 480px) {
      body {
        height:100vh;
      }
    }
  </style>
</head>
<body class="d-flex justify-content-center align-items-center">

  <div class="container-fluid d-flex p-md-4 justify-content-center mt-3 mt-md-0 mb-3 mb-md-3">
    
    <div class="col-12 col-md-6 border p-4 shadow " >
    <div class=" fs-2 fw-semibold mb-4">NIC Validator</div>
    <div class="  fw-semibold mb-4">Update Info</div>
      
      <form:form action="editUser" id="form" method="post" modelAttribute="user">
        <input id="old-nic" hidden  name="old-nic" class="w-100 form-control" />
        
        <div class="d-md-flex justify-content-center mt-3 ">
          <form:label path="fullName"  class="col-12 col-md-4">Full Name:</form:label>
          <div class="w-100 mt-2 mt-md-0">
            <form:input id="fullName" onblur="validateName(fullNameField,fullNameError)"  path="fullName" class="w-100 form-control" />
            <div class="ps-2 d-none text-danger" id="fullNameError"></div>
          </div>
        </div>
        
        <div class="d-md-flex justify-content-center mt-3">
          <form:label path="nic"  class="col-12 col-md-4">NIC No:</form:label>
          <div class="w-100 mt-2 mt-md-0">
            <form:input id="nic" onblur="generateDobGenderAge()"  path="nic" class="w-100 form-control" />
            <div class="ps-2 d-none text-danger" id="nicError"></div>
          </div>
        </div>

        <div class="d-md-flex justify-content-center mt-3">
          <form:label path="dob"  class="col-12 col-md-4">Date of birth:</form:label>
          <div class="w-100 mt-2 mt-md-0">
            <form:input id="dob"  disabled="true" type="date" path="dob" class="w-100 form-control" />
            <div class="ps-2 d-none text-danger" id="dobError"></div>
          </div>
        </div>

        <div class="d-md-flex justify-content-center mt-3">
          <form:label path="age"  class="col-12 col-md-4">Age:</form:label>
          <div class="w-100 mt-2 mt-md-0">
            <form:input id="age" disabled="true" path="age" class="w-100 form-control" />
          </div>
        </div>

        <div class="d-md-flex justify-content-center mt-3">
          <form:label path="address" class="col-12 col-md-4">Address:</form:label>
          <div class="w-100 mt-2 mt-md-0">
            <form:textarea id="address" onblur="validateAddress(addressField,addressError)" path="address" class="w-100 form-control" />
            <div class="ps-2 d-none text-danger" id="addressError"></div>
          </div>
        </div>

        <div class="d-md-flex justify-content-center mt-3">
          <form:label path="nationality"  class="col-12 col-md-4">Nationality:</form:label>
          <div class="w-100 mt-2 mt-md-0">
            <form:select id="nationality" path="nationality" items="${nationalityList}"  class="form-select w-100" />
            <div class="ps-2 d-none text-danger" id="nationalityError"></div>
          </div>
        </div>

        <div class="d-md-flex justify-content-center mt-3">
          <form:label  path="gender" class="col-12 col-md-4">Gender:</form:label>
          <div class="w-100 mt-2 mt-md-0">
            <form:radiobutton id="male" disabled="true" path="gender" value="Male" /> Male
            <form:radiobutton id="female" disabled="true" class="ms-5" path="gender" value="Female" /> Female
            <div class="ps-2 d-none text-danger" id="genderError"></div>
          </div>
        <div class="d-flex justify-content-end mt-3">
          <form:button type="reset" onClick="setAge()" class="btn btn-secondary me-2 px-4">Reset</form:button>
          <input  type="button" id="btn-update" class="btn btn-success px-4" value="Submit" />
        </div>

      </form:form>
    </div>
    
  </div>


<%-- Modal dialog --%>
<div class="modal fade" id="warningModal" tabindex="-1" >
  <div class="modal-dialog modal-dialog-centered" >
    <div class="modal-content rounded-0 border-0" style="width:80%">
      <div class="modal-header border-0">
        <h5 class="modal-title">Are you sure?</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body border-0">
      You have changed the NIC.
      </div>
      <div class="modal-footer border-0">
        <button type="button" class="btn btn-secondary rounded-1" data-bs-dismiss="modal">Go Back</button>
        <button type="button" class="btn btn-primary rounded-1" id="btnOkay">Continue</button>
      </div>
    </div>
  </div>
</div>


<script src="./script.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<script>
      const buttonUpdate = document.getElementById("btn-update");
      
      const newNic = document.getElementById('nic');
      const oldNicField = document.getElementById('old-nic');
      const oldNic = newNic.value;
      oldNicField.value = oldNic;
      const warningModal = new bootstrap.Modal(document.getElementById('warningModal'));
      const btnOkay = document.getElementById('btnOkay');
      

      const setAge = () => {
        setTimeout(() => {
          let dob = new Date("${user.getDob()}").getFullYear();
          let currentYear = new Date().getFullYear();
          let age = currentYear - dob;
          ageField.value = age + " yrs";
        }, 100);
        
      }

      setAge();

      const submitForm = () => {
              //enable the elements before they were submitted otherwise saves as null ;-(
              dobField.removeAttribute("disabled");
              maleRadioBtn.removeAttribute("disabled");
              femaleRadioBtn.removeAttribute("disabled");
              form.submit();
          }

          const userActionHandler = () =>{
            //if user confirms the nic change, form will be submitted
              submitForm();
          }


      //setting the btnClick event seperately in add and update to implement the nic change warning feature
      //compare nic with old nic and display a warning
        buttonUpdate.addEventListener("click", () => {
          //validate name 
          let isNameValid = validateName(fullNameField,fullNameError);
          let isAddressValid = validateAddress(addressField,addressError);
          
          if(isNameValid && isAddressValid){
            if(newNic.value !== oldNic){
              btnOkay.setAttribute('onclick',"userActionHandler()");
              warningModal.show();
            }else{
              submitForm();
            }
          }
        }

      );

</script>
  


</body>
</html>