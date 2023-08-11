<jsp:useBean id="productDao" class="Dao.productDao" scope="application" />
<jsp:useBean id="orderDao" class="Dao.orderDao" scope="application" />

<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page import="Model.Orderdetail"%>
<%@page import="Model.Order"%>
<%@page import="Model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Electro - HTML Ecommerce Template</title>

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

    <style type="text/css">
    .error-message {
        margin-top: 5px;
        display: none;
        color: red;
      }
    button[disabled].order-submit {
  background-color: #b4adae; /* Màu nền khi nút bị vô hiệu hóa */
  color: #666; /* Màu chữ khi nút bị vô hiệu hóa */
  cursor: not-allowed; /* Hiệu ứng con trỏ không được phép khi nút bị vô hiệu hóa */
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
             <li ><a href="index.jsp">Trang chủ</a></li>
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

    <!-- BREADCRUMB -->
    <div id="breadcrumb" class="section">
      <!-- container -->
      <div class="container">
        <!-- row -->
        <div class="row">
          <div class="col-md-12">
            <ul class="breadcrumb-tree">
              <li><a href="index.jsp">Trang chủ</a></li>
              <li class="active">Thanh toán</li>
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
          <div class="col-md-7">
            <!-- Billing Details -->
            <div class="billing-details">
              <div class="section-title">
                <h3 class="title">Địa chỉ thanh toán</h3>
              </div>
          
            <form action="buynowServlet" method="post" id = "formcheckout">
                <div class="form-group">
                <input
                  class="input"
                  type="text"
                  name="fullname"
                  id = "fullname"
                  placeholder="Họ tên"
                />
                 <span id="username-error" class="error-message"
                      >Vui lòng nhập tên nhận hàng hợp lệ
                    </span>
              </div>
              <div class="form-group">
                <input
                  class="input"
                  type="email"
                  name="email"
                  id = "email"
                  placeholder="Email"
                />
                 <span id="email-error" class="error-message"
                  >Vui lòng nhập email hợp lệ
                </span>
              </div>
              <div class="form-group">
                <input
                  class="input"
                  type="text"
                  name="address"
                  id = "address"
                  placeholder="Địa chỉ nhận hàng"
                />
                <span id="address-error" class="error-message"
                      >Vui lòng nhập địa chỉ hợp lệ
                    </span>
              </div>
             
              <div class="form-group">
                <input
                  class="input"
                  type="tel"
                  name="tel"
                  id = "tel"
                  placeholder="Số điện thoại"
                />
                 <span id="phone-error" class="error-message"
                  >Vui lòng nhập lại số điện thoại hợp lệ
                </span>
              </div>
             
            </div>
            <!-- /Billing Details -->

           

            <!-- Order notes -->
            <div class="order-notes">
              <textarea class="input" placeholder="Ghi chú" name = "note"></textarea>
            </div>
            <!-- /Order notes -->
          </div>

          <!-- Order Details -->
          <div class="col-md-5 order-details">
            <div class="section-title text-center">
              <h3 class="title">Đơn hàng của bạn</h3>
            </div>
            <div class="order-summary">
              <div class="order-col">
                <div><strong>Sản phẩm</strong></div>
                <div><strong>Tổng</strong></div>
              </div>
               <%   
        		    User user = (User) session.getAttribute("user");
        		    Order order = null;
        		    if(user != null){
        		        order = orderDao.getOrderByUserId(user.getId()); 
        		    }
                    %>
              <input type="hidden" name = "user_id" value = "<%=user != null ? user.getId() : ""%>">
              <input type="hidden" name = "product_id" value = "${buyproduct !=null ? buyproduct.getId(): ''}">
              <div class="order-products">
                <% int count = 1;
                   
                    %>
                <div class="order-col">
                  <div>1x ${buyproduct.name}</div>
                  <div><fmt:formatNumber value="${buyproduct.getDiscount()}" type="currency" /></div>
                </div>
                
              
              </div>
              <div class="order-col">
                <div>Phí vận chuyển</div>
                <div><strong>Miễn phí</strong></div>
              </div>
              <div class="order-col">
                <div><strong>Tổng tiền</strong></div>
                  
                <div><strong class="order-total"><fmt:formatNumber value="${buyproduct.getDiscount()}" type="currency" /></strong></div>
              </div>
            </div>
            
            <span id="checkout-error" class="error-message"
                  >Vui lòng chọn phương thức thanh toán
                </span>
            <div class="payment-method">
              <div class="input-radio">
                <input type="radio" name="payment" id="payment-1" value = "direct" />
                <label for="payment-1">
                  <span></span>
                  Chuyển khoản trực tiếp
                </label>
                <div class="caption">
                  
                   <p>Số tài khoản: 038202018050 </p>
                  <p> Tên tài khoản: Hứa Như Duy </p>
                   <p>Ngân hàng: Agribank </p>
                   <p style="margin-bottom: 20px;">Nội dung: Tên tài khoản + email tài khoản </p>
                 
                </div>
              </div>
              <div class="input-radio">
                <input type="radio" name="payment" id="payment-2"  value = "delivery"/>
                <label for="payment-2">
                  <span></span>
                 Thanh toán khi nhận hàng
                </label>
                <div class="caption">
                  <p>
                   Đơn hàng của bạn sẽ được hoàn tất khi bạn thanh toán cho người vận chuyển đơn hàng
                  </p>
                </div>
              </div>
             
            </div>
            <div class="input-checkbox">
              <input type="checkbox" id="terms" name = "agree" onchange="toggleSubmitButton()"/>
              <label for="terms">
                <span></span>
                Tôi đã đọc và chấp nhận các điều khoản và điều kiện
              </label>
            </div>
            <%if(count >0){ %>
            <button type="submit" class="primary-btn order-submit" id="submitButton" disabled>Hoàn tất đặt hàng</button>
            <%} %>
            
             <%if(count  ==0){ %>
            <button type="submit" class="primary-btn order-submit" disabled>Vui lòng thêm sản phẩm</button>
            <%} %>
        </form>
             
          
          </div>
          <!-- /Order Details -->
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

<script type="text/javascript">
    const formValidation = document.getElementById("formcheckout");
    
    const email = document.getElementById("email");
    const phone = document.getElementById("tel");
    const address = document.getElementById("address");
    const username = document.getElementById("fullname");
    var radioDirect = document.getElementById('payment-1');
    var radioDelivery = document.getElementById('payment-2');
    
    
    const errorEmail = document.getElementById("email-error");
    const errorPhone = document.getElementById("phone-error");
    const errorUsername = document.getElementById("username-error");
    const errorAddress = document.getElementById("address-error");
    const errorCheckout = document.getElementById("checkout-error");
    
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
    	let regex = /^[0-9]{10}$/; // rỗng hoặc nhập
        if (!regex.test(phone.value)) {
          errorPhone.style.display = "block";
          return false;
        } else {
          errorPhone.style.display = "none";
          return true;
        }
      }
    
    function checkUsername() {
    	let regex = /^.{1,}$/;
        if (!regex.test(username.value)) {
          errorUsername.style.display = "block";
          return false;
        } else {
          errorUsername.style.display = "none";
          return true;
        }
      }
    function checkAddress() {
    	let regex = /^.{1,}$/;
        if (!regex.test(address.value)) {
          errorAddress.style.display = "block";
          return false;
        } else {
          errorAddress.style.display = "none";
          return true;
        }
      }
    
    function checkCheckout() {
    	
        if (!radioDirect.checked && !radioDelivery.checked ) {
          errorCheckout.style.display = "block";
          return false;
        } else {
        	errorCheckout.style.display = "none";
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
    
    address.addEventListener("input", function () {
        checkAddress();
      });
    
    
    radioDirect.addEventListener("change", function () {
    	checkCheckout();
      });
    
    radioDelivery.addEventListener("change", function () {
    	checkCheckout();
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
      if (!checkAddress()) {
          checkAddress();
          address.focus();
          error = true;
        }
      
      if (!checkCheckout()) {
    	  checkCheckout();
          error = true;
        }
      
     
       
        
       
        
      
      if (!error ) {
    	  
          // Nếu không có lỗi, gỡ bỏ ngăn chặn gửi form
          event.target.submit();
        }
     
    	 
    });
    
   
  </script>
<script>
  function toggleSubmitButton() {
    var checkbox = document.getElementById("terms");
    var submitButton = document.getElementById("submitButton");
    
    if (checkbox.checked) {
      submitButton.disabled = false; // Bỏ thuộc tính disabled
    } else {
      submitButton.disabled = true; // Thêm thuộc tính disabled
    }
  }
</script>

    <!-- jQuery Plugins -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
