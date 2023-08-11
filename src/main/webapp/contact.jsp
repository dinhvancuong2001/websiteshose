<%@page import="Model.User"%>
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
    
    <title>Liên hệ</title>

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
   
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 


    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <link type="text/css" rel="stylesheet" href="css/cartstyle.css" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style type="text/css">
    .error-message {
        margin-top: 5px;
        display: none;
        color: red;
      }
      
     .control-group{
      margin-bottom:  20px;
     }
     
     #sendMessageButton{
        border-radius: 0px !important;
        width: 105px;
        height: 40px;  
     }
    </style>
  </head>
  <body>
   
   
    
   
   
    
    <!-- HEADER -->
    
     <jsp:include page="header.jsp"></jsp:include>
     
    <!-- /HEADER -->
    
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

  
   
       <!-- Contact Start -->
       <div class="container pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Liên hệ</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col-lg-7 mb-5">
                <div class="contact-form">
                   
                    <form name="sentMessage" id="contactForm" action="concactServlet" method="post">
                        <div class="control-group">
                            <input type="text" class="form-control" id="name" placeholder="Nhập tên" name = "name" style="height:45px; "                               />
                             <span id="name-error" class="error-message"
                      >Vui lòng nhập tên của bạn
                    </span>
                        </div>
                        <div class="control-group">
                            <input type="email" class="form-control" id="email" placeholder="Email" name = "email" style="height:45px; " 
                                />
                             <span id="email-error" class="error-message"
                  >Vui lòng nhập email hợp lệ
                </span>
                        </div>
                        <div class="control-group">
                            <input type="text" class="form-control" id="subject" placeholder="Tiêu đề" name = "subject" style="height:45px; " 
                                />
                           <span id="subject-error" class="error-message"
                      >Vui lòng nhập tiêu đề thư
                    </span>
                        </div>
                        <div class="control-group">
                            <textarea class="form-control" rows="6" id="message" placeholder="Nội dung" name  = "message"
                                ></textarea>
                           <span id="message-error" class="error-message"
                      >Vui lòng nội dung tin nhắn
                    </span>
                        </div>
                         <%User user = (User) session.getAttribute("user");
                          if(user != null){%>
                        <div>
                            <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">Liên hệ</button>
                        </div>
                        <%} %>
                        
                         
                        
                    </form>
                    
                    <% if(user == null){ %>
                               <div>
                            <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton" onclick="redirectToLogin()">Liên hệ</button>
                        </div>
                         <%} %>
                </div>
            </div>
            <div class="col-lg-5 mb-5">
                
                <div class="d-flex flex-column mb-3">
                    <h5 class="font-weight-semi-bold mb-3">Địa chỉ</h5>
                    <p class="mb-2"><i class="fa fa-map-marker text-primary mr-3" aria-hidden="true"></i>23 Minh Khai, Bắc Từ Liêm, Hà Nội</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>Cuonglt@gmail.com</p>
                    <p class="mb-2"><i class="fa fa-phone text-primary mr-3" aria-hidden="true"></i>0987448543</p>
                </div>
              
            </div>
        </div>
    </div>
    <!-- Contact End -->




    <jsp:include page="footer.jsp"></jsp:include>
    
      <!-- jQuery Plugins -->
    <script src="js/jquery.min.js"></script>
    
    
     <script>
  function redirectToLogin() {
    window.location.href = "login.jsp";
  }
</script>
     <script>
      const formValidation = document.getElementById("contactForm");
      const name = document.getElementById("name");
      const email = document.getElementById("email");
      const subject = document.getElementById("subject");
      const message = document.getElementById("message");
      
      const errorName = document.getElementById("name-error");
      const errorEmail = document.getElementById("email-error");
      const errorSubject = document.getElementById("subject-error");
      const errorMessage = document.getElementById("message-error");

      function getValue(id) {
        return document.getElementById(id).value.trim();
      }

      function checkName() {
    	  let regex = /^[a-zA-Z0-9\s\u00C0-\u024F\u1E00-\u1EFF]+$/;

        if (!regex.test(name.value)) {
        	name.focus();
        	errorName.style.display = "block";
          return false;
        } else {
        	errorName.style.display = "none";
          return true;
        }
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

      function checkSubject() {
    	  let subjectValue = getValue("subject");
  	    if (subjectValue.length === 0) {
  	    	errorSubject.style.display = "block";
  	      return false;
  	    } else {
  	    	errorSubject.style.display = "none";
  	      return true;
  	    }
      }
      
      function checkMessage() {
    	    let messageValue = getValue("message");
    	    if (messageValue.length === 0) {
    	      errorMessage.style.display = "block";
    	      return false;
    	    } else {
    	      errorMessage.style.display = "none";
    	      return true;
    	    }
    	  }
       
     
   

      formValidation.addEventListener("submit", function (event) {
    	  
    	event.preventDefault(); // Ngăn chặn gửi form mặc định 
        
    	name.addEventListener("input", function () {
        checkName();
      });
      email.addEventListener("input", function () {
        checkEmail();
      });
      subject.addEventListener("input", function () {
    	  checkSubject();
      });
      message.addEventListener("input", function () {
    	  checkMessage();
      });
        let error = false;
        if (!checkName()) {
          checkName();
          name.focus();
          error = true;
        }

        if (!checkEmail()) {
          checkEmail();
          email.focus();
          error = true;
        }

        if (!checkSubject()) {
        	checkSubject();
          subject.focus();
          error = true;
        }

        if (!checkMessage()) {
        	checkMessage();
          message.focus();
          error = true;
        }
    

        if (!error) {
            // Nếu không có lỗi, gỡ bỏ ngăn chặn gửi form
            event.target.submit();
          }
      });
      
     
    </script>
  
  

    
    

    
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
