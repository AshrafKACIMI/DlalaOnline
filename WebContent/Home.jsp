<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@page import="java.security.MessageDigest" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="WebRessources/css/bootstrap.min.css" rel="stylesheet">
    <link href="WebRessources/css/font-awesome.min.css" rel="stylesheet">
    <link href="WebRessources/css/prettyPhoto.css" rel="stylesheet">
    <link href="WebRessources/css/price-range.css" rel="stylesheet">
    <link href="WebRessources/css/animate.css" rel="stylesheet">
	<link href="WebRessources/css/main.css" rel="stylesheet">
	<link href="WebRessources/css/responsive.css" rel="stylesheet">	
	<title>Dlala | Home</title>
</head>


<body>
		
		<%
			if (request.getParameter("logout") != null){
				ESAPI.authenticator().getCurrentUser().logout();
				System.out.println("HAHAHAA");
			}
			
			if (request.getParameter("logout") == "true"){
				ESAPI.authenticator().getCurrentUser().logout();
				System.out.println("HOHOHO");
			}
				
		%>

<%@include file="header.jsp" %>
	
	<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">

					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<h1><span>D'lala</span>-Online</h1>
									<h2>Consoles</h2>
									<p>Amateurs de jeux vidéos, trouvez votre bonheur ici, avec consoles neuves et occasions </p>
								</div>
								<div class="col-sm-6">
									<img src="WebRessources/images/home/games.jpg" class="girl img-responsive" alt="" style = "height:320px;"/>
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<h1><span>D'lala</span>-Online</h1>
									<h2>Voitures</h2>
									<p>Ou si vous le préférez, vous pouvez acheter des voitures, seul loisir en Algérie... </p>
								</div>
								<div class="col-sm-6">
									<img src="WebRessources/images/home/cars.jpg" class="girl img-responsive" alt="" style = "height:320px;"/>
									</div>
							</div>
							
							<div class="item">
								<div class="col-sm-6">
									<h1><span>D'lala</span>-Online</h1>
									<h2>Laptops</h2>
									<p>Que ce soit pour le travail ou pour le loisir, une large panoplie de PCs vous est offerte </p>
								</div>
								<div class="col-sm-6">
									<img src="WebRessources/images/home/laptops.jpg" class="girl img-responsive" alt=""  style = "height:320px;"/>
									</div>
							</div>
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>

				</div>
			</div>
		</div>
	</section>

	<section style="margin-top:10%;">
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<img src="WebRessources/images/home/shipping.jpg" />
					</div>	
				</div>
				
	<div class="col-sm-9 padding-right">
		<div class="features_items"><!--features_items-->
			<h2 class="title text-center">Annonces actuelles</h2>
			
<%

	Connection con = null;
	

	String url = "jdbc:mysql://localhost:3306/";
	String startlineProduct = "";
	String db = "dlala";
	String driver = "com.mysql.jdbc.Driver";
	String userName ="root";
	String password="P@ssw0rd";
	String filter = request.getParameter("filter");
	Statement st;
	String query;
	
	try{
		Class.forName(driver).newInstance();
		con = DriverManager.getConnection(url+db,userName,password);
		
		if (filter==null)
			query = "select * from produit";
		else
			query = "select * from produit WHERE libele LIKE ?";
		
		 
		 PreparedStatement pstmt = con.prepareStatement( query );
		 if (filter != null)
			 pstmt.setString(1, "%" + filter + "%"); 
		 
		//st = con.createStatement();
		//ResultSet rs = st.executeQuery(query);
		ResultSet rs = pstmt.executeQuery();
		%>
		<%
		while(rs.next()){
		String img_url = "WebRessources/images/icons/" + rs.getString(4) + ".png";
		String order_url = "Order.jsp?id="+rs.getString(1);
		%>
		<div class="col-sm-4">
				<div class="product-image-wrapper" ">
					<div class="single-products">
						<div class="productinfo text-center">
							<img src=<%=img_url%> alt="" " style="height: 300px;"/>
							<h2><%out.println(rs.getString(3));%>DZA</h2>
							<p><%out.println(rs.getString(2));%></p>
								<a href="Order.jsp?id="<%=rs.getString(1)%> class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Acheter</a>
						</div>
						
						<div class="product-overlay">
							<div class="overlay-content">
								<h2>$<%out.println(rs.getString(3));%>DZA</h2>
								<p><%out.println(rs.getString(2));%></p>
								<a href=<%=order_url%> class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Acheter</a>
							</div>
						</div>
					</div>
					<div class="choose">
						<ul class="nav nav-pills nav-justified">
							<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
							<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
						</ul>
					</div>
				</div>
		</div>
		
		<%
		}
	%>
	<%
	}
	catch(Exception e){
		e.printStackTrace();
	}
	%>
	

		</div>
	</div>
						
	</div><!--features_items-->
	
					
	</div>
			
	</section>
	
		<%@include file="footer.jsp" %>
					

</body>
</html>