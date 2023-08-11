<%@page import="Model.Product"%>
<%@page import="Model.User"%>
<%@page import="Dao.wishlistDao"%>
<%@page import="Model.Wishlist"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="wishlistDao" class="Dao.wishlistDao" scope="application" />
 <jsp:useBean id="productDao" class="Dao.productDao" scope="application" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Danh sách sản phẩm yêu thích</title>

    <!-- Google font -->
    <link
      href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
      rel="stylesheet"
    />

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css/slick.css" />
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    
    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css" />

  
  </head>
  <body>
    <jsp:include page="header.jsp"></jsp:include>

    <!-- NAVIGATION -->
    <nav id="navigation">
      <!-- container -->
      <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
          <!-- NAV -->
          <ul class="main-nav nav navbar-nav">
           <li ><a href="index.jsp">Trang chủ</a></li>
            <li><a href="store">Tất cả sản phẩm</a></li>
            <li><a href="shoeArtifical">Giày cỏ nhân tạo</a></li>
              <li><a href="shoeFutsal">Giày Futsal</a></li>
            <li><a href="contact.jsp">Liên hệ</a></li>
          </ul>
          <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
      </div>
      <!-- /container -->
    </nav>
    <!-- /NAVIGATION -->

    <!-- BREADCRUMB -->
    <div id="breadcrumb" class="section">
      <!-- container -->
      <div class="container">
        <!-- row -->
        <div class="row">
          <div class="col-md-12">
            <ul class="breadcrumb-tree">
              <li><a href="index.jsp">Trang chủ</a></li>
              <li class="active">Danh sách sản phẩm yêu thích</li>
            </ul>
          </div>
        </div>
        <!-- /row -->
      </div>
      <!-- /container -->
    </div>
    <!-- /BREADCRUMB -->

    <!-- SECTION -->
    <div class="section">
      <!-- container -->
      <div class="container">
        <!-- row -->
        <div class="row">
        
          <!-- STORE -->
          <div id="store" class="col-md-12">
            
            <!-- store products -->
            <div class="row">
            
            <%
        User user = (User) session.getAttribute("user");
        List<Wishlist> wishlists = null;
        if(user != null){
        	 wishlists = wishlistDao.getListWishlistByUser(user.getId());
        }
        int cu =0;
        if(wishlists != null){
        for(Wishlist wishlist : wishlists){
        	cu++;
        	Product product = productDao.getProductWishlist(wishlist.getProduct_id());
        %>
              <!-- product -->
              <div class="col-md-3 col-xs-6">
                <div class="product">
                  <div class="product-img">
                    <img src="<%=product.getThumbnail()%>" alt="" />
                    <div class="product-label">
                      
                      <span class="new">NEW</span>
                    </div>
                  </div>
                  <div class="product-body">
                    <p class="product-category"><%=productDao.getNameCategory(product.getCategory_id()) %></p>
                    <h3 class="product-name">
                    <%if(product.getQuantity() > 0 && product.getStatus() == 0){ %>
                      <a href="inforDatailServlet?id=<%=product.getId()%>"><%=product.getName()%></a>
                      <%}else{ %>
                      <a ><%=product.getName()%>. <span style="color: red;"> Tạm hết hàng</span></a>
                      <%} %>
                        
                    </h3>
                    <h4 class="product-price">
                      <%=new java.text.DecimalFormat("#,###").format(product.getDiscount())%> <del class="product-old-price"> <%=new java.text.DecimalFormat("#,###").format(product.getPrice())%></del>
                    </h4>
                    <div class="product-rating">
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                    </div>
                  
                  </div>
                  <div class="add-to-cart">
                  
                  <%if(product.getQuantity() > 0 && product.getStatus() == 0){ %>
                   <form action="addOrderServlet" method="post">
                       <input type="hidden" value="<%=product.getId()%>" name = 'idproductcart'>
                     <button class="add-to-cart-btn" style="border-radius: 0px !important;">
                      <i class="fa fa-shopping-cart"></i> Thêm giỏ hàng
                    </button>
                   </form> 
                  <%}else{ %>
                       <input type="hidden" value="<%=product.getId()%>" name = 'idproductcart'>
                     <button class="add-to-cart-btn" style="border-radius: 0px !important;">
                      <i class="fa fa-shopping-cart"></i> Hết hàng
                    </button>
                  <%} %>
                  
                  
                  </div>
                </div>
              </div>
              <!-- /product -->
             
			<%} 
        }%>
             

             
            </div>
            <!-- /store products -->

           
          </div>
          <!-- /STORE -->
        </div>
        <!-- /row -->
      </div>
      <!-- /container -->
    </div>
    <!-- /SECTION -->

    <!-- NEWSLETTER -->
    <div id="newsletter" class="section">
      <!-- container -->
      <div class="container">
        <!-- row -->
        <div class="row">
          <div class="col-md-12">
            <div class="newsletter">
              <p>Sign Up for the <strong>NEWSLETTER</strong></p>
              <form>
                <input
                  class="input"
                  type="email"
                  placeholder="Enter Your Email"
                />
                <button class="newsletter-btn">
                  <i class="fa fa-envelope"></i> Subscribe
                </button>
              </form>
              <ul class="newsletter-follow">
                <li>
                  <a href="#"><i class="fa fa-facebook"></i></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-twitter"></i></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-instagram"></i></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-pinterest"></i></a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <!-- /row -->
      </div>
      <!-- /container -->
    </div>
    <!-- /NEWSLETTER -->

    <!-- FOOTER -->
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- /FOOTER -->

    <!-- jQuery Plugins -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
