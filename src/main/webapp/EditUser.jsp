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
      <form action="">
        <div class="d-flex justify-content-center mt-3 ">
          <label for="full_name" class="col-4">Full Name:</label>
          <input type="text" id="full_name" name="full_name" class="w-100 form-control">
        </div>

        <div class="d-flex justify-content-center mt-3">
          <label for="nic" class="col-4">NIC No:</label>
          <input type="text" id="nic" name="nic" class="w-100 form-control">
        </div>

        <div class="d-flex justify-content-center mt-3">
          <label for="dob" class="col-4">Date of birth:</label>
          <input type="date" id="dob" name="dob" class="w-100 form-control">
        </div>

        <div class="d-flex justify-content-center mt-3">
          <label for="address" class="col-4">Address:</label>
          <textarea id="address" name="address" class="w-100 form-control" ></textarea>
        </div>

        <div class="d-flex justify-content-center mt-3">
          <label for="nationality" class="col-4">Nationality:</label>
          <select name="nationality" id="nationality" class="form-select w-100">
            <option value="Sinhalese">Sinhalese</option>
            <option value="Tamil">Tamil</option>
          </select>
        </div>

        <div class="d-flex justify-content-center mt-3">
          <label for="gender" class="col-4">Gender:</label>
          <div class="w-100">
            <input type="radio" name="gender" value="Male"> Male
            <input type="radio" class="ms-5" name="gender" value="Female"> Female
          </div>
        </div>

        <div class="d-flex justify-content-end mt-3">
          <input type="reset" value="Reset" class="btn btn-secondary me-2 px-4">
          <input type="submit" value="Save" class="btn btn-success px-4">
        </div>
      </form>
    </div>
    
  </div>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>