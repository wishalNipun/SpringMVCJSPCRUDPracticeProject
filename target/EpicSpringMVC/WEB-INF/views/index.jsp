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
    <title>Sign In</title>
</head>
<body>
    <div class="container-fluidp0 ">

    <div style=" position: relative;
    display: flex;
    flex-direction: column;
    background-color: #198754;
    align-items: center; width: 100vw;
    height: 100vh;
    justify-content: center;">
        <div style="
      border-radius : 12px;
      padding: 30px;
      background-color: white;">
            <h1 style="color: rgb(0, 0, 0); font-size: 2rem;">Sign In Your Account.</h1>
            <form  style="width: 400px; display: flex;
        gap: 35px;
        flex-direction: column;">
                <input id="uid"  type="text" class="form-control" name="uid" placeholder="User Name" maxlength="15">
                <input id="upassword" type="password" class="form-control" name="upassword" placeholder="Password" maxlength="15">
                <button id="btnSignIn" style="width: 100%; " type="button" class="btn btn-primary " >Sign In</button>
                <!-- Button trigger modal -->
                <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal"  >Create Account</button>
            </form>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Create User Account</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form >
                            <div class="mb-3 ">
                                <label  class="form-label">User Id</label>
                                <input type="text" class="form-control"  name="id" id="sid"  maxlength="4" >
                                <div id="lblExist" style="font-size: 0.7rem; color: #be0b0b;">ID AlReady Exist</div>

                            </div>
                            <div class="mb-3 ">
                                <label  class="form-label">User Name</label>
                                <input type="text" class="form-control"  name="name" id="sname" maxlength="20" >

                            </div>
                            <div class="mb-3 ">
                                <label class="form-label">User Address</label>
                                <input type="text" class="form-control" name="address" id="saddress" maxlength="20" >

                            </div>

                            <div class="mb-3 ">
                                <label  class="form-label">User Password</label>
                                <input type="password"  class="form-control" name="Password" id="spassword" maxlength="15" >                     </div>

                        </form>



                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button id="btnSignUp" type="button"   class="btn btn-primary" (click)="onSubmit()"  data-bs-dismiss="modal">Sign Up</button>

                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf0feecd9b.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>

<script>

    $('#btnSignIn').click(function () {


        if($('#uid').val() !="" && $('#upassword').val() !="" ){
            var data ={
                uid:$('#uid').val(),
                upassword:$('#upassword').val()
            }
            console.log(data);
            $.ajax({
                url: "user/login",
                method: "post",
                contentType:"application/json",
                data:JSON.stringify(data),
                dataType:"json",
                success: function (res) {

                    if (res.data){


                        const Toast = Swal.mixin({
                            toast: true,
                            position: 'top',
                            showConfirmButton: false,
                            timer: 1000,
                            timerProgressBar: true,
                            didOpen: (toast) => {
                                toast.addEventListener('mouseenter', Swal.stopTimer)
                                toast.addEventListener('mouseleave', Swal.resumeTimer)

                                setTimeout(() => {

                                    window.location.href = 'user';

                                }, 1000);

                            }
                        })

                        Toast.fire({
                            icon: 'success',
                            title: 'Signed in successfully'
                        })


                    }else {
                        Swal.fire({
                            position: 'top',
                            icon: 'error',
                            title: 'Invalid User Name Or Password',
                            showConfirmButton: false,
                            timer: 1500
                        })
                    }


                },
                error:function(error){
                    // var jsObject=JSON.parse(error.responseText);
                    // alert(jsObject.message);
                }
            });
        }else {
            Swal.fire({
                position: 'top',
                icon: 'error',
                title: 'Try Again',
                showConfirmButton: false,
                timer: 1500
            })
        }
    });

    $('#btnSignUp').click(function () {

         let data = {
            id:$('#sid').val(),
             name:$('#sname').val(),
             address:$('#saddress').val(),
             password:$('#spassword').val()
         }
        $.ajax({
            url: "user",
            method: "post",
            data:data,
            dataType:"json",
            success: function (res) {
                const Toast = Swal.mixin({
                    toast: true,
                    position: 'top',
                    showConfirmButton: false,
                    timer: 1000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.addEventListener('mouseenter', Swal.stopTimer)
                        toast.addEventListener('mouseleave', Swal.resumeTimer)

                        setTimeout(() => {

                            window.location.href = 'user';

                        }, 1000);

                    }
                })

                Toast.fire({
                    icon: 'success',
                    title: 'Signed in successfully'
                })


            },
            error:function(error){
                // var jsObject=JSON.parse(error.responseText);
                // alert(jsObject.message);
            }
        });
    });

    $('#lblExist').css('display','none');

    $("#sid").on('keyup',function (event){

        existUserLabel();

    });


    function existUserLabel(){
        let id =$("#sid").val();
        console.log("trigger");

        $.ajax({
            url: "user?id="+id,
            method: "get",
            dataType:"json",
            success: function (res) {
                if (res.data){
                    $('#lblExist').css('display','block');


                }else {

                    $('#lblExist').css('display','none');
                }


            },
            error:function(error){
                // var jsObject=JSON.parse(error.responseText);
                // alert(jsObject.message);
            }
        });
    }

</script>
</body>
</html>
