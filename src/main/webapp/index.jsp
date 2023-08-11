<%@page import="Model.User"%>
<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="reviewDao" class="Dao.reviewDao" scope="application" />
<jsp:useBean id="productDao" class="Dao.productDao" scope="application" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Cửa hàng bán Giày uy tín</title>

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



    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css" />

   <style type="text/css">
      #hot-deal.section {
        background-image: url("img/h.jpg") !important;
        
      }
   </style>

  </head>
  
  <body>
   
    <jsp:include page="header.jsp"></jsp:include>
    
   
    
   
   
  
     <div class="modal fade" id="modalConcact" role="dialog" style="background-color: transparent;">
      <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:blue;">
          Thông báo</h4>
        </div> 
          
          <div class="modal-body">
			 Liên hệ thành công. Chúng tôi sẽ liên hệ lại sớm nhất.
			</div>
           
      </div>
      
    </div>
  </div>
  
  <div class="modal fade" id="modaLikeFail" role="dialog" style="background-color: transparent;">
      <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content" style="background-color:red; ">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:white;">Sản phẩm đã tồn tại</h4>
        </div>    
      </div>
      
    </div>
  </div>
 

    
    <!-- NAVIGATION -->
    <nav id="navigation">
      <!-- container -->
      <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
          <!-- NAV -->
          <ul class="main-nav nav navbar-nav">
            <li class="active"><a href="index.jsp">Trang chủ</a></li>
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

    <!-- SECTION banner -->

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
              <!-- Indicators -->
              <ol class="carousel-indicators">
                <li
                  data-target="#myCarousel"
                  data-slide-to="0"
                  class="active"
                ></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
              </ol>

              <!-- Wrapper for slides -->
              <div class="carousel-inner">
                <div class="item active">
                <a href="inforDatailServlet?id=1"><img
                    src="img/banner1.jpg"
                    alt="gaming"
                    style="width: 100%; height: 100%"
                  />
                   <div class="carousel-caption">
                    <h3 style="color: white; font-size: 30px">
                     Giày Crazy Rush
                    </h3>
                  </div>
                  </a>
                  
                 
                </div>

                <div class="item">
                 <a href="store">
                  <img
                    src="img/banner3.jpg"
                    alt="asus"
                    style="width: 100%; height: 100%"
                  />
                  <div class="carousel-caption">
                    <h3 style="color: white; font-size: 30px">
                      Bộ sưu tập giày mới nhất
                    </h3>
                  </div>
                  </a>
                 
                </div>

                <div class="item">
                   <a href="shoeFutsal">
                   <img
                    src="img/banner4.jpg"
                    alt="New York"
                    style="width: 100%; height: 100%"
                  />
                  <div class="carousel-caption">
                    <h3 style="color: white; font-size: 30px">Giày Futsal mới nhất</h3>
                  </div>
                  </a>
                  
                </div>
              </div>

              <!-- Left and right controls -->
              <a
                class="left carousel-control"
                href="#myCarousel"
                data-slide="prev"
              >
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a
                class="right carousel-control"
                href="#myCarousel"
                data-slide="next"
              >
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- /SECTION -->
    
    

    <!-- start features Area -->
    <section class="features-area section_gap">
      <div class="container">
        <div class="row features-inner">
          <!-- single features -->
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="single-features">
              <div class="f-icon">
                <img src="img/features/f-icon1.png" alt="" />
              </div>
              <h6>Miễn phí vận chuyển</h6>
              <p>Miễn phí giao hàng tận nơi</p>
            </div>
          </div>
          <!-- single features -->
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="single-features">
              <div class="f-icon">
                <img src="img/features/f-icon2.png" alt="" />
              </div>
              <h6>Hoàn trả</h6>
              <p>Chính sách đổi trả</p>
            </div>
          </div>
          <!-- single features -->
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="single-features">
              <div class="f-icon">
                <img src="img/features/f-icon3.png" alt="" />
              </div>
              <h6>Hỗ trợ 24/7</h6>
              <p>Luôn hỗ trợ nhiệt tình</p>
            </div>
          </div>
          <!-- single features -->
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="single-features">
              <div class="f-icon">
                <img src="img/features/f-icon4.png" alt="" />
              </div>
              <h6>Thanh toán bảo mật</h6>
              <p>Bảo mật giao dịch</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- end features Area -->



    <!-- SECTION -->
    <div class="section">
      <!-- container -->
      <div class="container">
        <!-- row -->
        <div class="row">
          <!-- section title -->
          <div class="col-md-12">
            <div class="section-title">
              <h3 class="title">Những sản phẩm mới nhất</h3>
            </div>
          </div>
          <!-- /section title -->

          <!-- Products tab & slick -->
          <div class="col-md-12">
            <div class="row">
              <div class="products-tabs">
                <!-- tab -->
                <div id="tab1" class="tab-pane active">
                  <div class="products-slick" data-nav="#slick-nav-1">
                  
               <% List<Product> products = productDao.getListProductNew();
               if(!products.isEmpty()){
              	 for(Product product : products) {%>
                    <!-- product -->
                    
                    <div class="product">
                      <div class="product-img">
                        <img src="<%=product.getThumbnail()%>" alt="" />
                        <div class="product-label">
                          <span class="new">Mới</span>
                        </div>
                      </div>
                      <div class="product-body">
                        <p class="product-category"><%=productDao.getNameCategory(product.getCategory_id()) %></p>
                        <h3 class="product-name">
                          <a href="inforDatailServlet?id=<%=product.getId()%>"><%=product.getName()%></a>
                        </h3>
                        <h4 class="product-price">
                          <%=new java.text.DecimalFormat("#,###").format(product.getDiscount())%> <del class="product-old-price">
                           <%=new java.text.DecimalFormat("#,###").format(product.getPrice())%></del>
                        </h4>
                       
                        
                        <%   float avg = reviewDao.getAVGReview(product.getId()); %>
                 
                 
                 <%if(avg == 0){ %>
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                          </div>
                         <%} %>
                 
                 <%if(avg > 0 && avg < 2){ %>
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                          <%if(avg >= 2 && avg <3){ %>
                          <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                          <%if(avg>=3 && avg <4){ %>
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                          <%if(avg >=4 && avg < 5){ %>
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                         <%if(avg ==5){ %>
                          <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                          </div>
                         <%} %>
                        <div class="product-btns">
                        
                         <%User user = (User) session.getAttribute("user");
                          if(user != null){ %>
                           <button class="add-to-wishlist" onclick="addToWishlist(<%=product.getId()%>)">
                            <i class="fa fa-heart-o"></i
                            ><span class="tooltipp">Yêu thích</span>
                          </button>
                          <%} %>
                        <% if(user == null){ %>
                           <button class="add-to-wishlist" onclick="redirectToLogin()">
                            <i class="fa fa-heart-o"></i
                            ><span class="tooltipp">Yêu thích</span>
                          </button>
                          <%} %>  
                          
                          <button class="add-to-compare">
                            <i class="fa fa-exchange"></i
                            >
                          </button>
                          
                          <button class="quick-view">
                          <a href="inforDatailServlet?id=<%=product.getId()%>"><i class="fa fa-eye"></i
                            ><span class="tooltipp">Xem sản phẩm</span></a>
   
                          </button>
                        </div>
                      </div>
                      <%
                       if(user == null){ %>
                    	       <div class="add-to-cart">
                       
                        <button class="add-to-cart-btn" onclick="redirectToLogin()" style="border-radius: 0px !important;">
                         <i class="fa fa-shopping-cart"></i> Thêm giỏ hàng
                        </button>
                      </div>
                      <% }
                      %>
                      
                      <%if(user != null){ %>
                      <form action="addOrderServlet" method="post">
                      <div class="add-to-cart">
                        <input type="hidden" value="<%=product.getId()%>" name = 'idproductcart'>
                        <button class="add-to-cart-btn" type="submit" style="border-radius: 0px !important;">
                         <i class="fa fa-shopping-cart"></i> Thêm giỏ hàng
                        </button>
                      </div>
                      </form>
                      <%} %>
                    </div>
                    <!-- /product -->
             <%}
             }
             %>
             
             
             <% List<Product> productnear = productDao.getListProductNearest();
             if(products.isEmpty()){
              	 for(Product product : productnear) {%>
                    <!-- product -->
                    
                    <div class="product">
                      <div class="product-img">
                        <img src="<%=product.getThumbnail()%>" alt="" />
                        <div class="product-label">
                          <span class="new">Mới</span>
                        </div>
                      </div>
                      <div class="product-body">
                        <p class="product-category"><%=productDao.getNameCategory(product.getCategory_id()) %></p>
                        <h3 class="product-name">
                          <a href="inforDatailServlet?id=<%=product.getId()%>"><%=product.getName()%></a>
                        </h3>
                        <h4 class="product-price">
                          <%=new java.text.DecimalFormat("#,###").format(product.getDiscount())%> <del class="product-old-price">
                           <%=new java.text.DecimalFormat("#,###").format(product.getPrice())%></del>
                        </h4>
                        
                     
                        
                      <%   float av = reviewDao.getAVGReview(product.getId()); %>
               
                <%if(av == 0){ %>
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                          </div>
                         <%} %>
                 
                 <%if(av > 0 && av < 2){ %>
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                          <%if(av >= 2 && av <3){ %>
                          <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                          <%if(av>=3 && av <4){ %>
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                          <%if(av >=4 && av < 5){ %>
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                         <%if(av ==5){ %>
                          <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                          </div>
                         <%} %>
                        <div class="product-btns">
                          
                          <%User user = (User) session.getAttribute("user");
                          if(user != null){ %>
                           <button class="add-to-wishlist" onclick="addToWishlist(<%=product.getId()%>)">
                            <i class="fa fa-heart-o"></i
                            ><span class="tooltipp">Yêu thích</span>
                          </button>
                          <%} %>
                        <% if(user == null){ %>
                           <button class="add-to-wishlist" onclick="redirectToLogin()">
                            <i class="fa fa-heart-o"></i
                            ><span class="tooltipp">Yêu thích</span>
                          </button>
                          <%} %>  
                          
                          <button class="add-to-compare">
                            <i class="fa fa-exchange"></i
                            >
                          </button>
                          <button class="quick-view">
                          <a href="inforDatailServlet?id=<%=product.getId()%>"><i class="fa fa-eye"></i
                            ><span class="tooltipp">Xem sản phẩm</span></a>
   
                          </button>
                        </div>
                      </div>
                      <%
                       if(user == null){ %>
                    	       <div class="add-to-cart">
                       
                        <button class="add-to-cart-btn" onclick="redirectToLogin()" style="border-radius: 0px !important;">
                         <i class="fa fa-shopping-cart"></i> Thêm giỏ hàng
                        </button>
                      </div>
                      <% }
                      %>
                      
                      <%if(user != null){ %>
                      <form action="addOrderServlet" method="post">
                      <div class="add-to-cart">
                        <input type="hidden" value="<%=product.getId()%>" name = 'idproductcart'>
                        <button class="add-to-cart-btn" type="submit" style="border-radius: 0px !important;">
                         <i class="fa fa-shopping-cart"></i> Thêm giỏ hàng
                        </button>
                      </div>
                      </form>
                      <%} %>
                      
                    </div>
                    <!-- /product -->
             <%}
             }%>
              
             
                   
                  </div>
                  <div id="slick-nav-1" class="products-slick-nav"></div>
                </div>
                <!-- /tab -->
              </div>
            </div>
          </div>
          <!-- Products tab & slick -->
        </div>
        <!-- /row -->
      </div>
      <!-- /container -->
    </div>
    <!-- /SECTION -->

    <!-- HOT DEAL SECTION -->
    <div id="hot-deal" class="section">
      <!-- container -->
      <div class="container">
        <!-- row -->
        <div class="row">
          <div class="col-md-12">
            <div class="hot-deal">
              <ul class="hot-deal-countdown" id="countdown">
                <li>
                  <div>
                    <h3 id="days">02</h3>
                    <span>Ngày</span>
                  </div>
                </li>
                <li>
                  <div>
                    <h3 id="hours">10</h3>
                    <span>Giờ</span>
                  </div>
                </li>
                <li>
                  <div>
                    <h3 id="minutes">34</h3>
                    <span>Phút</span>
                  </div>
                </li>
                <li>
                  <div>
                    <h3 id="seconds">60</h3>
                    <span>Giây</span>
                  </div>
                </li>
              </ul>
              <h2 class="text-uppercase">Giảm giá mạnh tuần này</h2>
              <p>Bộ sưu tập mới giảm giá tới 50% </p>
              <a class="primary-btn cta-btn" href="store">Truy cập ngay</a>
            </div>
          </div>
        </div>
        <!-- /row -->
      </div>
      <!-- /container -->
    </div>
    <!-- /HOT DEAL SECTION -->



    <!-- SECTION -->
    <div class="section">
      <!-- container -->
      <div class="container">
        <!-- row -->
        <div class="row">
          <!-- section title -->
          <div class="col-md-12">
            <div class="section-title">
              <h3 class="title">Top sản phẩm được mua nhiều nhất</h3>
            </div>
          </div>
          <!-- /section title -->

          <!-- Products tab & slick -->
          <div class="col-md-12">
            <div class="row">
              <div class="products-tabs">
                <!-- tab -->
                <div id="tab2" class="tab-pane fade in active">
                  <div class="products-slick" data-nav="#slick-nav-2">
                  
 			<% List<Product> productTop = productDao.getListTopProduct();
            
              	 for(Product product : productTop) {%>
                    <!-- product -->
                    
                    <div class="product">
                      <div class="product-img">
                        <img src="<%=product.getThumbnail()%>" alt="" />
                        <div class="product-label">
                        <span class="sale">-20%</span>
                          <span class="new">Mới</span>
                        </div>
                      </div>
                      <div class="product-body">
                        <p class="product-category"><%=productDao.getNameCategory(product.getCategory_id()) %></p>
                        <h3 class="product-name">
                          <a href="inforDatailServlet?id=<%=product.getId()%>"><%=product.getName()%></a>
                        </h3>
                        <h4 class="product-price">
                          <%=new java.text.DecimalFormat("#,###").format(product.getDiscount())%> <del class="product-old-price">
                           <%=new java.text.DecimalFormat("#,###").format(product.getPrice())%></del>
                        </h4>
                        <%   float av = reviewDao.getAVGReview(product.getId()); %>
               
                <%if(av == 0){ %>
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                          </div>
                         <%} %>
                 
                 <%if(av > 0 && av < 2){ %>
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                          <%if(av >= 2 && av <3){ %>
                          <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                          <%if(av>=3 && av <4){ %>
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                          <%if(av >=4 && av < 5){ %>
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                         <%if(av ==5){ %>
                          <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                          </div>
                         <%} %>
                       
                       
                        <div class="product-btns">
                       
                       
                       <%User user = (User) session.getAttribute("user");
                          if(user != null){ %>
                           <button class="add-to-wishlist" onclick="addToWishlist(<%=product.getId()%>)">
                            <i class="fa fa-heart-o"></i
                            ><span class="tooltipp">Yêu thích</span>
                          </button>
                          <%} %>
                        <% if(user == null){ %>
                           <button class="add-to-wishlist" onclick="redirectToLogin()" >
                            <i class="fa fa-heart-o"></i
                            ><span class="tooltipp">Yêu thích</span>
                          </button>
                          <%} %>  
                         
                        
                        
                          
                          <button class="add-to-compare">
                            <i class="fa fa-exchange"></i
                            >
                          </button>
                          <button class="quick-view">
                          <a href="inforDatailServlet?id=<%=product.getId()%>"><i class="fa fa-eye"></i
                            ><span class="tooltipp">Xem sản phẩm</span></a>
   
                          </button>
                        </div>
                      </div>
                       <%
                       if(user == null){ %>
                    	       <div class="add-to-cart">
                       
                        <button class="add-to-cart-btn" onclick="redirectToLogin()" style="border-radius: 0px !important;" >
                         <i class="fa fa-shopping-cart"></i> Thêm giỏ hàng
                        </button>
                      </div>
                      <% }
                      %>
                      
                      <%if(user != null){ %>
                      <form action="addOrderServlet" method="post">
                      <div class="add-to-cart">
                        <input type="hidden" value="<%=product.getId()%>" name = 'idproductcart'>
                        <button class="add-to-cart-btn" type="submit" style="border-radius: 0px !important;">
                         <i class="fa fa-shopping-cart"></i> Thêm giỏ hàng
                        </button>
                      </div>
                      </form>
                      <%} %>
                      
                    </div>
                    <!-- /product -->
             <%} %>
             
                  

                   


                 
                  </div>
                  <div id="slick-nav-2" class="products-slick-nav"></div>
                </div>
                <!-- /tab -->
              </div>
            </div>
          </div>
          <!-- /Products tab & slick -->
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

   <jsp:include page="footer.jsp"></jsp:include>
   
   <script src="js/jquery.min.js"></script>
   
   <script>
  function redirectToLogin() {
    window.location.href = "login.jsp";
  }
</script>
   
   <script>
    function countdown() {
  var daysElement = document.getElementById("days");
  var hoursElement = document.getElementById("hours");
  var minutesElement = document.getElementById("minutes");
  var secondsElement = document.getElementById("seconds");

  var days = parseInt(daysElement.textContent);
  var hours = parseInt(hoursElement.textContent);
  var minutes = parseInt(minutesElement.textContent);
  var seconds = parseInt(secondsElement.textContent);

  var countdownInterval = setInterval(function() {
    if (seconds > 0) {
      seconds--;
    } else {
      seconds = 59;

      if (minutes > 0) {
        minutes--;
      } else {
        minutes = 59;

        if (hours > 0) {
          hours--;
        } else {
          hours = 23;

          if (days > 0) {
            days--;
          } else {
            clearInterval(countdownInterval);
            // Thá»i gian ÄÃ£ háº¿t
          }
        }
      }
    }

    daysElement.textContent = days.toString().padStart(2, "0");
    hoursElement.textContent = hours.toString().padStart(2, "0");
    minutesElement.textContent = minutes.toString().padStart(2, "0");
    secondsElement.textContent = seconds.toString().padStart(2, "0");
  }, 1000);
}

countdown();

   </script>
   
   <!-- Thêm mã JavaScript sau thẻ </body> -->
<script>
$(document).ready(function() {
  // Kiểm tra nếu có thông báo trong session
  <% String cartMessage = (String) session.getAttribute("cartMessage");
     if (cartMessage != null) { %>
    // Hiển thị modal khi tài liệu đã tải xong
    $('#myModal').modal('show');
   <% session.removeAttribute("cartMessage");%>
    setTimeout(function() {
        $('#myModal').modal('hide');
      }, 1000);
    <% session.removeAttribute("cartMessage"); // Xóa thông báo sau khi hiển thị
     } %>
});
</script>
   
 <script>
$(document).ready(function() {
  // Kiểm tra nếu có thông báo trong session
  <% String success = (String) session.getAttribute("seccess");
     if (success != null) { %>
    // Hiển thị modal khi tài liệu đã tải xong
    $('#modalSeccess').modal('show');
    <%session.removeAttribute("seccess"); %>
    setTimeout(function() {
        $('#modalSeccess').modal('hide');
      }, 1000);
    <% session.removeAttribute("seccess"); // Xóa thông báo sau khi hiển thị
     } %>
});
</script>


 <script>
$(document).ready(function() {
  // Kiểm tra nếu có thông báo trong session
  <% String successConcact = (String) session.getAttribute("successConcact");
     if (successConcact != null) { %>
    // Hiển thị modal khi tài liệu đã tải xong
    $('#modalConcact').modal('show');
    <%session.removeAttribute("successConcact"); %>
    setTimeout(function() {
        $('#modalConcact').modal('hide');
      }, 1000);
    <% session.removeAttribute("successConcact"); // Xóa thông báo sau khi hiển thị
     } %>
});
</script>


<script>
  // Hàm cập nhật số lượng sản phẩm yêu thích trên trang
  function updateWishlistCount(count) {
    var wishlistCountElement = document.getElementById("wishlistCount");
    if (wishlistCountElement) {
      wishlistCountElement.innerText = count;
    }
  }
</script>


<script>
  function addToWishlist(productId) {
    var xhr = new XMLHttpRequest();
    var url = "wishlistServlet"; // Đặt URL của servlet của bạn ở đây
    var params = "idproduct=" + encodeURIComponent(productId);
    
    xhr.open("POST", url, true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    
    xhr.onreadystatechange = function() {
      if (xhr.readyState == 4 && xhr.status == 200) {
        // Xử lý kết quả từ servlet (nếu cần)
        if (xhr.responseText === "success") {
        	 $('#modaLikeSuccess').modal('show');
        	  setTimeout(function() {
        	        $('#modaLikeSuccess').modal('hide');
        	      }, 1000);
        	// Cập nhật số lượng sản phẩm yêu thích trên trang
              updateWishlistCount(xhr.getResponseHeader("X-Wishlist-Count"));
        } else {
        	 $('#modaLikeFail').modal('show');
       	  setTimeout(function() {
       	        $('#modaLikeFail').modal('hide');
       	      }, 1000);
        }
      }
    };
    
    xhr.send(params);
  }
</script>


    <!-- jQuery Plugins -->
    
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
