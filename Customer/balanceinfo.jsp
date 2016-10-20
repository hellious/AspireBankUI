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

<script>


         
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
              url: "${home}account/view",
              //data: {myData:dataString},
              contentType: "application/json; charset=utf-8",
              success: function(responsedata,status){
                if(status=="success"){

                  responsedata =  JSON.stringify(postdata);
                  for (var i =0 ; i< Object.keys(responsedata["data"]).length ; i++)
                        {
                        var option = document.createElement("option");
                        option.text = responsedata["data"][i]["acc_no"];
                        option.value = responsedata["data"][i]["acc_no"];
                        var select1 = document.getElementById("myaccounts");
                        select1.appendChild(option);
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
      <script type="text/javascript">
         
         function showtable() {

            var postdata = 
                {
                    //cust_id:session;
                    "acc_no":document.getElementById("myaccounts").value,
                }
                var dataString = JSON.stringify(postdata);
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "${home}account/download",
                    data: {myData:dataString},
                    contentType: "application/json; charset=utf-8",
                    success: function(data,status){
                        if(status=="success"){
                          //Saurabh Bhai samjh ni aaya tere code kaise kaam kar raha hai dekh lio ek baar. Please
                          //niche yaha table hai waha print karna hai


                        }
                    },
                    error: function(e){
                        console.log(e.message);
                    }
                });

            }
          

       </script>



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

        <!-- Page Content -->
        <div id="banner">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                      <div class="inner">
                         <div class="logo"><span class="icon fa-diamond"></span></div>
                         <h1>Account Statement</h1>

                         <label for="self">From Account Number:</label>
                             <select class="form-control" id="myaccounts" onchange="showtable()">
                                <option value="None"> </option>
                            </select>


                            <div id="f1" >   
                             <table class="table table-striped">
                                 <thead class="thead-inverse">
                                    <tr>

                                      <th>#</th>
                                      <th>Date/Time</th>
                                      <th>Amount</th>
                                      <th>Remarks</th>
                                      <th>Trasfered From</th>
                                      <th>Trasfered To</th>
                                      <th>Transaction Status</th>
                                  </tr>

                                  <!-- THE JSON STRING HAS TO BE OF THE FORM OF THE TABLE HEADING MENTIONED ABOVE SO THAT IT CAN BE EASILY DISPLAYED IN THE UI  -->
                              </thead>
                              <tbody>
                                
                          </tbody>
                      </table>
                  </div>

          


</div>

<div>
 <button type="submit">Download</button>
</div>
</div>
</div>
</div>
</div>
<!-- /#page-content-wrapper -->

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
