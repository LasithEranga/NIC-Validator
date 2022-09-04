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
</head>
<body class="d-flex justify-content-center align-items-center vh-100" >
 
    <div class="col-6 border p-5 shadow " >
      <div class=" fs-2 fw-semibold mb-4">NIC Validator</div>
      <div class="  fw-semibold mb-4">Your Info</div>
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
          <div>: ${users[0].getDob()}</div>
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
        <form>
        <input type="reset" value="Delete" class="btn btn-secondary me-2 px-4">
        </form>

        <form action="/edit-user" method="GET">
          <input hidden value="${users[0].getNic()}" name="nic"/>
          <input type="submit" value="Update" class="btn btn-success px-4">
        </form>
          
        </div>
    </div>
  </div>
    

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>