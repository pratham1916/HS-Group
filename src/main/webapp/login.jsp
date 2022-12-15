<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	 
	<!--  <link rel="stylesheet" href="css//dashboard.css" /> -->
    <title>Login Here!</title>
    
    <script>
    $(document).ready(function(){
    	$("#emailtxt").blur(function(){
    	
    		var email=$("#emailtxt").val();
    		$.get("emailServer.jsp",{email:email},function(data,status){
    			$("#emailid").text(data);
    		});
    	});
    	$("#reg").click(function(){
    		var name =$("#name").val();
    		var email =$("#email").val();
    		var pass =$("#password").val();
    		var emailid=$("#emailid").val();
    		var nameid=$("#nameid").val();
    		$.get("registerServer.jsp",{name:name,password:pass,emailid:emailid,nameid:nameid, email:email},function(data,status){
    			//$("#ses").text(data);
    			alert(data);
    		});    
    	});
    });
    
    </script>
  </head>
  <body class="img js-fullheight" style="background-image: url(image//bg1.jpg);">
  
  <%
	String seslogfail = (String) session.getAttribute("seslogfail");
	if (seslogfail == null) {

	} else {
	%>
	<script>swal("<%=seslogfail%>", "Wrong credential!", "error");</script>
	<%
	session.setAttribute("seslogfail", null);
	}
	%>


	<%
	String sesreg = (String) session.getAttribute("sesreg");
	if (sesreg == null) {

	} else {
	%>
	<script>swal("<%=sesreg%>
		", "Registration Successfull !", "success");
	</script>
	<%
	session.setAttribute("sesreg", null);

	}
	%>
  <div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				
					<div class="row">
						<div class="col col-lg-2"></div>
						<div class="col col-lg-8">
						<div class="w-100">
							<h2 class="mb-1" style="text-align:center;">Sign In</h2>
						</div>
						<!-- <form class="login-form" action="registerServer.jsp"> -->
							<div class="form-group">
							<label><strong>Fullname</strong></label>
								<input type="text" class="form-control" id="nametxt" placeholder="Enter Your FullName" required>
							</div>

							<div class="form-group">
							<label><strong>Email</strong></label>
								<input type="email" class="form-control" id="emailtxt" name="email" placeholder="Enter Your Email Id" required>
								<p id= "emailid" style="color:red;"></p>
							</div>

							<div class="form-group">
							<label><strong>Contact Number</strong></label>
								<input type="tel" class="form-control" id="phnotxt" placeholder="Enter Your Contact Number" required>
							</div>

							<div class="form-group">
							<label><strong>Password</strong></label>
								<input type="password" class="form-control" id="passwordtxt" placeholder="Enter Your Password" required>
							</div>

							<div class="form-group">
							<label><strong>Re-Password</strong></label>
								<input type="password" class="form-control " name="conpassword" placeholder="Re-Enter Your Password" required>
							</div>

							<button type="submit" id="reg" class="btn btn-primary  btn-block text-uppercase rounded-pill btn-lg">Register</button>
							<br>
						<!-- </form> -->
					</div>
					</div>
				</div>
			</div>
		</div>
		
		
  <div >
   <section class="vh-100">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-12">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img height="100vh"; src="image//bg1.jpg" alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">
              
                <form action="loginServer.jsp">

                  <div class="d-flex align-items-center mb-3 pb-1">
                    <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219; "></i>
                    <span class="h1 fw-bold mb-0"><strong>Online Shopping</strong></span>
                  </div>

                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>

                  <div class="form-outline mb-4">
                 	<label><strong>Email Address or PhoneNo.</strong></label>
                    <input type="text"  name="uname" class="form-control form-control-lg" />
                  </div>

                  <div class="form-outline mb-4">
                  <label><strong>Password</strong></label>
                    <input type="password"  name="pass" class="form-control form-control-lg" />
                  </div>

                  <div class="pt-1 mb-4">
                    <button class="btn btn-dark btn-lg btn-block" type="submit">Login</button>
                  </div>

                  <a class="small text-muted" href="#!">Forgot password?</a>
                  <p class="mb-5 pb-lg-2" >Don't have an account?
                  <a href="#" style="color: #393f81;" data-toggle="modal" data-target="#myModal"><strong>Register here</strong></a></p>
                  <a href="#!" class="small text-muted">Terms of use.</a>
                  <a href="#!" class="small text-muted">Privacy policy</a>
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>