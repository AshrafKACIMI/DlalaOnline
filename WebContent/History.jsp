<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@page import="java.security.MessageDigest" %>
 
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
	<title>Dlala | Home</title>
</head>


<body>

		<%@include file="header.jsp" %>
		<section id="cart_items">
			<div class="container">
				<div class="breadcrumbs">
					<ol class="breadcrumb">
					  <li><a href="#">Home</a></li>
					  <li class="active">Shopping Cart</li>
					</ol>
				</div>
				<div class="table-responsive cart_info">
					<table class="table table-condensed">
						<thead>
							<tr class="cart_menu">
								<td class="image">Item</td>
								<td class="description"></td>
								<td class="price">Price</td>
								<td class="quantity">Quantity</td>
								<td class="total">Total</td>
								<td></td>
							</tr>
						</thead>
						
						
		<%

	Connection con = null;
	

	String url = "jdbc:mysql://localhost:3306/";
	String db = "dlala";
	String driver = "com.mysql.jdbc.Driver";
	String userName ="root";
	String password="P@ssw0rd";
	String user = ESAPI.authenticator().getCurrentUser().getAccountName();
	String query;
	
	try{
		Class.forName(driver).newInstance();
		con = DriverManager.getConnection(url+db,userName,password);
		
		query = "SELECT idProduit, libele, prix, dateAchat, type from (SELECT idProduit, idUser, dateAchat from commandes where idUser=(SELECT idUser from users where LOWER(username)='"+user+"')) AS A join produit USING(idProduit);";
		 
		 PreparedStatement pstmt = con.prepareStatement( query );
		 System.out.println(user);
		 System.out.println(query);
		//st = con.createStatement();
		//ResultSet rs = st.executeQuery(query);
		ResultSet rs = pstmt.executeQuery();
		%>
		
		<%
		while(rs.next()){
		String img_url = "WebRessources/images/icons/" + rs.getString(5) + ".png";
		String order_url = "Order.jsp?id="+rs.getString(1);
		%>
		
						
						<tr>
							<td class="cart_product">
								<a href=""><img src=<%= img_url %> alt="" style="height:100px;width:100px;"></a>
							</td>
							<td class="cart_description">
								<h4><a href=<%=order_url %>><%=rs.getString(2) %></a></h4>
								<p>ID Produit:<%=rs.getString(1) %></p>
							</td>
							<td class="cart_price">
								<p><%=rs.getString(3) %></p>
							</td>
							
							
							<td class="cart_total">
								<p class="cart_total_price"><%=rs.getString(4) %></p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
							</td>
						</tr>
		
		<%
			}
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		%>

<%-- 		<%@include file="footer.jsp" %>	 --%>
	
	

</body>
</html>