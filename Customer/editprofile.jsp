<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="home" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<c:url var="home" value="/" scope="request" />

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Aspire Bank</title>

  <!-- Bootstrap Core CSS -->
  <link href="/C55-Backend/assets/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="/C55-Backend/assets/css/simple-sidebar.css" rel="stylesheet">
    <!-- jQuery -->
        <script src="/C55-Backend/assets/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="/C55-Backend/assets/js/bootstrap.min.js"></script>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <script type="text/javascript">






          function changename()
          {



            var postdata = 
            {
                    //"cust_id": 9999888877776666
                    "f_name":document.getElementById("firstname").value,
                    "l_name":document.getElementById("lastname").value
                  }
                  var dataString = JSON.stringify(postdata);

                  alert(dataString);
                  $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "${home}profile/update",
                    data: {myData:dataString},
                    contentType: "application/json; charset=utf-8",
                    success: function(data,status){
                    if(status=="success")
                         document.getElementById("c_name").innerHTML="Name change Success";
                       },
                       error: function(e){
                        console.log(e.message);
                      }
                    });

                }

                function changeemail()
                {


                  var postdata = 
                  {

                  //"cust_id": 9999888877776666
                  "email":document.getElementById("new_email").value,
                  "item": "email"
                }
                var dataString = JSON.stringify(postdata);

                alert(dataString);

                $.ajax({
                  type: "POST",
                  dataType: "json",
                  url: "${home}profile/update",
                  data: {myData:dataString},
                  contentType: "application/json; charset=utf-8",
                   success: function(data,status){
                    if(status=="success"){
                          // from for this particular tab has to be converted to jsp according to Mayank because here Otp logic has to be there
                          //this page has to be redirected to oTp page
                         //document.getElementById("c_email").innerHTML="Email change Successs";
                       }
                       },
                       error: function(e){
                        console.log(e.message);
                      }
                    });

              }


              function changephone()
              {



                var postdata = 
                {
                 // "cust_id": 9999888877776666
                 "phone":document.getElementById("new_phone").value,
                 "mobile_carrier":document.getElementById("carrier").value,
                 "item": "phone"
               }
               var dataString = JSON.stringify(postdata);

               alert(dataString);

               $.ajax({
                type: "POST",
                dataType: "json",
                url: "${home}profile/update",
                data: {myData:dataString},
                contentType: "application/json; charset=utf-8",
                 success: function(data,status){
                    if(status=="success"){
                         // from for this particular tab has to be converted to jsp according to Mayank because here Otp logic has to be there
                          //this page has to be redirected to oTp page
                         //document.getElementById("c_phone").innerHTML="Phone Number change Success"
                       }
                     },
                       error: function(e){
                        console.log(e.message);
                      }
                    });

             }


             function changepassword()
             {



              var postdata = 
              {
                  //"cust_id": 9999888877776666
                  
                  "password":document.getElementById("new_password").value

                }
                var dataString = JSON.stringify(postdata);

                alert(dataString);

                $.ajax({
                  type: "POST",
                  dataType: "json",
                  url: "${home}profile/update",
                  data: {myData:dataString},
                  contentType: "application/json; charset=utf-8",
                   success: function(data,status){
                    if(status=="success")
                         document.getElementById("c_password").innerHTML="Password change Success";
                       },
                       error: function(e){
                        console.log(e.message);
                      }
                    });

              }




              function changeusername()
              {



                var postdata = 
                {
                  //"cust_id": 9999888877776666
                  "username":document.getElementById("new_username").value

                }
                var dataString = JSON.stringify(postdata);

                alert(dataString);

                $.ajax({
                  type: "POST",
                  dataType: "json",
                  url: "${home}profile/update",
                  data: {myData:dataString},
                  contentType: "application/json; charset=utf-8",
                   success: function(data,status){     
                    if(status=="success")
                         document.getElementById("c_username").innerHTML="Username change Success";
                       },
                       error: function(e){
                        console.log(e.message);
                      }
                    });
              }




function checkPasswordMatch() {
    var password = $("#new_password").val();
    var confirmPassword = $("#confirmpassword").val();

    if (password != confirmPassword)
        $("#divCheckPasswordMatch").html("Passwords do not match!");
    else
        $("#divCheckPasswordMatch").html("Passwords match.");
}




            </script>


          </head>

          <body>

            <div id="wrapper">

              <!-- Sidebar -->
              <div id="sidebar-wrapper">
               <ul class="sidebar-nav">
        <li class="sidebar-brand">

        </li>
        <li>
          <a href="${home}accounts">Account Information</a>
        </li>
        <li>
          <a href="${home}transfercash">Transfer Cash</a>
        </li>
        <li>
          <a href="${home}balanceinfo">Balance Statement</a>
        </li>
        <li>
          <a href="${home}request">Requests</a>
        </li>
        <li>
          <a href="${home}viewprofile">View Profile</a>
        </li>
        <li>
          <a href="${home}editprofile">Edit Profile</a>
        </li>
        <li>
          <a href="${home}creditcard">Credit Card</a>
        </li>
        <li>
          <a href="#">Logout</a>
        </li>

      </ul>
              </div>
              <!-- /#sidebar-wrapper -->
<!--
saurabh start
-->

<!-- Page Content -->
<div class="container-fluid">
  <ul class="nav nav-tabs nav-justified" role="tablist">

    <li><a data-toggle="tab" href="#changeName">Change Name</a></li>
    <li><a data-toggle="tab" href="#changeEmail">Change Email id</a></li>
    <li><a data-toggle="tab" href="#changePhone">Change Phone Number</a></li>
    <li><a data-toggle="tab" href="#changePassword">Change Password</a></li>
    <li><a data-toggle="tab" href="#changeUserName">Change UserName</a></li>
  </ul>
  <div class="tab-content">

    <!-- ###################################### email tab-->
    <div id="changeEmail" class="tab-pane fade ">
      <div class="container">
        <h1>Edit Email ID</h1>
        <hr>
        <div class="row">
          <!-- left column -->


          <!-- edit form column -->
          <div class="col-md-12 personal-info">
            <div class="alert alert-info alert-dismissable">
              <a class="panel-close close" data-dismiss="alert">×</a> 
              <i class="fa fa-coffee"></i>
              <strong>Change Email Status:</strong><div id="c_email"></div>
            </div>

            <form class="form-horizontal" role="form" method="POST" onsubmit="changeemail()">



              <div class="form-group">
                <label class="col-lg-3 control-label">New Email:</label>
                <div class="col-lg-8">
                  <input class="form-control"  id="new_email" required >
                </div>
              </div>


              <div class="form-group">
                <label class="col-md-3 control-label"></label>
                <div class="col-md-8">

                  <input class="btn btn-primary" value="Save Changes" type="submit">
                  <span></span>
                  <input class="btn btn-default" value="Cancel" type="reset">

                </div>
              </div>

            </form>

          </div>
        </div>
      </div>
    </div>
    <!-- ######################################-->


    
    <!-- ###################################### Phone no tab-->
    <div id="changePhone" class="tab-pane fade ">
      <div class="container">
        <h1>Edit Phone Number</h1>
        <hr>
        <div class="row">
          <!-- left column -->


          <!-- edit form column -->
          <div class="col-md-12 personal-info">
            <div class="alert alert-info alert-dismissable">
              <a class="panel-close close" data-dismiss="alert">×</a> 
              <i class="fa fa-coffee"></i><div id="c_phone"></div>
              <strong>Change Phone Status:</strong><div id="c_phone"></div>
            </div>

            <form class="form-horizontal" role="form"  method="POST" onsubmit="changephone()">


              <div class="form-group">
                <label class="col-md-3 control-label">New Phone number:</label>
                <div class="col-md-8">
                  <input class="form-control" id="new_phone" type="text">
                </div>
              </div>

              <div class="form-group">
                <label class="col-md-3 control-label">Mobile Carrier:</label>
                <div class="col-md-8">
                  <div class="radio">
                    <label><input type="radio" name="carrier">ATT</label>
                  </div>
                  <div class="radio">
                    <label><input type="radio" name="carrier">T-Mobile</label>
                  </div>
                </div>

              </div>



              <div class="form-group">
                <label class="col-md-3 control-label"></label>
                <div class="col-md-8">

                  <input class="btn btn-primary" value="Save Changes" type="submit">
                  <span></span>
                  <input class="btn btn-default" value="Cancel" type="reset">

                </div>
              </div>

            </form>

          </div>
        </div>
      </div>
    </div>
    <!-- ######################################-->

    <!-- ###################################### Password tab-->
    <div id="changePassword" class="tab-pane fade ">
      <div class="container">
        <h1>Edit Password</h1>
        <hr>
        <div class="row">
          <!-- left column -->


          <!-- edit form column -->
          <div class="col-md-12 personal-info">
            <div class="alert alert-info alert-dismissable">
              <a class="panel-close close" data-dismiss="alert">×</a> 
              <i class="fa fa-coffee"></i>
              <strong> Change Password Status:</strong><div id="c_password"></div>
            </div>

            <form class="form-horizontal" role="form"  method="POST" onsubmit="changepassword()">

              

              <div class="form-group">
                <label class="col-md-3 control-label">New Password:</label>
                <div class="col-md-8">
                  <input class="form-control" name="password" id="new_password" type="password">
                </div>
              </div>

              <div class="form-group">
                <label class="col-md-3 control-label">Confirm password:</label>
                <div class="col-md-8">
                  <input class="form-control" name="confrim_password" id="confirmpassword" onkeyup="checkPasswordMatch()"  type="password">
                </div>
              </div>
              <div id="divCheckPasswordMatch"></div>

     


              <div class="form-group">
                <label class="col-md-3 control-label"></label>
                <div class="col-md-8">

                  <input class="btn btn-primary" value="Save Changes" type="submit">
                  <span></span>
                  <input class="btn btn-default" value="Cancel" type="reset">

                </div>
              </div>

            </form>

          </div>
        </div>
      </div>
    </div>
    <!-- ######################################-->    
    
    <!-- ###################################### Username tab-->
    <div id="changeUserName" class="tab-pane fade ">
      <div class="container">
        <h1>Edit UserName</h1>
        <hr>
        <div class="row">
          <!-- left column -->


          <!-- edit form column -->
          <div class="col-md-12 personal-info">
            <div class="alert alert-info alert-dismissable">
              <a class="panel-close close" data-dismiss="alert">×</a> 
              <i class="fa fa-coffee"></i>
              <strong>Change Username Status:</strong><div id="c_username"></div>
            </div>

            <form class="form-horizontal" role="form" method="POST" onsubmit="changeusername()">


              <div class="form-group">
                <label class="col-md-3 control-label">New Username:</label>
                <div class="col-md-8">
                  <input class="form-control" id="new_username"  type="text" pattern="[A-Za-z]{3}">
                </div>
              </div>

              <div class="form-group">
                <label class="col-md-3 control-label"></label>
                <div class="col-md-8">

                  <input class="btn btn-primary" value="Save Changes" type="submit">
                  <span></span>
                  <input class="btn btn-default" value="Cancel" type="reset">

                </div>
              </div>

            </form>

          </div>
        </div>
      </div>
    </div>
    <!-- ######################################-->  


    <!-- ###################################### Nameab-->
    <div id="changeName" class="tab-pane fade in active">
      <div class="container">
        <h1>Edit Name</h1>
        <hr>
        <div class="row">
          <!-- left column -->


          <!-- edit form column -->
          <div class="col-md-12 personal-info">
            <div class="alert alert-info alert-dismissable">
              <a class="panel-close close" data-dismiss="alert">×</a> 
              <i class="fa fa-coffee"></i>
              <strong>Change Name Status:</strong><div id="c_name"></div>
            </div>

            <form class="form-horizontal" role="form" method="POST" onsubmit="changename()">

              <div class="form-group">
                <label class="col-lg-3 control-label">First name:</label>
                <div class="col-lg-8">
                  <input class="form-control" id="firstname" type="text">
                </div>
              </div>

              <div class="form-group">
                <label class="col-lg-3 control-label">Last name:</label>
                <div class="col-lg-8">
                  <input class="form-control" id="lastname"  type="text">
                </div>
              </div>

              <div class="form-group">
                <label class="col-md-3 control-label"></label>
                <div class="col-md-8">

                  <input class="btn btn-primary" value="Save Changes" type="submit">
                  <span></span>
                  <input class="btn btn-default" value="Cancel" type="reset">

                </div>
              </div>

            </form>

          </div>
        </div>
      </div>
    </div>
    <!-- ######################################-->    


  </div><!--end of tabbed content-->
</div>


            <!--
saurabh end
-->


</div>
<!-- /#wrapper -->

<!-- jQuery -->


<!-- Menu Toggle Script -->
<script>
  $("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
  });
</script>

</body>

</html>
