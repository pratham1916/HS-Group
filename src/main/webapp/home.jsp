<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Hello, world!</title>

<link rel="stylesheet" href="css//dashboard.css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>

	<%@page import="java.sql.*"%>

	<script type="text/javascript">
    
    $(document).ready(function() {
		$("#addsection").show();
		$("#editsection").hide();
		
		 $("#addid").click(function () {
			$("#addsection").show();
			$("#editsection").hide();
		}); 
		 
		 $("#editid").click(function () {
				$("#addsection").hide();
				$("#editsection").show();
			});
		 
	});
    
    </script>



	<link
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
		rel="stylesheet"
		integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
		crossorigin="anonymous">
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#">Simple Ecommerce</a>
			<!--  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button> -->

			<div class="collapse navbar-collapse justify-content-end"
				id="navbarsExampleDefault">
				<ul class="navbar-nav m-auto">
					<li style="padding-left: 20px;" class="nav-item m-auto"><a
						class="nav-link active" href="#"><span
							id="addid">Add new Products</span></a></li>
					<li style="padding-right: 10px;" class="nav-item"><a
						class="nav-link active" href="#"><span id="editid">Add
								Category</span></a></li>
					<li style="padding-right: 10px;" class="nav-item "><a
						class="nav-link active" href="#"><span id="messageid">Messages
								Received</span></a></li>
					<li style="padding-right: 10px;" class="nav-item "><a
						class="nav-link active" href="#"><span id="cancelid">Cancel
								Order</span></a></li>
					<li style="padding-right: 10px;" class="nav-item"><a
						class="nav-link active" href="#"><span id="deliveredid">Delivered
								Orders</span></a></li>
				</ul>

				<form class="form-inline my-2 my-lg-0">
					<div class="input-group input-group-sm">
						<input type="text" class="form-control" aria-label="Small"
							aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
						<div class="input-group-append">
							<button type="button" class="btn btn-secondary btn-number">
								<i class="fa fa-search"></i>
							</button>
						</div>
						<a style="" class="btn btn-danger btn-sm ml-3"
							href="login.jsp"> <i class="fa fa-logout"></i> Logout
						</a>
					</div>
					<!-- <a class="btn btn-success btn-sm ml-3" href="">
                    <i class="fa fa-shopping-cart"></i> Cart
                    <span class="badge badge-light">3</span>
                </a><br> -->

				</form>
			</div>
		</div>
	</nav>
	<section class="jumbotron text-center">
		<div class="container">
			<h1 class="jumbotron-heading">Admin Dashboard</h1>
			<br>
			<%
					int id = 1;
					try {
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
						String query = "select max(id) from productinfo";
						PreparedStatement pst = con.prepareStatement(query);
						ResultSet rst = pst.executeQuery();
						while (rst.next()) {
							id = rst.getInt(1);
							id = id + 1;
						}
					} catch (Exception ex) {
						out.println(ex);
					}
					%>
			<h4 style="color: red;">Product Id:<%=id %></h4>
		</div>
	</section>

	<div class="container mb-4">
		<div class="row">
			<div class="col-12">


				<!-- -----------SECTION ADD NEW PRODUCTS STARTS HERE------------ -->
				<section id="addsection">

					
					 <div class="container text-center">
					 
                     <div class="row">
                     <div class="col col-lg-2">
                     </div>
                      <div class="col col-lg-8">
                      <form action="">
                  <div class="form-group">
                  <label><b>Enter Product Title: </b></label>
                  <input class="form-control" type="text" name="ptitle" placeholder="Enter Product Title here...." required="required">
                  </div>
				  <div class="form-group">
                  <label><b>Enter Product Description: </b></label>
                  <textarea class="form-control" style="height: 150px;" rows="" cols="" name="pdescription" placeholder="Enter Product Description here..."></textarea>
                  </div>
                <div class="form-group">
                  <label><b>Enter Product Price: </b></label>
                  <input type="number" class="form-control" name="pprice" placeholder="Enter Product Price here....">
                  </div>
                   <div class="form-group">
                  <label><b>Enter Product Discount: </b></label>
                  <input type="number" class="form-control" name="pdiscount" placeholder="Enter Product Discount here....">
                  </div>
                   <div class="form-group">
                  <label><b>Enter Product Quantity: </b></label>
                  <input type="number" class="form-control" name="pquantity" placeholder="Enter Product Quantity here....">
                  </div>
                  
                 
                  <div class="form-group">
                  <label><b>Select Product Category: </b></label>
                 <select name="category" class="form-control">
                 <option >Choose Category</option>
                 
                  <%
                   int catid=0;
                   String cattitle="";
					try {
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom_db", "root", "");
						String query = "select * from productcategory";
						PreparedStatement pst = con.prepareStatement(query);
						ResultSet rst = pst.executeQuery();
						while (rst.next()) {
							%>
							<option value="<%=rst.getInt(1)%>"><%=rst.getString(2) %></option>
							<%
						}
					} catch (Exception ex) {
						out.println(ex);
					}
					 %>
                  
                 
                 </select>
                  </div>
                  <div class="form-group">
                  <label><b>Select Product Image: </b></label>
                  <input type="file" class="form-control" name="pimage" required="required">
                  </div>
                  <button style="margin-top: 15px;" class="btn btn-outline-success">Add Product</button>
                  </form>
					 </div>
					 <div class="col col-lg-2">
                     </div>
					</div>
					</div>
				</section>
				<!-- -----------SECTION ADD NEW PRODUCTS ENDS HERE------------ -->


				<!-- -----------SECTION EDIT PRODUCTS STARTS HERE------------ -->

				<section id="editsection">
				
				<%
						String sescategory = (String) session.getAttribute("sescategory");
						if (sescategory == null) {

						} else {
						%>
						<script> swal("<%=sescategory%>", "", "success")</script>

						<%
						session.setAttribute("sescategory", null);
						}
						%>
				<h3 style="color: red; padding-left: 350px;"><strong>ADD CATEGORY HERE></h3>
                     <div class="container text-center">
                     <div class="row">
                     <div class="col col-lg-2">
                     </div>
                      <div class="col col-lg-8">
                     
					<form action="addCategoryServer.jsp">
					
					<div class="form-group ">
					<input type="text" class="form-control" name="cattitle" placeholder="Enter Category Title" required="required">
					</div>
					<div>
					<textarea rows="" cols="" style="height: 150px;" class="form-control" placeholder="Enter Category Description " name="catdescription"></textarea>
					</div>
					<button style="margin-top: 30px;" class="btn btn-outline-success ">Add Category</button>
					</form>
					</div>
					 <div class="col col-lg-2">
                     </div>
					</div>
					</div>
				</section>
				<!-- -----------SECTION EDIT PRODUCTS ENDS HERE----------- -->

			</div>
		</div>

	</div>




	<!-- Footer -->
	<footer class="text-light">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-lg-4 col-xl-3">
					<h5>About</h5>
					<hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
					<p class="mb-0">Le Lorem Ipsum est simplement du faux texte
						employé dans la composition et la mise en page avant impression.</p>
				</div>

				<div class="col-md-2 col-lg-2 col-xl-2 mx-auto">
					<h5>Informations</h5>
					<hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
					<ul class="list-unstyled">
						<li><a href="">Link 1</a></li>
						<li><a href="">Link 2</a></li>
						<li><a href="">Link 3</a></li>
						<li><a href="">Link 4</a></li>
					</ul>
				</div>

				<div class="col-md-3 col-lg-2 col-xl-2 mx-auto">
					<h5>Others links</h5>
					<hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
					<ul class="list-unstyled">
						<li><a href="">Link 1</a></li>
						<li><a href="">Link 2</a></li>
						<li><a href="">Link 3</a></li>
						<li><a href="">Link 4</a></li>
					</ul>
				</div>

				<div class="col-md-4 col-lg-3 col-xl-3">
					<h5>Contact</h5>
					<hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
					<ul class="list-unstyled">
						<li><i class="fa fa-home mr-2"></i> My company</li>
						<li><i class="fa fa-envelope mr-2"></i> email@example.com</li>
						<li><i class="fa fa-phone mr-2"></i> + 33 12 14 15 16</li>
						<li><i class="fa fa-print mr-2"></i> + 33 12 14 15 16</li>
					</ul>
				</div>
				<div class="col-12 copyright mt-3">
					<p class="float-left">
						<a href="#">Back to top</a>
					</p>
					<p class="text-right text-muted">
						created with <i class="fa fa-heart"></i> by <a
							href="https://t-php.fr/43-theme-ecommerce-bootstrap-4.html"><i>t-php</i></a>
						| <span>v. 1.0</span>
					</p>
				</div>
			</div>
		</div>
	</footer>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>