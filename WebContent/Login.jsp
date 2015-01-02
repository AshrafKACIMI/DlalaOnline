<%@page import="org.owasp.esapi.errors.AuthenticationException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@page import="org.owasp.esapi.*"%>
<%@page import="org.owasp.esapi.ESAPI"%>




 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="WebRessources/css/bootstrap.min.css" rel="stylesheet">
<!--     <link href="WebRessources/css/font-awesome.min.css" rel="stylesheet"> -->
    <link href="WebRessources/css/prettyPhoto.css" rel="stylesheet">
    <link href="WebRessources/css/price-range.css" rel="stylesheet">
    <link href="WebRessources/css/animate.css" rel="stylesheet">
	<link href="WebRessources/css/main.css" rel="stylesheet">
	<link href="WebRessources/css/responsive.css" rel="stylesheet">	
	<title>Dlala | Login</title>
</head>

<body>


	<header id="header"><!--header-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="Home.jsp"><img src="WebRessources/images/home/logo.png" alt="" style = "height:100px;"/></a>
						</div>
						
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="checkout.html"><i class="fa fa-crosshairs"></i> Checkout</a></li>
								<li><a href="cart.html"><i class="fa fa-shopping-cart"></i> Cart</a></li>
								<li><a href="Login.jsp"><i class="fa fa-lock"></i> Login</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="Home.jsp" class="active">Home</a></li>
								<li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="shop.html">Products</a></li>
										<li><a href="product-details.html">Product Details</a></li> 
										<li><a href="checkout.html">Checkout</a></li> 
										<li><a href="cart.html">Cart</a></li> 
										<li><a href="login.html">Login</a></li> 
                                    </ul>
                                </li> 
								<li class="dropdown"><a href="#">Blog<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="blog.html">Blog List</a></li>
										<li><a href="blog-single.html">Blog Single</a></li>
                                    </ul>
                                </li> 
								<li><a href="404.html">404</a></li>
								<li><a href="contact-us.html">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box pull-right">
<!-- 							<input type="text" placeholder="Search"/> -->
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->

	
	<section id="form" style="margin-top:5%;"><!--form-->
		<div class="container"  >
		<%
			if (request.getParameter("userMessage")!=null)
				out.println("<h3>"+ESAPI.encoder().encodeForHTML(request.getParameter("userMessage"))+"</h3>");
		
			if (request.getParameter("logMessage")!=null)
			out.println("<h3>"+ESAPI.encoder().encodeForHTML(request.getParameter("logMessage"))+"</h3>");
	
		
		
		%>
		
		<%
			//ESAPI.authenticator().getUser("salim").enable();
			if (request.getParameter("userMessage")!=null){%>
			 <h3> <%= ESAPI.encoder().encodeForHTML(request.getAttribute("userMessage").toString())%></h3>
		<%} %>
		

			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Login to your account</h2>
						<form action="Home.jsp" method=POST>
							<input type="text" placeholder="Username" name="username"/>
							<input type="password" placeholder="Password" name = "password"/>
<!-- 							<span> -->
<!-- 								<input type="checkbox" class="checkbox">  -->
<!-- 								Keep me signed in -->
<!-- 							</span> -->
							<button type="submit" class="btn btn-default">Login</button>
						</form>
					</div><!--/login form-->
					
					
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>New User Signup!</h2>
						<form action="Login.jsp" method=POST>
							<input type="text" placeholder="Username" name="userNameSign"/>
							<input type="password" placeholder="Password" name="password1"/>
							<input type="password" placeholder="Confirm Password" name="password2"/>
							<input type="text" placeholder="Adresse" name="adresse"/>
							<button type="submit" class="btn btn-default">Signup</button>
						</form>
						<% 
								
								if (request.getParameter("userNameSign")!=null && request.getParameter("password1") != null
										&& request.getParameter("password2") != null){
									
									try {
										User newUser = ESAPI.authenticator().createUser(request.getParameter("userNameSign")
												, request.getParameter("password1"), request.getParameter("password2"));
										newUser.enable();
										newUser.unlock();
										
										Connection con = null;
										String url = "jdbc:mysql://localhost:3306/";
										String startlineProduct = "";
										String db = "dlala";
										String driver = "com.mysql.jdbc.Driver";
										String userNameSign ="root";
										String password="P@ssw0rd";
										
										Statement st;
										String query = "INSERT INTO users(username, adresse) VALUE(?, ?)";
										try{
											Class.forName(driver).newInstance();
											con = DriverManager.getConnection(url+db,userNameSign,password);
											PreparedStatement pstmt = con.prepareStatement( query );
											pstmt.setString(1, request.getParameter("userNameSign"));
										 	pstmt.setString(2, request.getParameter("adresse"));
								 			pstmt.execute();
								 		
										}catch(Exception e){
											e.printStackTrace();
										}
											 
									}
									
									catch( AuthenticationException e ) {
										request.setAttribute("userMessage", e.getUserMessage() );
										request.setAttribute("logMessage", e.getLogMessage() );		
										System.out.println(e.getUserMessage());
										//e.printStackTrace();
									} catch( Exception e){
										request.setAttribute("userMessage", e.getMessage());
										//e.printStackTrace();
									}

									
								}
								
							
						%>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->

	<%@include file="footer.jsp" %>
	


</body>
</html>