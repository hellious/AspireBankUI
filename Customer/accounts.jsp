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
	

        <script type="text/javascript">


        	function getdetails()
        	{

        	//	var postdata = 
        	//	{
        	//		"cust_id":session()
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
        					for (var i =0 ; i< Object.keys(responsedata["data"]).length;i++)
        					{
        						txt+="<div class='row'><div class='col-md-8'><h3>Account Number:</h3><h4>" + responsedata["data"][i]["acc_no"]+ "</h4></div><div class='col-md-4'><h3>Balance:</h3><h5>$" + resposedata["data"][i]["balance"]+ "</h5></div></div>";
        					}
        					document.getElementById("accounts").innerHTML=txt;

        					//document.getElementById("customername").innerHTML=responsedata['cust_name'];
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
				<h2 id="customername"></h2>
				<h3> Accounts</h3>
				<div id="accounts">        </div>
				
				

				

			</div>





		</div>





	</body>

	</html>
