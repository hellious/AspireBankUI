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
    <!--[if lt IE 9]>-
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
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
        					for (var i =0 ; i< Object.keys(responsedata["data"]).length ; i++)
				              	{
					              var option = document.createElement("option");
					              option.text = responsedata["data"][i]["acc_no"];
					              option.value = responsedata["data"][i]["acc_no"];
					              var select1 = document.getElementById("from_t1");
					              select1.appendChild(option);
        						}
        					for (var i =0 ; i< Object.keys(responsedata["data"]).length ; i++)
				              	{
					              var option = document.createElement("option");
					              option.text = responsedata["data"][i]["acc_no"];
					              option.value = responsedata["data"][i]["acc_no"];
					              var select1 = document.getElementById("from_t2");
					              select1.appendChild(option);
        						}	
        					for (var i =0 ; i< Object.keys(responsedata["data"]).length ; i++)
				              	{
					              var option = document.createElement("option");
					              option.text = responsedata["data"][i]["acc_no"];
					              option.value = responsedata["data"][i]["acc_no"];
					              var select1 = document.getElementById("from_t3");
					              select1.appendChild(option);
        						}

        						for (var i =0 ; i< Object.keys(responsedata["data"]).length ; i++)
				              	{
					              var option = document.createElement("option");
					              option.text = responsedata["data"][i]["acc_no"];
					              option.value = responsedata["data"][i]["acc_no"];
					              var select1 = document.getElementById("to_t1");
					              select1.appendChild(option);
        						}

        			},
        			error: function(e){
        				console.log(e.message);
        			}
        		});

        	}

        }

window.onload=getdeails;

function selfaccount()
{
	var postdata = 
	{
		//cust_id: session;
		"from_acc":document.getElementById("from_t1").value,
		"to_acc":document.getElementById("to_t1").value,
		"t_amount":document.getElementById("amount_t1").value,
		"remarks":document.getElementById("remark_t1").value
	}
	var dataString = JSON.stringify(postdata);
	$.ajax({
		type: "POST",
		dataType: "json",
		url: "${home}transfer/fund",
		data: {myData:dataString},
		contentType: "application/json; charset=utf-8",
		success: function(data,status){
			if(status=="success"){
			document.getElementById("st_status").innerHTML="Transcation success";
			}
		},
		error: function(e){
			document.getElementById("st_status").innerHTML="Transcation failure:"+ e.message;
		}
	});

}

function otheraccount()
{


	var postdata = 
	{
		//cust_id: session;
		"from_acc":document.getElementById("from_t2").value,
		"to_acc":document.getElementById("to_t2").value,
		"t_amount":document.getElementById("amount_t2").value,
		"remarks":document.getElementById("remark_t2").value
	}
	var dataString = JSON.stringify(postdata);
	$.ajax({
		type: "POST",
		dataType: "json",
		url: "${home}transfer/fund",
		data: {myData:dataString},
		contentType: "application/json; charset=utf-8",
		success: function(data,status){
			if(status=="success"){
			document.getElementById("ot_status").innerHTML="Transcation success";
			}
		},
		error: function(e){
			document.getElementById("ot_status").innerHTML="Transcation failure:"+ e.message;
		}
	});

}

function quickpay()
{



	var postdata = 
	{     //cust_id: session;
		"from_acc":document.getElementById("from_t3").value,
		"to":document.getElementById("toaccount").value,
		"t_amount":document.getElementById("amount_t3").value,
		"remarks":document.getElementById("remark_t3").value
	}
	var dataString = JSON.stringify(postdata);
	$.ajax({
		type: "POST",
		dataType: "json",
		url: "${home}transfer/quick",
		data: {myData:dataString},
		contentType: "application/json; charset=utf-8",
		success: function(data){
			document.getElementById("qt_status").innerHTML="Transcation success";
		},
		error: function(e){
			document.getElementById("ot_status").innerHTML="Transcation failure:"+ e.messagege;
		}
	});

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

		<!-- Page Content -->
		<div class="container-fluid">
			<ul class="nav nav-tabs nav-justified" role="tablist">

				<li><a data-toggle="tab" href="#self">Between your accounts</a></li>
				<li><a data-toggle="tab" href="#other">InterBank Transfer </a></li>
				<li><a data-toggle="tab" href="#quickpay">Quick Pay</a></li>
			</ul>
			<div class="tab-content">
				<div id="quickpay" class="tab-pane fade ">
						
						<div  class="alert alert-info alert-dismissable">
							<a class="panel-close close" data-dismiss="alert">×</a> 
							<i class="fa fa-coffee"></i>
							<strong>Transaction Status</strong><div id="st_status" ></div>
						</div>


					<h2>
						Transfer your money to someone else account
					</h2>



					<form role="form" class="form-horizontal" onsubmit="quickpay()">


						<div class="form-group">
							
							<div class="col-sm-6"><label for="self">Email/Phone Number</label>
								<script>
									function chooseOption(){
										element_selected = document.getElementById("fromaccount").options[document.getElementById("fromaccount").selectedIndex].text;
										if(element_selected === 'Email') {
											parent = document.getElementById("fromaccount").parentNode;
											parent.innerHTML = "<label>Email</label><input class=\"form-control\"  type=\"email\" id=\"email\" required>";
											parent.nextElementSibling.innerHTML = "<label>Confirm Email</label><input class=\"form-control\"  type=\"email\" id=\"confirmemail\" required>";
										};
										if(element_selected === 'Phone Number') {
											parent = document.getElementById("fromaccount").parentNode;
											parent.innerHTML = "<label>Phone Number</label><input class=\"form-control\"  type=\"number\" id=\"number\" required>";
											parent.nextElementSibling.innerHTML = "<label>Confirm Phone Number</label><input class=\"form-control\"  type=\"number\" id=\"confirmphnumber\" required>";
										};
									}
								</script>
								<select class="form-control" id="fromaccount" onchange="chooseOption()" required>
									<option> </option>
									<option>Email</option>
									<option>Phone Number</option>
								</select></div> 

								<div class="col-sm-6"><label>Confirm Email/Phone Number:</label><input type="email" class="form-control" id="to_t3"  required></div>
							</div>

							<div class="form-group">
								<div class="col-sm-6"><label for="self">Pay from Account Number:</label>
									<select class="form-control" id="from_t3" required>
										<option></option>
									</select></div>
									

								</div>


								<div class="form-group">
									<div class="col-sm-6"><label>Amount</label><input class="form-control" id="amount_t3"  type="number" pattern="[0-9]" min="1" max="99999" required></div>
									<div class="col-sm-6"><label>Remark</label><input class="form-control" id="remark_t3"  type="text"  required></div>
								</div>

								


								<button type="submit" class="btn btn-default">Pay</button>
							</form>
						</div>

							




						<div id="self" class="tab-pane fade in active">

							<div  class="alert alert-info alert-dismissable">
							<a class="panel-close close" data-dismiss="alert">×</a> 
							<i class="fa fa-coffee"></i>
							<strong>Transaction Status:</strong><div id="st_status" ></div>
						</div>



							<h2>
								Transfer your money within your own accounts
							</h2>

							<form role="form" class="form-horizontal" action="" method="POST" onsubmit="selfaccount()" >

								<div class="form-group">
									<div class="col-sm-6">
										<label for="self">From Account Number:</label>
										<select class="form-control" id="from_t1" required>
											<option></option>

										</select>
									</div>



									<div class="col-sm-6">
										<label for="sel1">To Account Number:</label>
										<select class="form-control" id="to_t1" required>
											<option></option>

										</select>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-6"><label>Amount</label><input class="form-control" id="amount_t1"  type="number" pattern="[0-9]" min="1" max="99999" required></div>

									<div class="col-sm-6"><label>Remark</label><input class="form-control" id="remark_t1" required></div>
									

								</div>


								<button type="submit" class="btn btn-default">Transfer</button>
								
							<button type="button" class="btn btn-default" onclick="openVKeyboard">Virtual Keyboard</button>
									
							

						</form>

						


					</div>




					<div id="other" class="tab-pane fade ">
						
						<div  class="alert alert-info alert-dismissable">
							<a class="panel-close close" data-dismiss="alert">×</a> 
							<i class="fa fa-coffee"></i>
							<strong>Transaction Status</strong><div id="qt_status" ></div>
						</div>


					<h2>
						Transfer your money by Quick Pay
					</h2>



					<form role="form" class="form-horizontal" onsubmit="otheraccount()">


						
							<div class="form-group">
								<div class="col-sm-6"><label for="self">Pay from Account Number:</label>
									<select class="form-control" id="fromaccount" required>
										<option></option>
									</select></div>
									<div class="col-sm-6"><label>To Account Number:</label><input type="number" class="form-control" id="to_t2"  required></div>

								</div>


								<div class="form-group">
									<div class="col-sm-6"><label>Amount</label><input class="form-control" id="amount_t2"  type="number" pattern="[0-9]" min="1" max="99999" required></div>
									<div class="col-sm-6"><label>Remark</label><input class="form-control" id="remark_t2"  type="text"  required></div>

								</div>


								<button type="submit" class="btn btn-default">Pay</button>
							</form>
						</div>


				</div><!--end of tabbed content-->
			</div>

			<!-- /#page-content-wrapper -->

		</div>
		<!-- /#wrapper -->




	</body>

	</html>
