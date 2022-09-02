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
    <div class="d-flex bg-secondary py-3"> 

        <div class="col-6 ps-3 fs-3 fw-bold text-light">
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

  <div class="container-fluid p-4">
    <div class="justify-content-start align-items-top p-2 gap-0 " style="background-color:#EBEBEB;height: 80vh;overflow-y: scroll;">
    
      <div class="fs-2 fw-bold">Users</div>
   
      <div class="d-flex flex-wrap">

      <div class="col-3 p-2">
        <div class="border position-relative p-3 bg-light shadow">
          <div class="bg-primary position-absolute rounded-circle d-flex justify-content-center align-items-center " style="top: 10px;right: 10px; width: 35px;height: 35px;">M</div>

          <div class="d-flex">
            <div class="col-3">Name</div>
            <span>:</span>
            <div class="col-5 ps-2">Lasith Eranda Handapangoda</div>
          </div>
          <div class="d-flex">
            <div class="col-3">NIC</div>
            <span>:</span>
            <div class="col-5 ps-2">990811130V</div>
          </div>

          <div class="d-flex">
            <div class="col-3">Age</div>
            <span>:</span>
            <div class="col-5 ps-2">23 yrs</div>
          </div>

          <div class="d-flex">
            <div class="col-3">Address</div>
            <span>:</span>
            <div class="col-7 ps-2">200D, Thibbotugoda, Pokunuwita</div>
          </div>

          <div class="d-flex justify-content-end">
            <div class="text-light bg-danger me-2 d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;"><i class="fa-solid fa-user-minus"></i></div>
            <div class="text-light bg-success d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;"><i class="fa-sharp fa-solid fa-user-pen"></i></div>
          </div>

        </div>
      </div>

      <div class="col-3 p-2 ">
        <div class="border position-relative p-3 bg-light shadow">
          <div class="bg-primary position-absolute rounded-circle d-flex justify-content-center align-items-center " style="top: 10px;right: 10px; width: 35px;height: 35px;">M</div>

          <div class="d-flex">
            <div class="col-3">Name</div>
            <span>:</span>
            <div class="col-5 ps-2">Lasith Eranda Handapangoda</div>
          </div>
          <div class="d-flex">
            <div class="col-3">NIC</div>
            <span>:</span>
            <div class="col-5 ps-2">990811130V</div>
          </div>

          <div class="d-flex">
            <div class="col-3">Age</div>
            <span>:</span>
            <div class="col-5 ps-2">23 yrs</div>
          </div>

          <div class="d-flex">
            <div class="col-3">Address</div>
            <span>:</span>
            <div class="col-7 ps-2">200D, Thibbotugoda, Pokunuwita</div>
          </div>

          <div class="d-flex justify-content-end">
            <div class="text-light bg-danger me-2 d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;"><i class="fa-solid fa-user-minus"></i></div>
            <div class="text-light bg-success d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;"><i class="fa-sharp fa-solid fa-user-pen"></i></div>
          </div>

        </div>
      </div>

      <div class="col-3 p-2 ">
        <div class="border position-relative p-3 bg-light shadow">
          <div class="bg-primary position-absolute rounded-circle d-flex justify-content-center align-items-center " style="top: 10px;right: 10px; width: 35px;height: 35px;">M</div>

          <div class="d-flex">
            <div class="col-3">Name</div>
            <span>:</span>
            <div class="col-5 ps-2">Lasith Eranda Handapangoda</div>
          </div>
          <div class="d-flex">
            <div class="col-3">NIC</div>
            <span>:</span>
            <div class="col-5 ps-2">990811130V</div>
          </div>

          <div class="d-flex">
            <div class="col-3">Age</div>
            <span>:</span>
            <div class="col-5 ps-2">23 yrs</div>
          </div>

          <div class="d-flex">
            <div class="col-3">Address</div>
            <span>:</span>
            <div class="col-7 ps-2">200D, Thibbotugoda, Pokunuwita</div>
          </div>

          <div class="d-flex justify-content-end">
            <div class="text-light bg-danger me-2 d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;"><i class="fa-solid fa-user-minus"></i></div>
            <div class="text-light bg-success d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;"><i class="fa-sharp fa-solid fa-user-pen"></i></div>
          </div>

        </div>
      </div>

      <div class="col-3 p-2 ">
        <div class="border position-relative p-3 bg-light shadow">
          <div class="bg-primary position-absolute rounded-circle d-flex justify-content-center align-items-center " style="top: 10px;right: 10px; width: 35px;height: 35px;">M</div>

          <div class="d-flex">
            <div class="col-3">Name</div>
            <span>:</span>
            <div class="col-5 ps-2">Lasith Eranda Handapangoda</div>
          </div>
          <div class="d-flex">
            <div class="col-3">NIC</div>
            <span>:</span>
            <div class="col-5 ps-2">990811130V</div>
          </div>

          <div class="d-flex">
            <div class="col-3">Age</div>
            <span>:</span>
            <div class="col-5 ps-2">23 yrs</div>
          </div>

          <div class="d-flex">
            <div class="col-3">Address</div>
            <span>:</span>
            <div class="col-7 ps-2">200D, Thibbotugoda, Pokunuwita</div>
          </div>

          <div class="d-flex justify-content-end">
            <div class="text-light bg-danger me-2 d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;"><i class="fa-solid fa-user-minus"></i></div>
            <div class="text-light bg-success d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;"><i class="fa-sharp fa-solid fa-user-pen"></i></div>
          </div>

        </div>
      </div>

      <div class="col-3 p-2 ">
        <div class="border position-relative p-3 bg-light shadow">
          <div class="bg-primary position-absolute rounded-circle d-flex justify-content-center align-items-center " style="top: 10px;right: 10px; width: 35px;height: 35px;">M</div>

          <div class="d-flex">
            <div class="col-3">Name</div>
            <span>:</span>
            <div class="col-5 ps-2">Lasith Eranda Handapangoda</div>
          </div>
          <div class="d-flex">
            <div class="col-3">NIC</div>
            <span>:</span>
            <div class="col-5 ps-2">990811130V</div>
          </div>

          <div class="d-flex">
            <div class="col-3">Age</div>
            <span>:</span>
            <div class="col-5 ps-2">23 yrs</div>
          </div>

          <div class="d-flex">
            <div class="col-3">Address</div>
            <span>:</span>
            <div class="col-7 ps-2">200D, Thibbotugoda, Pokunuwita</div>
          </div>

          <div class="d-flex justify-content-end">
            <div class="text-light bg-danger me-2 d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;"><i class="fa-solid fa-user-minus"></i></div>
            <div class="text-light bg-success d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;"><i class="fa-sharp fa-solid fa-user-pen"></i></div>
          </div>

        </div>
      </div>

      <div class="col-3 p-2 ">
        <div class="border position-relative p-3 bg-light shadow">
          <div class="bg-primary position-absolute rounded-circle d-flex justify-content-center align-items-center " style="top: 10px;right: 10px; width: 35px;height: 35px;">M</div>

          <div class="d-flex">
            <div class="col-3">Name</div>
            <span>:</span>
            <div class="col-5 ps-2">Lasith Eranda Handapangoda</div>
          </div>
          <div class="d-flex">
            <div class="col-3">NIC</div>
            <span>:</span>
            <div class="col-5 ps-2">990811130V</div>
          </div>

          <div class="d-flex">
            <div class="col-3">Age</div>
            <span>:</span>
            <div class="col-5 ps-2">23 yrs</div>
          </div>

          <div class="d-flex">
            <div class="col-3">Address</div>
            <span>:</span>
            <div class="col-7 ps-2">200D, Thibbotugoda, Pokunuwita</div>
          </div>

          <div class="d-flex justify-content-end">
            <div class="text-light bg-danger me-2 d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;"><i class="fa-solid fa-user-minus"></i></div>
            <div class="text-light bg-success d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;"><i class="fa-sharp fa-solid fa-user-pen"></i></div>
          </div>

        </div>
      </div>

      <div class="col-3 p-2 ">
        <div class="border position-relative p-3 bg-light shadow">
          <div class="bg-primary position-absolute rounded-circle d-flex justify-content-center align-items-center " style="top: 10px;right: 10px; width: 35px;height: 35px;">M</div>

          <div class="d-flex">
            <div class="col-3">Name</div>
            <span>:</span>
            <div class="col-5 ps-2">Lasith Eranda Handapangoda</div>
          </div>
          <div class="d-flex">
            <div class="col-3">NIC</div>
            <span>:</span>
            <div class="col-5 ps-2">990811130V</div>
          </div>

          <div class="d-flex">
            <div class="col-3">Age</div>
            <span>:</span>
            <div class="col-5 ps-2">23 yrs</div>
          </div>

          <div class="d-flex">
            <div class="col-3">Address</div>
            <span>:</span>
            <div class="col-7 ps-2">200D, Thibbotugoda, Pokunuwita</div>
          </div>

          <div class="d-flex justify-content-end">
            <div class="text-light bg-danger me-2 d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;"><i class="fa-solid fa-user-minus"></i></div>
            <div class="text-light bg-success d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;"><i class="fa-sharp fa-solid fa-user-pen"></i></div>
          </div>

        </div>
      </div>


      <div class="col-3 p-2 ">
        <div class="border position-relative p-3 bg-light shadow">
          <div class="bg-primary position-absolute rounded-circle d-flex justify-content-center align-items-center " style="top: 10px;right: 10px; width: 35px;height: 35px;">M</div>

          <div class="d-flex">
            <div class="col-3">Name</div>
            <span>:</span>
            <div class="col-5 ps-2">Lasith Eranda Handapangoda</div>
          </div>
          <div class="d-flex">
            <div class="col-3">NIC</div>
            <span>:</span>
            <div class="col-5 ps-2">990811130V</div>
          </div>

          <div class="d-flex">
            <div class="col-3">Age</div>
            <span>:</span>
            <div class="col-5 ps-2">23 yrs</div>
          </div>

          <div class="d-flex">
            <div class="col-3">Address</div>
            <span>:</span>
            <div class="col-7 ps-2">200D, Thibbotugoda, Pokunuwita</div>
          </div>

          <div class="d-flex justify-content-end">
            <div class="text-light bg-danger me-2 d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;"><i class="fa-solid fa-user-minus"></i></div>
            <div class="text-light bg-success d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;"><i class="fa-sharp fa-solid fa-user-pen"></i></div>
          </div>

        </div>
      </div>

      <div class="col-3 p-2 ">
        <div class="border position-relative p-3 bg-light shadow">
          <div class="bg-primary position-absolute rounded-circle d-flex justify-content-center align-items-center " style="top: 10px;right: 10px; width: 35px;height: 35px;">M</div>

          <div class="d-flex">
            <div class="col-3">Name</div>
            <span>:</span>
            <div class="col-5 ps-2">Lasith Eranda Handapangoda</div>
          </div>
          <div class="d-flex">
            <div class="col-3">NIC</div>
            <span>:</span>
            <div class="col-5 ps-2">990811130V</div>
          </div>

          <div class="d-flex">
            <div class="col-3">Age</div>
            <span>:</span>
            <div class="col-5 ps-2">23 yrs</div>
          </div>

          <div class="d-flex">
            <div class="col-3">Address</div>
            <span>:</span>
            <div class="col-7 ps-2">200D, Thibbotugoda, Pokunuwita</div>
          </div>

          <div class="d-flex justify-content-end">
            <div class="text-light bg-danger me-2 d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;"><i class="fa-solid fa-user-minus"></i></div>
            <div class="text-light bg-success d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;"><i class="fa-sharp fa-solid fa-user-pen"></i></div>
          </div>

        </div>
      </div>

    </div>

    
    
    
    
    </div>

  </div>

  <div class="bg-secondary position-fixed rounded-circle d-flex justify-content-center align-items-center btn border-0" style="bottom: 40px;right: 40px; width: 50px;height: 50px;"><i class="fa-solid fa-user-plus text-light ps-1"></i></div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>