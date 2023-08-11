<%@page import="Model.Product"%>
<%@page import="Model.Orderdetail"%>
<%@page import="Model.Order"%>
<%@page import="Model.User"%>
<%@page import="Model.Category"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDao" class="Dao.productDao" scope="application" />
<jsp:useBean id="orderDao" class="Dao.orderDao" scope="application" />
<jsp:useBean id="wishlistDao" class="Dao.wishlistDao" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>

<style type="text/css">
.mx-5{
margin-left: 15px !important;
margin-right: 15px !important;
}
select{
     color:black;
    }
    
.cart-dropdown .cart-btns button {
  display: inline-block;
  width: calc(50% - 0px);
  padding: 12px;
  background-color: #d10024;
  color: #fff;
  text-align: center;
  font-weight: 700;
  -webkit-transition: 0.2s all;
  transition: 0.2s all;
  border: none;
}

.cart-dropdown .cart-btns button:hover {
  opacity: 0.8;
}
</style>

</head>
<body>
 <!-- HEADER -->
    
    <header class="header-area">
      <!-- TOP HEADER -->
      <div id="top-header">
        <div class="container">
          <ul class="header-links pull-right">
            
            <li>
            <c:if test="${sessionScope.user != null}">
             <div class="btn-group" role="group">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                 Tài khoản: ${sessionScope.user.username}
                  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  <li><a href="account.jsp">Tài khoản</a></li>
                  <li><a href="logoutServlet">Đăng xuất</a></li>
                </ul>
              </div>
            </c:if>
             <c:if test="${sessionScope.user == null}">
             <a href="login.jsp" class="mx-5"><i class="fa fa-user-o "></i> Đăng nhập</a>
              <a href="register.jsp"><i class="fa fa-user-o"></i>Đăng ký</a>
             </c:if>
              
            </li>
          </ul>
        </div>
      </div>
      <!-- /TOP HEADER -->

      <!-- MAIN HEADER -->
      <div id="header">
        <!-- container -->
        <div class="container">
          <!-- row -->
          <div class="row">
            <!-- LOGO -->
            <div class="col-md-3">
              <div class="header-logo">
                <a href="index.jsp" class="logo">
                  <img src="./img/logo.png" alt="" style="font-weight: bold;"/>
                </a>
              </div>
            </div>
            <!-- /LOGO -->

            <!-- SEARCH BAR -->
            <div class="col-md-6">
              <div class="header-search">
                <form method="get" action="searchHeraderServlet">
                  
                  <input class="input" placeholder="Tên giày hoặc hãng sản xuất" name = "nameShoe"/>
                  <button type="submit" class="search-btn" style="border-radius: 0px;">Tìm kiếm</button>
                </form>
              </div>
            </div>
            <!-- /SEARCH BAR -->

            <!-- ACCOUNT -->
            <div class="col-md-3 clearfix">
              <div class="header-ctn">
              
                 <!-- Wishlist -->
                <div>
                  <a href="wishlist.jsp">
                    <i class="fa fa-heart-o"></i>
                    <span>Yêu thích</span>
                    <%int c =0;
                      User user = (User) session.getAttribute("user");
                      if(user != null){
                    	  c= wishlistDao.countWishlist(user.getId());
                      }
                    %>
                    <div class="qty" id="wishlistCount" ><%=c%></div>
                  </a>
                </div>
                <!-- /Wishlist -->

                <!-- Cart -->
                <div class="dropdown">
                  <a
                    class="dropdown-toggle"
                    data-toggle="dropdown"
                    aria-expanded="true"
                  >
                    <i class="fa fa-shopping-cart"></i>
                    <span>Giỏ hàng</span>
                    <%
                    int count =0;
                    
        		 
        		    Order order = null;
        		    if(user != null){
        		        order = orderDao.getOrderByUserId(user.getId());
        		        if(order != null){
        		        	  count = orderDao.countItemOrderDetail(order.getId());
        		        }
            		  
        		    }
                    %>
                    <div class="qty"><%=count%></div>
                  </a>
                  <div class="cart-dropdown">
                    <div class="cart-list">
                    
                    <%
                    List<Orderdetail> orderdetails = null;
                      if(order != null){
                    	  orderdetails = orderDao.getListOrderdetailOrderBy(order.getId());
                      }
                    if(orderdetails != null){
                     for(Orderdetail orderdetail : orderdetails){
                    	  Product product = productDao.getProductById(orderdetail.getProduct_id());
                    %>
                      <div class="product-widget">
                        <div class="product-img">
                          <img src="<%=product.getThumbnail()%>" alt="" />
                        </div>
                        <div class="product-body">
                          <h3 class="product-name">
                            <a href="#"><%=product.getName()%></a>
                          </h3>
                          <h4 class="product-price">
                            <span class="qty"><%=orderdetail.getQuantity()%>x</span><%=new java.text.DecimalFormat("#,###").format(orderdetail.getPrice())%>
                          </h4>
                        </div>
                       
                      </div>

                     <%}
                    }
                     %>
                      
                      
                    </div>
                    <div class="cart-summary">
                      <small><%=count%> sản phẩm được chọn</small>
                      <%double t = 0.0;
                        if(order != null){
                        	t =orderDao.calculateOrderTotal(order.getId());
                        }
                      %>
                      <h5>Tổng tiền: <%=new java.text.DecimalFormat("#,###").format(t)%></h5>
                    </div>
                    <div class="cart-btns">
                      <a href="cart.jsp">Xem giỏ hàng</a>
                      <form action="checkQuantityBuy" method="post" style="display: inline;">
                           <button type="submit"
                        >Thanh toán <i class="fa fa-arrow-circle-right"></i
                      ></button>
                      </form>
                     
                    </div>
                  </div>
                </div>
                <!-- /Cart -->

                <!-- Menu Toogle -->
                <div class="menu-toggle">
                  <a href="#">
                    <i class="fa fa-bars"></i>
                    <span>Menu</span>
                  </a>
                </div>
                <!-- /Menu Toogle -->
              </div>
            </div>
            <!-- /ACCOUNT -->
          </div>
          <!-- row -->
        </div>
        <!-- container -->
      </div>
      <!-- /MAIN HEADER -->
    </header>
    <!-- /HEADER -->

</body>
</html>