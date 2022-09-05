<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
  <script></script>
</head>
<body class="d-flex justify-content-center align-items-center vh-100" >

    <div class="col-6 border p-5 shadow " >
      <div class=" fs-2 fw-semibold mb-4">NIC Validator</div>
      <div class="  fw-semibold mb-4">Your Info</div>
      <div class="text-center" id="no-info">
        Sorry! No infomation available to show ...  <a href="/add-new" class="ms-3"> Add info</a>
      </div>
      <div id="content" >
        <div class="d-flex justify-content-start mt-3 ">
          <div class="col-3">Full Name</div>
          <div>: ${users[0].getFullName()}</div>
        </div>

        <div class="d-flex justify-content-start mt-3 ">
          <div class="col-3">NIC No</div>
          <div>: ${users[0].getNic()}</div>
        </div>

        <div class="d-flex justify-content-start mt-3 ">
          <div class="col-3">Date of birth</div>
          <div>: ${users[0].getDob()}</div>
        </div>

        <div class="d-flex justify-content-start mt-3 ">
          <div class="col-3">Age</div>
          <div>: <span id="age"></span></div>
        </div>

        <div class="d-flex justify-content-start mt-3 ">
          <div class="col-3">Address</div>
          <div>: ${users[0].getAddress()}</div>
        </div>

        <div class="d-flex justify-content-start mt-3 ">
          <div class="col-3">Nationality</div>
          <div>: ${users[0].getNationality()}</div>
        </div>

        <div class="d-flex justify-content-start mt-3 ">
          <div class="col-3">Gender</div>
          <div>: ${users[0].getGender()}</div>
        </div>

        <div class="d-flex justify-content-end mt-3">
        <form action="/delete-user" method="POST">
          <input hidden value="${users[0].getNic()}" name="nic"/>
          <input type="submit" value="Delete" class="btn btn-secondary me-2 px-4">
        </form>

        <form action="/edit-user" method="GET">
          <input hidden value="${users[0].getNic()}" name="nic"/>
          <input type="submit" value="Update" class="btn btn-success px-4">
        </form>
          
        </div>
    </div>
  </div>


<div class="toast-container position-fixed bottom-0 start-0 p-3" style="width:20rem;">
  <div id="toast" class="toast" role="alert">
    <div class="toast-header">
      <i class="fa-sharp fa-solid fa-circle-info text-primary me-2"></i>
      <strong class="me-auto">NIC Validator</strong>
      <small>Just now</small>
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">
      ${message}
    </div>
  </div>
</div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    
    <script>

      const haveData = ${users.size()};
      const noInfo = document.getElementById("no-info");
      const content = document.getElementById("content");
      const ageContainer = document.getElementById("age");
      const toastMessage = document.getElementById('toast');
      const haveMessage = "${message}";
      
      let dob = new Date("${users[0].getDob()}").getFullYear();
      let currentYear = new Date().getFullYear();
      let age = currentYear - dob;
      ageContainer.innerText = age + " yrs";

      //display no info dialog if no users are available in database.
      if(haveData === 0){
        content.style.display = "none";
        noInfo.style.display = "unset";
      }
      else{
        noInfo.style.display = "none";
        content.style.display = "unset";
      }


      //show if there are any messages to show
      if(haveMessage){
        new bootstrap.Toast(toastMessage).show();
      }



      
    </script>
</body>
</html>