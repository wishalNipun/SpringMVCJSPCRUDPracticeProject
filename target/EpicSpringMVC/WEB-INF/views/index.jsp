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
            <form style="width: 400px; display: flex;
        gap: 35px;
        flex-direction: column;">
                <input  type="text" class="form-control" name="uid" [(ngModel)]="uid" placeholder="User Name" maxlength="15" (input)="validateInput('uName', $event)">
                <input  type="password" class="form-control" name="upassword" [(ngModel)]="upassword"placeholder="Password" maxlength="15" (input)="validateInput('upassword', $event)">
                <a href="signIn" style="color: white;" ><button style="width: 100%; " type="button" class="btn btn-primary " >Sign In</button></a>
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
                                <input type="text" class="form-control"  name="id" [(ngModel)]="id" (keyup)="onKeyUp($event)" maxlength="4" (input)="validateInput('userId', $event)" [style.color]="isValidUserId ? 'green' : 'red'" [style.box-shadow]="isValidUserId ? '0 0 0 0.2rem rgba(40, 167, 69, 0.25)' : 'rgb(255 0 7 / 25%) 0px 0px 0px 0.2rem'">
                                <div [style.display]="userValidLabel ? 'block' : 'none'" style="font-size: 0.7rem; color: #be0b0b;">ID Alreary Exist</div>

                            </div>
                            <div class="mb-3 ">
                                <label  class="form-label">User Name</label>
                                <input type="text" class="form-control"  name="name" [(ngModel)]="name" maxlength="20" (input)="validateInput('userName', $event)" [style.color]="isValidUserName ? 'green' : 'red'" [style.box-shadow]="isValidUserName ? '0 0 0 0.2rem rgba(40, 167, 69, 0.25)' : 'rgb(255 0 7 / 25%) 0px 0px 0px 0.2rem'">

                            </div>
                            <div class="mb-3 ">
                                <label class="form-label">User Address</label>
                                <input type="text" class="form-control" name="address" [(ngModel)]="address" maxlength="20" (input)="validateInput('userAddress', $event)" [style.color]="isValidUserAddress ? 'green' : 'red'" [style.box-shadow]="isValidUserAddress ? '0 0 0 0.2rem rgba(40, 167, 69, 0.25)' : 'rgb(255 0 7 / 25%) 0px 0px 0px 0.2rem'">

                            </div>

                            <div class="mb-3 ">
                                <label  class="form-label">User Password</label>
                                <input type="password"  class="form-control" name="Password" [(ngModel)]="password" maxlength="15" (input)="validateInput('userPassword', $event)" [style.color]="isValidUserPassword ? 'green' : 'red'" [style.box-shadow]="isValidUserPassword ? '0 0 0 0.2rem rgba(40, 167, 69, 0.25)' : 'rgb(255 0 7 / 25%) 0px 0px 0px 0.2rem'">

                            </div>

                        </form>



                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                       <a href="signUp"> <button id="btnSave" type="button"   class="btn btn-primary" (click)="onSubmit()" [disabled]="disableSaveButton" data-bs-dismiss="modal">Sign Up</button>
                       </a>
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

</script>
</body>
</html>
