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
              url: "${home}card/view",
              //data: {myData:dataString},
              contentType: "application/json; charset=utf-8",
              success: function(responsedata,status){
                if(status=="success"){


                   responsedata =  JSON.stringify(postdata);
                  document.getElementById("mp_cc_number").innerHTML=responsedata['card_no'];
                  document.getElementById("mp_cc_value").innerHTML=responsedata['amount_current'];
                  document.getElementById("mp_cc_aggregrate").innerHTML=responsedata['amount_aggregte'];
                  document.getElementById("mp_cc_interest").innerHTML=responsedata['interest_amount'];
                  
                  document.getElementById("mp_cc_late").innerHTML=responsedata['late_fee'];
                  

                }
              },
              error: function(e){
                console.log(e.message);
              }
            });

          }

        }


        function makepayment()
        {



          var postdata = 
          {
            //"cc_id": 123123123123
            "card_no":document.getElementById("mp_cc_number").value,
            "pay_amount":document.getElementById("amount_t1").value
          }
          var dataString = JSON.stringify(postdata);

                //alert(dataString);
                $.ajax({
                  type: "POST",
                  dataType: "json",
                  url: "${home}card/pay",
                  data: {myData:dataString},
                  contentType: "application/json; charset=utf-8",
                  success: function(data,status){
                      if(status=="success"){
                          alert("Payment success");
                         }
                       },
                      error: function(e){
                console.log(e.message);
              }
                    });

              }



   function makepurchase()
        {



          var postdata = 
          {
            //"cc_id": 123123123123
            "card_no":document.getElementById("mp_cc_number").value,
            "pay_amount":document.getElementById("amount_t1").value
          }
          var dataString = JSON.stringify(postdata);

                //alert(dataString);
                $.ajax({
                  type: "POST",
                  dataType: "json",
                  url: "${home}card/pay",
                  data: {myData:dataString},
                  contentType: "application/json; charset=utf-8",
                  success: function(data,status){
                      if(status=="success"){
                          alert("Purchase  request has been made ");
                         }
                       },
                      error: function(e){
                console.log(e.message);
              }
                    });

              }


 function ccstatement()
        {



          var postdata = 
          {
            //"cc_id": 123123123123
            "card_no":document.getElementById("mp_cc_number").value,
          }
          var dataString = JSON.stringify(postdata);

                //alert(dataString);
                $.ajax({
                  type: "POST",
                  dataType: "json",
                  url: "${home}card/pay",
                  data: {myData:dataString},
                  contentType: "application/json; charset=utf-8",
                  success: function(data,status){
                      if(status=="success"){
                          alert("Purchase  request has been made ");
                         }
                       },
                      error: function(e){
                console.log(e.message);
              }
                    });

              }
              

              

              
              


              window.onload=getcreditdetails;

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

    <li><a data-toggle="tab" href="#makepayment">Make Payment</a></li>
    <li><a data-toggle="tab" href="#downloadstatement">Download Statement</a></li>
    <li><a data-toggle="tab" href="#makepurchase">Make Purchase</a></li>
    <!--<li><a data-toggle="tab" href="#changeUserName">Request Purchase</a></li>-->
    <!--<li><a data-toggle="tab" href="#updatecclimit">Update Credit Limit</a></li>-->
  </ul>
  <div class="tab-content">


   <!-- ###################################### Phone no tab-->
   <div id="downloadstatement" class="tab-pane fade ">
    <div class="container">
      <h1>Credit Card Statements</h1>
      <hr>
      <div class="row">
        <!-- left column -->


        <!-- edit form column -->
        <div class="col-md-12 personal-info">

          <div id="f1" >   
           <table class="table table-striped">
             <thead class="thead-inverse">
              <tr>
                <th>#</th>
                <th>Date</th>
                <th>Credit Card Number</th>
                <th>Credit Value</th>
                <th>Credit Balance</th>
              </tr>

              <!-- THE JSON STRING HAS TO BE OF THE FORM OF THE TABLE HEADING MENTIONED ABOVE SO THAT IT CAN BE EASILY DISPLAYED IN THE UI  -->
            </thead>
            <tbody>

            </tbody>
          </table>
        </div>

        <div>
          <button type="submit">Download</button>
        </div>



      </div>
    </div>
  </div>
</div>
<!-- ######################################-->

<!-- ###################################### Password tab-->
<div id="makepurchase" class="tab-pane fade ">
  <div class="container">
    <h1>Make your purchase</h1>
    <hr>
    <div class="row">
   
      <div class="col-md-12 personal-info">
        


      		
          

          <form class="form-horizontal" role="form" method="POST" onsubmit="makepurchase()">




      
			<div class="form-group">
		       <label class="col-lg-3 control-label">Merchant:</label>
		              <div class="col-lg-8">
		                <select multiple class="form-control" id="merchant">
		        <option value="Amazon" > Amazon</option>
		        <option value="Flipkart"  >Flipkart</option>
		        <option value="Ebay" >Ebay</option>
		      </select>
		      
              </div>
            </div>


            <div class="form-group">
              <label class="col-lg-3 control-label">Amount:</label>
              <div class="col-lg-8">
                <input class="form-control" id="amount_t3"  type="number">
              </div>
            </div>

            <div class="form-group">
              <label class="col-lg-3 control-label">Expiry date</label>
              <div class="col-lg-8">
                <input class="form-control" id="expdate"  type="number">
              </div>
            </div>


            <div class="form-group">
              <label class="col-lg-3 control-label">CVV:</label>
              <div class="col-lg-8">
                <input class="form-control" id="cvv"  type="password">
              </div>
            </div>


            <div class="form-group">
              <label class="col-lg-3 control-label">Organisation Name:</label>
              <div class="col-lg-8">
                <input class="form-control" id="orgname"  type="password">
              </div>
            </div>


            <div class="form-group">
              <label class="col-lg-3 control-label">Organisation Id:</label>
              <div class="col-lg-8">
                <input class="form-control" id="orgid"  type="password">
              </div>
            </div>


            <div class="form-group">
              <label class="col-md-3 control-label"></label>
              <div class="col-md-8">

                <input class="btn btn-primary" value="Pay" type="submit">
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

  <!-- ###################################### Username tab
  <div id="updatecclimit" class="tab-pane fade ">
    <div class="container">
      <h1>Update Credit Card limit</h1>
      <hr>
      <div class="row">
       
        <div class="col-md-12 personal-info">


          <form class="form-horizontal" role="form" method="POST" onsubmit="updatecclimit()">


            <div class="form-group">
              <label class="col-md-3 control-label">New Credit Card Limit:</label>
              <div class="col-md-8">
                <input class="form-control" id="new_username"  type="number">
              </div>
            </div>

            <div class="form-group">
              <label class="col-md-3 control-label"></label>
              <div class="col-md-8">

                <input class="btn btn-primary" value="Update" type="submit">
                <span></span>
                <input class="btn btn-default" value="Cancel" type="reset">

              </div>
            </div>

          </form>

        </div>
      </div>
    </div>
  </div>
   ######################################-->  


  <!-- ###################################### Nameab-->
  <div id="makepayment" class="tab-pane fade in active">
    <div class="container">
      <h1>Make Payment</h1>
      <hr>
      <div class="row">
        <!-- left column -->


        <!-- edit form column -->
        <div class="col-md-12 personal-info">
          <div class="alert alert-info alert-dismissable">
            <a class="panel-close close" data-dismiss="alert">×</a> 
            <i class="fa fa-coffee"></i>
            <strong id="mp_cc_number"></strong><div id="mp_cc_value"></div>
          </div>

          <form class="form-horizontal" role="form" method="POST" onsubmit="makepayment()">


            <div class="form-group">
              <label class="col-lg-3 control-label">Amount:</label>
              <div class="col-lg-8">
                <input class="form-control" id="amount_t1"  type="number">
              </div>
            </div>

            <div class="form-group">
              <label class="col-md-3 control-label"></label>
              <div class="col-md-8">

                <input class="btn btn-primary" value="Pay" type="submit">
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




</div>
<!-- /#wrapper -->



<!-- Menu Toggle Script -->
<script>
  $("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
  });
</script>

</body>

</html>
