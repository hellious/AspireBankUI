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


          function getdetails()
          {

          //  var postdata = 
          //  {
          //    "cust_id":session()
            //}
            //var dataString = JSON.stringify(postdata);
            $.ajax({
              type: "POST",
              dataType: "json",
              url: "${home}profile/view",
              //data: {myData:dataString},
              contentType: "application/json; charset=utf-8",
              success: function(responsedata,status){
                if(status=="success"){

                  responsedata =  JSON.stringify(postdata);


                  document.getElementById("username").innerHTML=responsedata['username'];
                  document.getElementById("customerid").innerHTML=responsedata['cust_id'];
                  document.getElementById("type").innerHTML=responsedata['user_type'];
                  document.getElementById("firstname").innerHTML=responsedata['f_name'];
                  document.getElementById("lastname").innerHTML=responsedata['l_name']; 
                  document.getElementById("ssn").innerHTML=responsedata['ssn'];
                  document.getElementById("email").innerHTML=responsedata['email'];
                  document.getElementById("mobile").innerHTML=responsedata['mobile'];
                  document.getElementById("mobilecarrier").innerHTML=responsedata['mobile_carrier'];
                  //document.getElementById("accnos").innerHTML=responsedata['acc_nos'];
                  document.getElementById("address").innerHTML=responsedata['address'];
                  document.getElementById("dob").innerHTML=responsedata['dob'];
                  document.getElementById("orgname").innerHTML=responsedata['org_name'];
                  document.getElementById("orgid").innerHTML=responsedata['org_id']
                            var accno="";
                            for (var i =0 ; i< Object.keys(responsedata["acc_nos"]).length;i++)
                            {
                              accno+=responsedata["acc_nos"][i];
                        //Bhai Saurabh yeh logic check kar lena I have my doubts here
                      }
                      document.getElementById("accnos").innerHTML=accno;



                      
                    }
                  },
                  error: function(e){
                    console.log(e.message);
                  }
                });

          }

        }


        window.onload=getdetails;
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

        <div class="jumbotron">
          <div class="container">
            <h1> Your Profile </h1>
            <h2 id="customername"></h2>

            <div class=" col-md-12 col-lg-12 "> 
              <table class="table table-user-information">
                <tbody>

                  <tr>
                    <th>Username</th>
                    <td id="username"></td>
                  </tr>
                  
                  <tr>
                    <th>Customer ID</th>
                    <td id="custid"></td>
                  </tr>
                  

                  <tr>
                    <th>First Name</th>
                    <td id="firstname"></td>
                  </tr>
                  

                  <tr>
                    <th>Last Name</th>
                    <td id="lastname"></td>
                  </tr>
                  

                  <tr>
                    <th>SSN</th>
                    <td id="ssn"></td>
                  </tr>
                  

                  <tr>
                    <th>Email</th>
                    <td id="email"></td>
                  </tr>
                  

                  <tr>
                    <th>Mobile Number</th>
                    <td id="mobilecarrier"></td>
                  </tr>
                  

                  <tr>
                    <th>Account Numbers</th>
                    <td id="accnos"></td>
                  </tr>
                  

                  <tr>
                    <th>Address</th>
                    <td id="address"></td>
                  </tr>
                  
                  <tr>
                    <th>DOB</th>
                    <td id="dob"></td>
                  </tr>
                  

                  <tr>
                    <th>Organisation Name</th>
                    <td id="orgname"></td>
                  </tr>
                  

                  <tr>
                    <th>Organisation ID</th>
                    <td id="orgid"></td>
                  </tr>

                  
              </tbody>
            </table>

          </div>

        </div>
      

      </div>





    </body>

    </html>
