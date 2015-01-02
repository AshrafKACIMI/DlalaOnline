<%@page import="org.owasp.esapi.tags.EncodeForURLTag"%>
<%@page import="org.owasp.esapi.errors.AuthenticationException"%>
<%@page import="org.owasp.esapi.*"%>

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
								<li>
								<a href="checkout.html"><i class="fa fa-crosshairs"></i> 
											<% 
				
				if (request.getParameter("username")!=null && request.getParameter("password")!=null){
					ESAPI.httpUtilities().setCurrentHTTP(request, response);
					try{
						ESAPI.authenticator().login(request, response);
						ESAPI.httpUtilities().changeSessionIdentifier();
					} catch( AuthenticationException e ) {
						request.setAttribute("userMessage", e.getUserMessage() );
						request.setAttribute("logMessage", e.getLogMessage() );
						//ESAPI.httpUtilities().sendRedirect((ESAPI.encoder().encodeForURL(("Login.jsp"))));
						e.printStackTrace();
					} catch( Exception e){
						request.setAttribute("userMessage", e.getMessage());
						e.printStackTrace();
					}
				
				}
											
			%>
			<%
				if (ESAPI.authenticator().getCurrentUser().getAccountName().compareTo("Anonymous")!=0){
					%><i >
					<%="Hello "+ESAPI.authenticator().getCurrentUser().getAccountName() %>
					</i>
					<%	
			%>
								</a>
								</li>
								<li><a href="History.jsp"><i class="fa fa-shopping-cart"></i> Achats</a></li>
				<%
				} 
				%>
<%-- 				<% --%>
<!--  				if (ESAPI.authenticator().getCurrentUser().getAccountName().compareTo("Anonymous")!=0){ -->
<%-- 					%><i class="fa fa-shopping-cart"> --%>
<%-- 					<%="Hello "+ESAPI.authenticator().getCurrentUser().getAccountName() %> --%>
<!-- 					<li><a href="Home.jsp"><i class="fa fa-lock"></i> Login</a></li> -->
<!-- 					</i> -->
<%-- 				<%	 --%>
<!-- 			} -->
				
<%-- 			%> --%>
					<%if (ESAPI.authenticator().getCurrentUser().getAccountName().compareTo("Anonymous")!=0){
					%>
					<form action="Home.jsp" method = POST name="logoutForm" id="logoutForm">
					<input type="hidden" name="logout" value="true" >
					<li><button type="submit" class="btn btn-default"> Logout</button></li>
		
					</form>
					<%}else{
						%>
						<li><a href="Login.jsp"><i class="fa fa-lock"></i> Login</a></li>
					<%} %>
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
							<form METHOD=POST action= "Home.jsp">
								<div  style="overflow:hidden;">
									<input type="text" name = "filter" style="float:left;margin: 0 auto;"/>
									<input type = "submit" value = "Rechercher" class = "btn btn-default add-to-cart" style="float:left;;margin: 0 auto;">
								</div>
							</form>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->
