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
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Quản lý tài khoản</title>

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
<style>
       .error-message {
        margin-top: 5px;
        display: none;
        color: red;
      }
      
       @media(min-width: 1200px)  {
	      .containerr{
	        width:fit-content;
	      }
}
      </style>
    
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

    <!-- BREADCRUMB -->
    <div id="breadcrumb" class="section">
      <!-- container -->
      <div class="container">
        <!-- row -->
        <div class="row">
          <div class="col-md-12">
            <ul class="breadcrumb-tree">
              <li><a href="#">Tài khoản</a></li>
              <li class="active">Thông tin đơn hàng</li>
            </ul>
          </div>
        </div>
        <!-- /row -->
      </div>
      <!-- /container -->
    </div>
    <!-- /BREADCRUMB -->

    <!-- Cart -->
    <div class="privacy">
      <div class="container containerr">
        <!-- tittle heading -->
        <h3 class="tittle-w3l" style="margin-bottom: 30px;text-align: center;">Thông tin chi tiết đơn hàng
        </h3>
        <!-- //tittle heading -->
        <div class="checkout-right">
         
          <div class="table-responsive">
            <table class="timetable_sub table-bordered">
              <thead>
                <tr>
                 
                  <th style="text-align: center;">Sản phẩm</th>
                  <th style="text-align: center;">Giá</th>
                  <th style="text-align: center;">Số lượng</th>
                  <th style="text-align: center;">Thông tin nhận hàng </th>
                  <th style="text-align: center;">Tổng tiền</th>
                   <th style="text-align: center;">Trạng thái</th>
                </tr>
                
                <%   
        		    User user = (User) session.getAttribute("user");
        		    List<Order> order = null;
        		    if(user != null){
        		        order = orderDao.getOrderByUserIdNotNull(user.getId()); 
        		    }
                    %>
              </thead>
              <tbody>
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
                <tr class="rem1">
                  <td class="invert-image" style="width: 350px;">
                    <div style="display: flex;">
                      <div style="width: 70px; height: 70px;margin-right: 15px">
                        <img src="<%=product.getThumbnail()%>" alt=" " style="width: 100%; height: 100%;">
                       
                      </div>
                      <div style="flex-grow: 1;">
                        <p><%=product.getName()%></p>
                      </div>
                    </div>
                  </td>
                  <td class="invert"  style="width: 100px; text-align: center;"><%=new java.text.DecimalFormat("#,###").format(orderdetail.getPrice())%></td>
                  <td class="invert" style="width: 30px;">
                    <div class="quantity " style="text-align: center;">
                      <div class="quantity-select">
                              
                        <div class="entry value">
                          <span><%=orderdetail.getQuantity()%></span>
                        </div>


                      </div>
                    </div>
                  </td>
                    <td class = "invert">
                         <%Order or = orderDao.getOrderById(orderdetail.getOrder_id()); %>
                         <p>Tên người nhận: <%=or.getFullname() %> </p>
                          <p>Số điện thoại: <%=or.getPhonenumber() %> </p>
                            <p>Địa chỉ nhận hàng: <%=or.getAddress()%> </p>
                         
                     </td>
                    <td class="invert" style="width: 100px;text-align: center;"><%=new java.text.DecimalFormat("#,###").format(orderdetail.getTotal_money())%></td>
                     <td><%=(orderdetail.getStatus() == 1) ? "Đang xử lý" : ((orderdetail.getStatus() == 2) ? "Thành công" : "Hủy bỏ")%> </td>
                </tr>
<%}
                     %>
              </tbody>
            </table>
          </div>
        </div>
        <div class="checkout-left" style="margin-top: 20px;">
          <div class="address_form_agile">

            <form style="display: flex; justify-content: flex-end; margin-bottom: 20px;">
           
              <h4 style="color: black;">Tổng tiền hàng đã mua thành công: <%=new java.text.DecimalFormat("#,###").format(total)%></h4>
             </form>

              </div>
         </div>
           
          </div>
          <div class="clearfix"> </div>
        </div>
    
    
    <!-- Cart -->
   

   <jsp:include page="footer.jsp"></jsp:include>
  
   <script src="js/jquery.min.js"></script>
  
   <script>
$(document).ready(function() {
    document.getElementById("payment-1").checked = true;
});
</script>

 <script type="text/javascript">
    const formValidation = document.getElementById("formUpdateUser");
    
    const email = document.getElementById("email");
    const phone = document.getElementById("tel");
    const username = document.getElementById("username");
    
    const errorEmail = document.getElementById("email-error");
    const errorPhone = document.getElementById("phone-error");
    const errorUsername = document.getElementById("username-error");
    
    function getValue(id) {
      return document.getElementById(id).value.trim();
    }


    function checkEmail() {
      let regex = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$/;
      if (!regex.test(email.value)) {
        errorEmail.style.display = "block";
        return false;
      } else {
        errorEmail.style.display = "none";
        return true;
      }
    }

    function checkPhone() {
    	let regex = /^$|^[0-9]{10}$/; // rỗng hoặc nhập
        if (!regex.test(phone.value)) {
          errorPhone.style.display = "block";
          return false;
        } else {
          errorPhone.style.display = "none";
          return true;
        }
      }
    
    function checkUsername() {
    	let regex = /^.{2,}$/;
        if (!regex.test(username.value)) {
          errorUsername.style.display = "block";
          return false;
        } else {
          errorUsername.style.display = "none";
          return true;
        }
      }
    
    
    formValidation.addEventListener("submit", function (event) {
  	  
  	event.preventDefault(); // Ngăn chặn gửi form mặc định 
      
    email.addEventListener("input", function () {
      checkEmail();
    });
    phone.addEventListener("input", function () {
        checkPhone();
      });
    
    username.addEventListener("input", function () {
        checkUsername();
      });
    
      let error = false;
      
      if (!checkEmail()) {
        checkEmail();
        email.focus();
        error = true;
      }

      if (!checkPhone()) {
          checkPhone();
          phone.focus();
          error = true;
        }
      
      if (!checkUsername()) {
          checkUsername();
          username.focus();
          error = true;
        }
      
      if (!error) {
          // Nếu không có lỗi, gỡ bỏ ngăn chặn gửi form
          event.target.submit();
        }
    });
    
   
  </script>


    <!-- jQuery Plugins -->
   
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
