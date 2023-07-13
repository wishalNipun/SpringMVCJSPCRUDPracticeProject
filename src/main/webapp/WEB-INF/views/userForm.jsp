<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 7/12/2023
  Time: 1:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

</head>
<body>
<main id="userFormMain">
    <header>
        <nav class="navbar navbar-dark text-bg-success justify-content-center">
            <h1 >User Form</h1>
        </nav>
    </header>
    <section>
        <div class="row " style=" margin-right: 0px; margin-left: 0px;">

            <form id="userForm" class="col-3 m-4  ">
                <div class="mb-3 ">

                    <label class="form-label">User Id</label>
                    <input type="text" class="form-control"   name="id"  maxlength="4">
                    <div style="font-size: 0.7rem; color: #be0b0b;">! Press Enter Button to Search</div>
                </div>
                <div class="mb-3 ">
                    <label  class="form-label">User Name</label>
                    <input type="text" class="form-control" id="name" name="name"  maxlength="20">

                </div>
                <div class="mb-3 ">
                    <label class="form-label">User Address</label>
                    <input type="text"   class="form-control" id="address" name="address"  maxlength="20">

                </div>

                <div class="mb-3 ">
                    <label  class="form-label">User Password</label>
                    <input type="password" class="form-control" id="password" name="password"  maxlength="15">

                </div>
                <div class="btn-group mb-3 " role="group" aria-label="Basic mixed styles example">
                    <button id="btnSave" type="button"  class="btn btn-success">Save</button>
                    <!-- <button id="btnUpdate" type="button" class="btn btn-warning" (click)="onUpdate()">Update</button> -->
                </div>

            </form>
            <div class="col-8 m-4  ">
                <table class="table table-hover table-bordered" style="margin: 0;">
                    <thead class=" table-success">

                    <tr>
                        <th>User Id</th>
                        <th>User Name</th>
                        <th>User Address</th>

                        <th>User createDate</th>
                        <th>User updateDate</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>

                    <tr>
                        <td>xxxx</td>
                        <td>xxxx</td>
                        <td>xxxx</td>

                        <td>xxxx</td>
                        <td>xxxx</td>
                        <td style="display: flex;"><button class="btn"><i style="color: #deb624;" class="fa-solid fa-pencil fa-lg"></i></button>
                            <button class="btn" ><i style="color: #e71919;" class="fa-solid fa-trash-can fa-lg" ></i></button></td>
                    </tr>
                    <tr>
                        <td>xxxx</td>
                        <td>xxxx</td>
                        <td>xxxx</td>

                        <td>xxxx</td>
                        <td>xxxx</td>
                        <td style="display: flex;"><button class="btn"><i style="color: #deb624; height: 22px" class="fa-solid fa-pencil fa-lg" ></i></button>
                            <button class="btn" ><i style="color: #e71919; height: 22px" class="fa-solid fa-trash-can fa-xl" ></i></button></td>
                    </tr>
                    </tbody>
                </table>


            </div>
        </div>
        <button  style="right: 0;position: absolute;top: 0; margin: auto; margin: 10px;"  class="btn" type="button"><span class="material-symbols-outlined" style="color: rgb(255, 255, 255);">logout</span></button>

    </section>
</main>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf0feecd9b.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>

<script>

    var baseUrl ="http://localhost:8080/EpicSpringMVC_war/";

            $("#btnSave").click(function (){

            let userData = $("#userForm").serialize();

            $.ajax({
                url: baseUrl+"user",
                method: "post",
                data: userData,
                dataType:"json",
            success: function (res) {
               // alert(res.message);

            },
            error:function(error){
                // var jsObject=JSON.parse(error.responseText);
                // alert(jsObject.message);
            }
        });

    });

</script>
</body>
</html>
