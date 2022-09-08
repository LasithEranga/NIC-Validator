<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
   @media screen and (max-width: 480px) {
      .toast-container {
        left:5%;
      }
    }
    @media screen and (min-width: 480px) {
      .toast-container {
        left:0%;
      }
    }
  </style>
</head>
<body>
  
  <header>
    <div class="d-flex bg-light py-3 shadow"> 

        <div class="col-6 ps-3 fs-3 fw-bold">
          User Management System
        </div>


    </div>
  </header>

  <div class="container-fluid p-4">
    <div class="justify-content-start align-items-top p-2 gap-0 " style="background-color:#EBEBEB;height: 80vh;overflow-y: scroll;">
    
      <div class="fs-2 fw-bold">Users</div>

      <div class="text-center" id="no-info">
        <span class="text-nowrap">Sorry! No users available to show ... <span> <a href="/add-new" class="d-block d-md-inline ms-md-3 text-start"> Add user</a>
      </div>

      <div id="content" class="d-flex flex-wrap">
       
      </div>
    </div>
  </div>
<a href="/add-new" class="bg-secondary position-fixed rounded-circle d-flex justify-content-center align-items-center btn border-0" style="bottom: 40px;right: 40px; width: 50px;height: 50px;"><i class="fa-solid fa-user-plus text-light ps-1"></i></div></a>


<%-- Toast message --%>
<div class="toast-container position-fixed bottom-0 p-3" style="width:20rem;">
  <div id="toast" class="toast" role="alert">
    <div class="toast-header">
      <i class="fa-sharp fa-solid fa-circle-info text-primary me-2"></i>
      <strong class="me-auto">NIC Validator</strong>
      <small>Just now</small>
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body bg-light mt-0">
      ${message}
    </div>
  </div>
</div>

<%-- Modal dialog --%>
<div class="modal fade" id="deleteModal" tabindex="-1" >
  <div class="modal-dialog modal-dialog-centered" >
    <div class="modal-content" style="width:80%">
      <div class="modal-header">
        <h5 class="modal-title">Are you sure?</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
      This action will remove the user from system.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="btnOkay">Okay</button>
      </div>
    </div>
  </div>
</div>



  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    
    <script>
    
      const haveData = 1;
      const users = ${users.toString()}
      console.log(users);
      const noInfo = document.getElementById("no-info");
      const content = document.getElementById("content");
      const toastMessage = document.getElementById('toast');
      const haveMessage = "${message}";
      
      //display no info dialog if no users are available in database.
      if(users.length === 0){
        content.style.display = "none";
        noInfo.style.display = "unset";

      }
      else{
        noInfo.style.display = "none";
        content.style.display = "unset";
        let contentHtml = "";
        users.forEach(user => {
          let dob = new Date(user.dob).getFullYear();
          let currentYear = new Date().getFullYear();
          let age = currentYear - dob;
          let iconColor = "";
          let iconLetter = "";
          if(user.gender == "Male"){
            iconColor = "bg-primary"
            iconLetter = "M";
          }else{
            iconColor = "bg-danger "
            iconLetter = "F";
          }
          contentHtml +=  `
          <div class="col-3 p-2">
          <div class="border position-relative p-3 bg-light shadow">
            <div class="`+iconColor+` text-light position-absolute rounded-circle d-flex justify-content-center align-items-center " style="top: 10px;right: 10px; width: 35px;height: 35px;">`+iconLetter+`</div>

            <div class="d-flex">
              <div class="col-3">Name</div>
              <span>:</span>
              <div class="col-5 ps-2">`+user.fullName+`</div>
            </div>
            <div class="d-flex">
              <div class="col-3">Birthday</div>
              <span>:</span>
              <div class="col-5 ps-2">`+user.dob+`</div>
            </div>

            <div class="d-flex">
              <div class="col-3">NIC</div>
              <span>:</span>
              <div class="col-5 ps-2">`+user.nic+`</div>
            </div>

            <div class="d-flex">
              <div class="col-3">Age</div>
              <span>:</span>
              <div class="col-5 ps-2">`+age+` yrs</div>
            </div>

            <div class="d-flex">
              <div class="col-3">Address</div>
              <span>:</span>
              <div class="col-7 ps-2">`+user.address+`</div>
            </div>

            <div class="d-flex justify-content-end">
              <div><form action="/delete-user" method="POST"><input hidden value="`+user.nic+`" name="nic"/><button type="button" class="text-light bg-danger me-2 d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;" onClick="openDeleteWarning(this.form)"><i class="fa-solid fa-user-minus"></i></button></form></div>
              <div><form action="/edit-user" method="GET"><input hidden value="`+user.nic+`" name="nic" /><button class="text-light bg-success d-flex justify-content-center align-items-center btn rounded-0" style="width:35px;height: 35px;"><i class="fa-sharp fa-solid fa-user-pen"></i></button></form></div>
            </div>

          </div>
        </div>`
        });

        content.innerHTML = contentHtml;
      }


      //show if there are any messages to show
      if(haveMessage){
        new bootstrap.Toast(toastMessage).show();
      }

      const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
      const btnOkay = document.getElementById('btnOkay');
      let formtosubmit;
      const openDeleteWarning = (form) => {
        formtosubmit = form;
        deleteModal.show();
        btnOkay.setAttribute('onClick',`modalOkayButtonClickHandler()`)
      }

      const modalOkayButtonClickHandler = () => {
        deleteModal.hide()
        console.log(formtosubmit)

        formtosubmit.submit()
        console.log("Done")
      }


      
    </script>
</body>
</html>