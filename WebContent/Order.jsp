<%@ page import="java.sql.*" %>
 
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
	<title>Dlala | Login</title>
</head>

<body>

		<%@include file="header.jsp" %>
	
	

		<% 

		
		
		Connection con = null;
		
		String url = "jdbc:mysql://localhost:3306/";
		String startlineProduct = "";
		String db = "dlala";
		String driver = "com.mysql.jdbc.Driver";
		String userName ="root";
		String password="P@ssw0rd";
		String id = request.getParameter("id");
		Statement st;
		String query;
		try{
			Class.forName(driver).newInstance();
			con = DriverManager.getConnection(url+db,userName,password);
			if (request.getParameter("productID") != null){
				query = "INSERT INTO commandes(idUser, idProduit, dateAchat) VALUES((SELECT idUser from users where "+
							"username='"+ESAPI.authenticator().getCurrentUser().getAccountName()+"'),?, SYSDATE())";
				System.out.println(query);
				PreparedStatement pstmt = con.prepareStatement( query );
				pstmt.setString(1, request.getParameter("productID"));
				pstmt.execute();
			}
			query = "select * from produit WHERE idProduit = "+id;
			st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			%>
			<%
			while(rs.next()){ //executée une seule fois
			String img_url = "WebRessources/images/icons/" + rs.getString(4) + ".png";
			%>
			
			<section style="margin-top:5%;">
				<div class="container">
					<div class="row">
						<div class="col-sm-3">
						</div>
			
							<div class="col-sm-9 padding-right">
							<div class="product-details"><!--product-details-->
								<div class="col-sm-5">
									<div class="view-product">
										<img src=<%=img_url%> alt=""  style="height: 300px;"/>
									</div>
								</div>
								<div class="col-sm-7">
									<div class="product-information"><!--/product-information-->
										<img src="images/product-details/new.jpg" class="newarrival" alt="" />
										<h2><%= rs.getString(2)%></h2>
										<img src="WebRessources/images/product-details/rating.png" alt="" />
										
										<p>Code produit: <%=rs.getString(1) %></p>
											<span>
												<span><%=rs.getString(3)%> DZA</span>
											</span>
											<span>
												<label>Code CB</label>
												<input type="text" value="5214129141234567" style="width:250px;"/>

											</span>
											<span style="alignement:center;">
											<form method=POST>
											  <input type="HIDDEN" name="productID" value=<%=rs.getString(1)%>>
											  <input type="hidden" name="ctoken" value=<%= ESAPI.httpUtilities().getCSRFToken() %>>
												<button type="submit" class="btn btn-fefault cart">
												<i class="fa fa-shopping-cart"></i>
												Acheter
												</button>											  
											
											</form>

											</span>											
											<p><b>Disponibilite:</b> En Stock</p>
											<p><b>Condition:</b> Neuf</p>
											<p><b>Vendeur:</b> Local</p>
											<a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a>
								</div><!--/product-information-->
							</div>
						</div><!--/product-details-->
					</div>
				</div>
			</div>
		</section>
					
				
			<%
			}
		%>
		<%
		}
		catch(Exception e){
			e.printStackTrace();
		}

		
		%>
	
	
<!-- 							<div id="similar-product" class="carousel slide" data-ride="carousel"> -->
								
<!-- 								  Wrapper for slides -->
<!-- 								    <div class="carousel-inner"> -->
<!-- 										<div class="item active"> -->
<!-- 										  <a href=""><img src="images/product-details/similar1.jpg" alt=""></a> -->
<!-- 										  <a href=""><img src="images/product-details/similar2.jpg" alt=""></a> -->
<!-- 										  <a href=""><img src="images/product-details/similar3.jpg" alt=""></a> -->
<!-- 										</div> -->
<!-- 										<div class="item"> -->
<!-- 										  <a href=""><img src="images/product-details/similar1.jpg" alt=""></a> -->
<!-- 										  <a href=""><img src="images/product-details/similar2.jpg" alt=""></a> -->
<!-- 										  <a href=""><img src="images/product-details/similar3.jpg" alt=""></a> -->
<!-- 										</div> -->
<!-- 										<div class="item"> -->
<!-- 										  <a href=""><img src="images/product-details/similar1.jpg" alt=""></a> -->
<!-- 										  <a href=""><img src="images/product-details/similar2.jpg" alt=""></a> -->
<!-- 										  <a href=""><img src="images/product-details/similar3.jpg" alt=""></a> -->
<!-- 										</div> -->
										
<!-- 									</div> -->

<!-- 								  Controls -->
<!-- 								  <a class="left item-control" href="#similar-product" data-slide="prev"> -->
<!-- 									<i class="fa fa-angle-left"></i> -->
<!-- 								  </a> -->
<!-- 								  <a class="right item-control" href="#similar-product" data-slide="next"> -->
<!-- 									<i class="fa fa-angle-right"></i> -->
<!-- 								  </a> -->
<!-- 							</div> -->

		<%@include file="footer.jsp" %>

						
</body>
</html>