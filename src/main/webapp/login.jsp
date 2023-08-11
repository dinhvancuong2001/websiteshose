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

    <title>Đăng nhập</title>

    <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css" />
    <link rel="stylesheet" href="vendors/themify-icons/themify-icons.css" />
    <link rel="stylesheet" href="vendors/linericon/style.css" />
    <link
      rel="stylesheet"
      href="vendors/owl-carousel/owl.theme.default.min.css"
    />
    <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
    <link rel="stylesheet" href="vendors/nice-select/nice-select.css" />
    <link rel="stylesheet" href="vendors/nouislider/nouislider.min.css" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css" />
    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <link type="text/css" rel="stylesheet" href="css/logincss1.css" />
    
    
    <style>
       .error-message {
        margin-top: 5px;
        display: none;
        color: red;
      }
      </style>
      
      
      
    <style>
    @media (min-width: 992px) {
      .offset-lg-3{
        margin-left: 25%;
      }
}

.password-input {
  position: relative;
}

.eye-icon {
  position: absolute;
  top: 50%;
  right: 10px;
  transform: translateY(-50%);
  cursor: pointer;
}

.eye-icon.hide-password {
  pointer-events: none;
}

input[type="password"].show-password {
  -webkit-text-security: none; /* Safari */
  text-security: none;
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
    <!--================Login Box Area =================-->
     <div class="register-login-section spad">
      <div class="container">
          <div class="row">
              <div class="col-lg-6 offset-lg-3">
                  <div class="login-form">
                      <h2>Đăng nhập</h2>
                      <form action="loginServlet" id="formlogin" method="post">
                      
                          <div class="group-input">
                              <label for="username">Nhập email:</label>
                              <input type="text" id="email" name = "email" 
                              <c:if test="${email != null}">
                  			  value="${email}"
                    		  </c:if>
                    <c:if test="${cookie.cookieEmail != null}">
                    value="${cookie.cookieEmail.value}"
                    </c:if>
                              >
                              
                           <span id="email-error" class="error-message"
                  >Vui lòng nhập email hợp lệ
                </span>
                          </div>
                          <div class="group-input">
                            <label for="pass">Mật khẩu: </label>
                            <div class="password-input">
                              <input type="password" id = "password"  name="password"
                    value="${cookie.cookiePass.value}">
                             
                                <i class="glyphicon glyphicon-eye-open eye-icon" id="eysicon"></i>
                             
                            </div>
                          </div>
                          <div class="group-input gi-check">
                              <div class="gi-more">
                                  <label for="save-pass">
                                      Nhớ tài khoản
                                      <input type="checkbox" id="save-pass" name="remember" value="1" ${cookie.cookieRemember != null ? 'checked':''}>
                                      <span class="checkmark"></span>
                                  </label>
                                  <!-- <a href="#" class="forget-pass">Forget your Password</a> -->
                              </div>
                          </div>
                          <c:if test="${email != null}">
                   <div class="col-md-12">
                    <p style="color:red">Tài khoản hoặc mật khẩu không chính xác </p>
                  </div>
                </c:if>
                          <button type="submit" class="site-btn login-btn">Đăng nhập</button>
                      </form>
                      <div class="switch-login">
                          <a href="register.jsp" class="or-login">Hoặc đăng ký</a>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
    
    <!--================End Login Box Area =================-->
    
    
   <script type="text/javascript">
    const formValidation = document.getElementById("formlogin");
  
    const email = document.getElementById("email");
 
    
    const errorEmail = document.getElementById("email-error");
  

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

    

    formValidation.addEventListener("submit", function (event) {
  	  
  	event.preventDefault(); // Ngăn chặn gửi form mặc định 
      
    email.addEventListener("input", function () {
      checkEmail();
    });
   
    
      let error = false;
      
      if (!checkEmail()) {
        checkEmail();
        email.focus();
        error = true;
      }

      if (!error) {
          // Nếu không có lỗi, gỡ bỏ ngăn chặn gửi form
          event.target.submit();
        }
    });
    
   
  </script>
  
  
  <script type="text/javascript">


const eyeIcon = document.getElementById("eysicon");
const password = document.getElementById("password");
eyeIcon.addEventListener("click", function () {
	    if (password.type === "password") {
	     password.type = "text";
	      eyeIcon.classList.remove("glyphicon-eye-open");
	      eyeIcon.classList.add("glyphicon-eye-close");
	    } else {
	      password.type = "password";
	      eyeIcon.classList.remove("glyphicon-eye-close");
	      eyeIcon.classList.add("glyphicon-eye-open");
	    }
	  });
 
</script> 
   <jsp:include page="footer.jsp"></jsp:include>

    <!-- jQuery Plugins -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
