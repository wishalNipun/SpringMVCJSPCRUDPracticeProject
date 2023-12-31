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

    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
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
                    <input type="text" class="form-control"   name="id" id="txtId" maxlength="4">
                    <div  style="font-size: 0.7rem; color: #be0b0b;">! Press Enter Button to Search</div>
                </div>
                <div class="mb-3 ">
                    <label  class="form-label">User Name</label>
                    <input type="text" class="form-control" id="txtName" name="name"  maxlength="20">

                </div>
                <div class="mb-3 ">
                    <label class="form-label">User Address</label>
                    <input type="text"   class="form-control" id="txtAddress" name="address"  maxlength="20">

                </div>

                <div class="mb-3 ">
                    <label  class="form-label">User Password</label>
                    <input type="password" class="form-control" id="txtPassword" name="password"  maxlength="15">

                </div>
                <div class=" mb-3 " >
                    <button id="btnSave" type="button"  class="btn btn-success">Save</button>
                    <button id="btnUpdate" type="button" class="btn btn-warning" >Update</button>
                </div>

            </form>
            <div class="col-8 m-4  ">
                <table id="myTable" class="table table-hover table-bordered" style="margin: 0;">
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
                    <tbody id="tblUser">

<%--                    <tr>--%>
<%--                        <td>xxxx</td>--%>
<%--                        <td>xxxx</td>--%>
<%--                        <td>xxxx</td>--%>

<%--                        <td>xxxx</td>--%>
<%--                        <td>xxxx</td>--%>
<%--                        <td style="display: flex;"><button class="btn btnUpdate"><i style="color: #deb624;" class="fa-solid fa-pencil fa-lg"></i></button>--%>
<%--                            <button class="btn btnDelete" ><i style="color: #e71919;" class="fa-solid fa-trash-can fa-lg" ></i></button></td>--%>
<%--                    </tr>--%>

                    </tbody>
                </table>


            </div>



        </div>
        <a  href="logout" style="right: 0;position: absolute;top: 0; margin: auto; margin: 10px;"  class="btn" type="button"><span class="material-symbols-outlined" style="color: rgb(255, 255, 255);">logout</span></a>

    </section>
</main>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf0feecd9b.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>

<script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.5/js/dataTables.bootstrap5.min.js"></script>
<script>



    $("#btnSave").click(function (){

        if (idPatternValid && namePatternValid && addressPatternValid && passwordPatternValid){
            let userData = $("#userForm").serialize();

            $.ajax({
                url: "user",
                method: "post",
                data: userData,
                dataType:"json",
                success: function (res) {
                    Swal.fire({
                        position: 'top',
                        icon: 'success',
                        title: res.message,
                        showConfirmButton: false,
                        timer: 1500
                    })
                    loadAllUsers();

                    textFieldClear();

                    existUser();

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
                title: 'Check Fields and Try Again',
                showConfirmButton: false,
                timer: 1500
            })
        }


    });
    loadAllUsers();

    // function loadAllUsers() {
    //     $("#tblUser").empty();
    //     $.ajax({
    //         url: "user/data",
    //         dataType: "json",
    //         success: function (resp) {
    //
    //             for (let user of resp) {
    //
    //
    //
    //                 var row = "<tr><td>" + user.id + "</td><td>" +user.name+ '</td><td>' +user.address+ '</td><td>' + user.createDate + '</td><td>' + user.updateDate + '</td><td style="display: flex;"><button class="btn btnUpdateRow" type="button"><i style="color: #deb624; height: 22px" class="fa-solid fa-pencil fa-lg" ></i></button> <button class="btn btnDeleteRow" type="button"><i style="color: #e71919; height: 22px" class="fa-solid fa-trash-can fa-xl" ></i></button></td></tr>';
    //                 $("#tblUser").append(row);
    //             }
    //             tableRowClickEventFunction();
    //
    //         }
    //     });
    //
    //     existUser();
    //
    // }

    //
    var table;
    function loadAllUsers() {
        if (table) {
            // If the table is already initialized, destroy the DataTable instance
            table.destroy();
        }

        table = $('#myTable').DataTable({
            lengthMenu: [ 8, 16, 24, 32,40,48, 100 ],
            ajax: {
                url: 'user/data',
                dataType: 'json',
                dataSrc: ''
            },
            columns: [
                { data: 'id' },
                { data: 'name' },
                { data: 'address' },
                { data: 'createDate' },
                { data: 'updateDate' },
                {
                    data: null,
                    render: function() {

                        return '<button class="btn btnUpdateRow" type="button"><i style="color: #deb624; height: 22px" class="fa-solid fa-pencil fa-lg"></i></button>' +
                            '<button class="btn btnDeleteRow" type="button"><i style="color: #e71919; height: 22px" class="fa-solid fa-trash-can fa-lg"></i></button>';
                    }

                }
            ],
            drawCallback: function () {
                tableRowClickEventFunction();
            }

        });


        existUser();

    }


    function tableRowClickEventFunction() {

            $(".btnUpdateRow").click(function () {


            let id = $(this).closest('tr').children(":eq(0)").text();
            let  name = $(this).closest('tr').children(":eq(1)").text();
            let address = $(this).closest('tr').children(":eq(2)").text();


            $("#txtId").val(id);
            $("#txtName").val(name);
            $("#txtAddress").val(address);

            validateInputField("userId", id);
            validateInputField("userName", name);
            validateInputField("userAddress", address);

            existUser();

        });

        $(".btnDeleteRow").click(function () {

            let id = $(this).closest('tr').children(":eq(0)").text();


            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {

                    $.ajax({
                        url: "user?id=" +id,
                        method: "delete",
                        dataType:"json",
                        success: function (resp) {
                            loadAllUsers();

                            Swal.fire({
                                position: 'top',
                                icon: 'success',
                                title: resp.message,
                                showConfirmButton: false,
                                timer: 1500
                            })

                        },
                        error:function (error){

                        }
                    });

                }
            })

        });

        $("#txtId").on('keyup',function (event){
            validateInputField("userId", $("#txtId").val());
            existUser();
            if(event.code == "Enter"){

                console.log("Enter");
                let userId = $('#txtId').val();
                     if (userId !=""){
                         $.ajax({
                             url: "user/uSet?id="+userId,
                             method: "get",
                             dataType:"json",
                             success: function (res) {
                                 $("#txtId").val(res.data.id);
                                 $("#txtName").val(res.data.name);
                                 $("#txtAddress").val(res.data.address);
                             },
                             error:function(error){

                                 Swal.fire({
                                     position: 'top',
                                     icon: 'error',
                                     title: "User Id Not Exist ",
                                     showConfirmButton: false,
                                     timer: 1500
                                 })
                                 textFieldClear();

                             }
                         });
                     }else {
                         Swal.fire({
                             position: 'top',
                             icon: 'error',
                             title: 'Please Enter Id for Search !',
                             showConfirmButton: false,
                             timer: 1500
                         })
                     }

            }
        });



    }



    function existUser(){
        let id =$("#txtId").val();
        console.log("trigger");

        $.ajax({
            url: "user?id="+id,
            method: "get",
            dataType:"json",
            success: function (res) {
                if (res.data){
                    $('#btnSave').css('display','none');
                    $('#btnUpdate').css('display','block')

                }else {
                    $('#btnSave').css('display','block');
                    $('#btnUpdate').css('display','none');
                }


            },
            error:function(error){
                // var jsObject=JSON.parse(error.responseText);
                // alert(jsObject.message);
            }
        });
    }

    $("#btnUpdate").click(function () {

        if (idPatternValid && namePatternValid && addressPatternValid && passwordPatternValid){
            let id = $("#txtId").val();
            let address = $("#txtAddress").val();
            let name = $("#txtName").val();
            let password = $("#txtPassword").val();

            let user={
                id: id,
                name: name,
                address: address,
                password: password,

            }

            $.ajax({
                url: 'user',
                method: 'put',
                contentType:"application/json",
                data:JSON.stringify(user),
                dataType:"json",
                success: function (res) {
                    Swal.fire({
                        position: 'top',
                        icon: 'success',
                        title: res.message,
                        showConfirmButton: false,
                        timer: 1500
                    })
                   loadAllUsers();
                    textFieldClear();
                },
                error:function (error){
                    // let cause= JSON.parse(error.responseText).message;
                    // alert(cause);
                }

            });
        }else {
            Swal.fire({
                position: 'top',
                icon: 'error',
                title: 'Check Fields and Try Again',
                showConfirmButton: false,
                timer: 1500
            })
        }

    });

    function textFieldClear(){
        $("#txtId").val("");
        $("#txtName").val("");
        $("#txtAddress").val("");
        $("#txtPassword").val("");
        existUser();
        $('#txtId').css('box-shadow','0px 0px 0px #000');
        $('#txtName').css('box-shadow','0px 0px 0px #000');
        $('#txtAddress').css('box-shadow','0px 0px 0px #000');
        $('#txtPassword').css('box-shadow','0px 0px 0px #000');
    }

    let idPatternValid =false;
    let namePatternValid =false;
    let addressPatternValid =false;
    let passwordPatternValid =false;




    $("#txtName").on('keyup',function (event){
        validateInputField("userName", $("#txtName").val());
        }
    );
    $("#txtAddress").on('keyup',function (event){
            validateInputField("userAddress", $("#txtAddress").val());
        }
    );
    $("#txtPassword").on('keyup',function (event){
            validateInputField("userPassword", $("#txtPassword").val());
        }
    );
    function validateInputField(inputType, inputField) {
        let pattern;


        switch (inputType) {
            case 'userId':
                pattern = /^(C)[0-9]{3}$/;
                idPatternValid= pattern.test(inputField);

                if (idPatternValid){
                    $('#txtId').css('box-shadow','0 0 0 0.2rem rgba(40, 167, 69, 0.25)')
                    $('#txtId').css('color','green')
                }else {
                    $('#txtId').css('box-shadow','rgb(255 0 7 / 25%) 0px 0px 0px 0.2rem')
                    $('#txtId').css('color','red')
                }
                break;

            case 'userName':
                pattern = /^[A-z]{3,20}$/;
                namePatternValid= pattern.test(inputField);
                if (namePatternValid){
                    $('#txtName').css('box-shadow','0 0 0 0.2rem rgba(40, 167, 69, 0.25)')
                    $('#txtName').css('color','green')
                }else {
                    $('#txtName').css('box-shadow','rgb(255 0 7 / 25%) 0px 0px 0px 0.2rem')
                    $('#txtName').css('color','red')
                }
                break;

            case 'userAddress':
                pattern = /^[A-z0-9 /,]{4,20}$/;
                addressPatternValid= pattern.test(inputField);
                if (addressPatternValid){
                    $('#txtAddress').css('box-shadow','0 0 0 0.2rem rgba(40, 167, 69, 0.25)')
                    $('#txtAddress').css('color','green')
                }else {
                    $('#txtAddress').css('box-shadow','rgb(255 0 7 / 25%) 0px 0px 0px 0.2rem')
                    $('#txtAddress').css('color','red')
                }
                break;

            case 'userPassword':
                pattern = /^[A-z0-9#@$^&*!/,]{8,15}$/;
                passwordPatternValid= pattern.test(inputField);
                if (passwordPatternValid){
                    $('#txtPassword').css('box-shadow','0 0 0 0.2rem rgba(40, 167, 69, 0.25)')
                    $('#txtPassword').css('color','green')
                }else {
                    $('#txtPassword').css('box-shadow','rgb(255 0 7 / 25%) 0px 0px 0px 0.2rem')
                    $('#txtPassword').css('color','red')
                }
                break;

            default:

        }


    }

////////////////////////////////////////////////////////////////////////////////////







</script>
</body>
</html>
