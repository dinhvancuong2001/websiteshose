<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page import="Model.Orderdetail"%>
<%@page import="Model.Order"%>
<%@page import="Model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDao" class="Dao.productDao" scope="application" />
<jsp:useBean id="orderDao" class="Dao.orderDao" scope="application" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Giỏ hàng</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="Free HTML Templates" name="keywords" />
    <meta content="Free HTML Templates" name="description" />

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon" />

    <!-- Google font -->
    <link
      href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
      rel="stylesheet"
    />

    <!-- Bootstrap -->

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
    <link type="text/css" rel="stylesheet" href="css/cart.css" />
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
           <li><a href="index.jsp">Trang chủ</a></li>
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

    

    
    <!-- Cart -->
           <div class="privacy">
      <div class="container">
        <!-- tittle heading -->
        <h3 class="tittle-w3l">Giỏ hàng
          <span class="heading-style">
            <i></i>
            <i></i>
            <i></i>
          </span>
        </h3>
        <!-- //tittle heading -->
        <div class="checkout-right">
         
          <div class="table-responsive">
            <table class="timetable_sub">
              <thead>
                <tr>
                 
                  <th>Sản phẩm</th>
                  <th>Giá</th>
                  <th>Số lượng</th>
                  <th>Tổng tiền</th>
                  <th>Gỡ bỏ</th>
                </tr>
                
                <%   
        		    User user = (User) session.getAttribute("user");
        		    Order order = null;
        		    if(user != null){
        		        order = orderDao.getOrderByUserId(user.getId()); 
        		    }
                    %>
              </thead>
              <tbody>
               <%
                    List<Orderdetail> orderdetails = null;
                      if(order != null){
                    	  orderdetails = orderDao.getListOrderdetailOrderBy(order.getId());
                      }
                    if(orderdetails != null){
                     for(Orderdetail orderdetail : orderdetails){
                    	  Product product = productDao.getProductById(orderdetail.getProduct_id());
                    %>
                <tr class="rem1">
                  <td class="invert-image" style="width: 350px;">
                    <div style="display: flex;">
                      <div style="width: 70px; height: 70px;">
                        <img src="<%=product.getThumbnail()%>" alt=" " style="width: 100%; height: 100%;">
                       
                      </div>
                      <div style="flex-grow: 1;">
                        <p><%=product.getName()%></p>
                      </div>
                    </div>
                  </td>
                  <td class="invert"  style="width: 100px;"><%=new java.text.DecimalFormat("#,###").format(orderdetail.getPrice())%></td>
                  <td class="invert" style="width: 160px;">
                    <div class="quantity ">
                      <div class="quantity-select">
                        <form style="display:math;" action="updateCartServlet" method="post" >   
                             <input type="hidden" name = "orderdetailId" value="<%=orderdetail.getId()%>">
                   <input type="hidden" name = "orderdetailQuantity" value="<%=orderdetail.getQuantity()%>">       
                                <button class="entry value-minus" type="submit" name = "minus" value = "minus"></button>
                        </form>
                        
                        <div class="entry value">
                          <span><%=orderdetail.getQuantity()%></span>
                        </div>
                        
                        
                        
                        <form  style="display:math;" action="updateCartServlet" method="post">
                         <input type="hidden" name = "orderdetailId" value="<%=orderdetail.getId()%>">          
                          <button class="entry value-plus" type="submit" name= "plus" value = "plus"></button>
                  </form>

                      </div>
                    </div>
                  </td>
                    <td class="invert" style="width: 100px;"><%=new java.text.DecimalFormat("#,###").format(orderdetail.getTotal_money())%></td>
                
                  <td class="invert" style="width: 100px;">
                    <div class="rem">
                      <form action="updateCartServlet" method="post" >
                       <input type="hidden" name = "orderdetailId" value="<%=orderdetail.getId()%>">     
                       <button class="btn btn-lg" type="submit" name="remove" value = "remove" >
                         <i class="fa fa-times"></i>
                       </button>
                        </form>
                    </div>
                  </td>
                </tr>
<%}
                     }%>
              </tbody>
            </table>
          </div>
        </div>
        <div class="checkout-left">
          <div class="address_form_agile">

            <form style="display: flex; justify-content: flex-end; margin-bottom: 20px;">
            <% double total = 0.0;
                if(order != null){
                	  total = orderDao.calculateOrderTotal(order.getId()); } %>
              
              <h4 style="color: black;">Tổng tiền: <%=new java.text.DecimalFormat("#,###").format(total)%></h4>
             </form>
               
                <c:if test="${failBuy != null}">
                     <p style="color: red;">${failBuy}</p>
             </c:if>
             
               <form action="checkQuantityBuy" method="post" style="display: flex; justify-content: flex-end;">
               
                <button
                  class="btn btn-lg btn-danger my-3 py-3" style="background-color: #d10024; padding: 10px 35px;"
                >
                  Thanh toán
                </button>
               </form>
               
              </div>
            </div>
           
          </div>
          <div class="clearfix"> </div>
        </div>
    
    
    <!-- Cart -->
    
    

    <jsp:include page="footer.jsp"></jsp:include>

    <!-- JavaScript Libraries -->
    <!-- jQuery Plugins -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
