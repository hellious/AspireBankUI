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

        	function readfile(file)
        	{
        		var rawFile = new XMLHttpRequest();
        		rawFile.open("GET", "empdetails.json", true);
        		rawFile.onreadystatechange = function ()
        		{
        			if(rawFile.readyState === 4)
        			{
        				if(rawFile.status === 200 || rawFile.status == 0)
        				{
        					var allText = rawFile.responseText;
        					var data  =  JSON.parse(allText);
                //var select = document.getElementById("myaccounts");
                for (var i =0 ; i< Object.keys(data["Savingsaccount"]).length ; i++)
                	{ var option = document.createElement("option");
                option.text = data["Savingsaccount"][i]["Accountnumber"];
                option.value = data["Savingsaccount"][i]["Accountnumber"];
                var select1 = document.getElementById("toself");
                select1.appendChild(option);

            }
            for (var i =0 ; i< Object.keys(data["Checkingaccount"]).length ; i++)
            	{ var option = document.createElement("option");
            option.text = data["Checkingaccount"][i]["Accountnumber"];
            option.value = data["Checkingaccount"][i]["Accountnumber"];
            var select1 = document.getElementById("toself");
            select1.appendChild(option);                    
        }


        for (var i =0 ; i< Object.keys(data["Savingsaccount"]).length ; i++)
        	{ var option = document.createElement("option");
        option.text = data["Savingsaccount"][i]["Accountnumber"];
        option.value = data["Savingsaccount"][i]["Accountnumber"];
        var select2 = document.getElementById("fromself");
        select2.appendChild(option);

    }
    for (var i =0 ; i< Object.keys(data["Checkingaccount"]).length ; i++)
    	{ var option = document.createElement("option");
    option.text = data["Checkingaccount"][i]["Accountnumber"];
    option.value = data["Checkingaccount"][i]["Accountnumber"];
    var select2= document.getElementById("fromself");
    select2.appendChild(option);

}

}
}

}
rawFile.send(null);
}
window.onload=readfile;

function selfaccount()
{


	var postdata = 
	{
		"fromaccountnumber":document.getElementById("fromself").value,
		"to":document.getElementById("toself").value,
		"amount":document.getElementById("transferamount").value,
		"remarks":document.getElementById("self_remark").value
	}
	var dataString = JSON.stringify(postdata);
	$.ajax({
		type: "POST",
		dataType: "json",
		url: "${home}transfer",

//This part is mising 
		data: {myData:dataString},
		contentType: "application/json; charset=utf-8",
		success: function(data,testResponse,xhr){
			document.getElementById("st_status").innerHTML="Transcation success";
		},
		error: function(e){
			document.getElementById("st_status").innerHTML=e.message;
		}
	});

}

function otheraccount()
{


	var postdata = 
	{
		"fromaccountnumber":document.getElementById("fromaccount").value,
		"to":document.getElementById("toaccount").value,
		"email":document.getElementById("email").value,
		"confirmemail": document.getElementById("confirmemail").value,
		"amount":document.getElementById("payamount").value,
		"remarks":document.getElementById("other_remark").value
	}
	var dataString = JSON.stringify(postdata);
	$.ajax({
		type: "POST",
		dataType: "json",
		url: "${home}transfer",
		data: {myData:dataString},
		contentType: "application/json; charset=utf-8",
		success: function(data){
			document.getElementById("ot_status").innerHTML="Transcation success";
		},
		error: function(e){
			document.getElementById("ot_status").innerHTML=e.message;
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

				<li><a data-toggle="tab" href="#transaction">Transaction Requests</a></li>
				<li><a data-toggle="tab" href="#service">Service Requests</a></li>
				
			</ul>
			<div class="tab-content">
				<div id="transaction" class="tab-pane fade ">
						
						

					<h2>
						Transaction Requests
					</h2>


						<table id="notification">
				<tr><th>Description</th><th>To</th><th>From</th><th>Amount</th><th>Accept/Decline</th></tr>
				<tr><td>Something</td><td>Something</td><td>Something</td><td>Something</td><td>Something</td></tr>
				</table>



						</div>

							
						<div id="service" class="tab-pane fade in active">

							<h2>
								Service  Requests
							</h2>

							<form role="form" class="form-horizontal" action="" method="POST" onsubmit="selfaccount()" >
								
								<div class="col-sm-8" class="form-group">
								<label for="sel1">Request Type:</label>
							      <select class="form-control" id="request_type">
							        <option>Harsih tell the options </option>
							        <option>Harsih tell the options</option>
							        <option>Harsih tell the options</option>
							        <option>Harsih tell the options</option>
							      </select>
							      
							<br/>

							      <div class="col-md-8">

                                <input class="btn btn-primary" value="Save Changes" type="submit">
                                <span></span>
                                

                                    </div>
                                </div>


							      </div>
							      </form>


					</div>




	


				</div><!--end of tabbed content-->
			</div>

			<!-- /#page-content-wrapper -->

		</div>
		<!-- /#wrapper -->

	

	</body>

	</html>
