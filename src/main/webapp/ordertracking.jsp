<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page import="Model.Orderdetail"%>
<%@page import="Dao.orderDao"%>
<%@page import="Model.Order"%>
<%@page import="Model.User"%>
<jsp:useBean id="productDao" class="Dao.productDao" scope="application" />
<jsp:useBean id="orderDao" class="Dao.orderDao" scope="application" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>EShopper - Bootstrap Shop Template</title>
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
    <link type="text/css" rel="stylesheet" href="css/cartstyle.css" />
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
            <li><a href="store">Cửa hàng</a></li>
            <li><a href="about.jsp">Giới thiệu</a></li>
            <li><a href="contact.jsp">Liên hệ</a></li>
          </ul>
          <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
      </div>
      <!-- /container -->
    </nav>
    <!-- /NAVIGATION -->
    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
      <div
        class="d-flex flex-column align-items-center justify-content-center"
        style="min-height: 150px"
      >
        <h1 class="font-weight-semi-bold text-uppercase mb-3">
          Theo dõi đơn hàng
        </h1>
        <div class="d-inline-flex">
          <p class="m-0"><a href="index.jsp">Trang chủ</a></p>
          <p class="m-0 px-2">-</p>
          <p class="m-0">Theo dõi đơn hàng</p>
        </div>
      </div>
    </div>
    <!-- Page Header End -->
    <!-- Cart Start -->
    <div class="container pt-5">
      <div class="row px-xl-5">
        <div class="col-lg-8 table-responsive mb-5">
          <table class="table table-bordered text-center mb-0">
            <thead class="bg-secondary text-dark">
              <tr>
                <th>Sản phẩm</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Tổng tiền</th>
                <th>Tình trạng</th>
              </tr>
            </thead>
            
             <%   
        		    User user = (User) session.getAttribute("user");
        		    List<Order> order = null;
        		    if(user != null){
        		        order = orderDao.getOrderByUserIdNotNull(user.getId()); 
        		    }
                    %>
            <tbody class="align-middle">
            <%
                    int count = 0;
                    double total = 0;
                    List<Orderdetail> allOrderdetails = new ArrayList<>();
                      if(order != null){
                    	  for(Order o : order){
                    		  List<Orderdetail> orderDetailsForOrder = orderDao.getListOrderdetailNotNull(o.getId());
                    	      allOrderdetails.addAll(orderDetailsForOrder);
                    	  }
                      }
                  
                    	
                     for(Orderdetail orderdetail : allOrderdetails){
                    	  Product product = productDao.getOrderById(orderdetail.getProduct_id());
                    	  count++;
                    	  if(orderdetail.getStatus() == 2){
                    		  total += orderdetail.getTotal_money();
                    	  }
                    %>
              <tr>
                <td class="align-middle" style="text-align: left;">
                   <div class= row>
                      <div class = "col-md-3">
                        <img src="<%=product.getThumbnail()%>" alt="" style="width: 70px" />
                      </div>
                      <div class = "col-md-9">
                       <%=product.getName()%>
                      </div>
                   </div>
                
                </td>
                 <td class="align-middle"><%=new java.text.DecimalFormat("#,###").format(orderdetail.getPrice())%></td>
                <td class="align-middle">
                  <div
                    class="input-group quantity mx-auto"
                    style="width: 100px"
                  >
                    <input
                      type="text"
                      class="form-control form-control-sm bg-secondary text-center inline-input"
                      value="<%=orderdetail.getQuantity()%>" disabled="disabled"
                    />
                  </div>
                </td>
                <td class="align-middle"><%=new java.text.DecimalFormat("#,###").format(orderdetail.getTotal_money())%></td>
               <td class="align-middle"><%=(orderdetail.getStatus() == 1) ? "Đang xử lý" : ((orderdetail.getStatus() == 2) ? "Giao dịch thành công" : "Bị hủy bỏ")%></td>
              </tr>
 				<%} 
                    
              %>
             
            </tbody>
          </table>
        </div>
        <div class="col-lg-4">
          <div class="card border-secondary mb-5">
            <div class="card-header bg-secondary border-0">
              <h4 class="font-weight-semi-bold m-0">Thống kê</h4>
            </div>
            <div class="card-body">
              <div class="d-flex justify-content-between">
                <h6 class="font-weight-medium">Số đơn hàng đã đặt: </h6>
                <h6 class="font-weight-medium"><%=count%></h6>
              </div>

              <div class="d-flex justify-content-between mb-3 pt-1">
                <h6 class="font-weight-medium">Tổng số tiền đã mua thành công:</h6>
                <h6 class="font-weight-medium"><%=new java.text.DecimalFormat("#,###").format(total)%></h6>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Cart End -->

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
