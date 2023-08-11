<%@page import="Model.Category"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="productDao" class="Dao.productDao" scope="page" />
<jsp:useBean id="reviewDao" class="Dao.reviewDao" scope="application" />
<%@page import="Model.User"%>
<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Cửa hàng giày nhân tạo</title>

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

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
    <style type="text/css">
     .btn-filter{
  background: #d10024;
  color: #fff;
  font-weight: 700;
  border: none;
  border-radius: 0px;
  margin-top: 15px;
     }
     
     .btn-filter:hover{
        color: #fff;
     }
     .btn-filter:focus{
        color: #fff;
     }
     
     .numberpage:focus{
         color:#fff;
     }
     li.active .numberpage{
         color:#fff;
     }
     
     .add-to-cart-btn{
     border-radius: 0px !important;
     }
    </style>
    
  <c:set value="${tag}" var="a"></c:set>
  </head>
  <body>
    <jsp:include page="header.jsp"></jsp:include>
    
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
             <li ><a href="index.jsp">Trang chủ</a></li>
            <li><a href="store">Tất cả sản phẩm</a></li>
            <li class="active"><a href="shoeArtifical">Giày cỏ nhân tạo</a></li>
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
              <li><a href="#">Tất cả</a></li>
              <li class="active">Giày cỏ nhân tạo</li>
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
          <!-- ASIDE -->
          <div id="aside" class="col-md-3">
            <!-- aside Widget -->
            <div class="aside">
              <h3 class="aside-title">Hãng sản xuất</h3>
           <form action="searchArtiServlet" method="post">
              <div class="checkbox-filter">
              <%
              
                    	List<Category> categories = productDao.getListCategorysArtifical();
                        for(Category category : categories){
                        	
                    %>
           
               
                <div class="input-checkbox">
                 
                  <input type="checkbox" id="category-<%=category.getId()%>" name = "checkboxSearch" value="<%=category.getId()%>" />
                  <label for="category-<%= category.getId() %>">
                    <span></span>
                   <%=category.getName() %>
                   <%int c = productDao.getCountProduct(category.getId()); %>
                    <small>( <%=c%> )</small>
                  </label>
                </div>

                 <%    }
                    %>
              </div>
            </div>
            <!-- /aside Widget -->

            <!-- aside Widget -->
            <div class="aside">
              <h3 class="aside-title">Giá</h3>
              <div class="price-filter">
                <div id="price-slider"></div>
                
                <div class="input-number price-min">
                  <input id="price-min" type="number" name = "pricemin"/>
                  <span class="qty-up">+</span>
                  <span class="qty-down">-</span>
                </div>
                <span>-</span>
                
                <div class="input-number price-max">
                  <input id="price-max" type="number"  name = "pricemax" />
                  <span class="qty-up">+</span>
                  <span class="qty-down">-</span>
                </div>
                 <span>(đơn vị triệu)</span>
              </div>
                <button class="btn btn-filter" type="submit"> Tìm kiếm</button>
            </div>
            <!-- /aside Widget -->
       </form>
           

            
          </div>
          <!-- /ASIDE -->

          <!-- STORE -->
    <div id="store" class="col-md-9">
           
            <!-- store products -->
     <c:if test="${products != null && a ==0 }">
       <div class="row">

        
               <c:set var="count" value="0"></c:set>
              <c:forEach items="${products}" var="o">
                    <c:set var = "count" value="${count+1}"></c:set>
                     <!-- product -->
                  <div class="col-md-4 col-xs-6">  
                    <div class="product">
                      <div class="product-img">
                        <img src="${o.getThumbnail()}" alt="" />
                        <div class="product-label">
                          <span class="new">Mới</span>
                        </div>
                      </div>
                      <div class="product-body">
                        <p class="product-category"><c:out value="${productDao.getNameCategory(o.getCategory_id())}" /></p>
                        <h3 class="product-name">
                          <a href="inforDatailServlet?id=${o.getId()}">${o.getName()}</a>
                        </h3>
                        <h4 class="product-price">
                          <fmt:formatNumber value="${o.getDiscount()}" type="currency" /> <del class="product-old-price">
                           <fmt:formatNumber value="${o.getPrice()}" type="currency" /></del>
                        </h4>
                       
                        
                  <c:set var="avg" value="${reviewDao.getAVGReview(o.getId())}" />
                 
                 
                 <c:choose>
				 	 <c:when test="${avg == 0}">
				  	  	<div class="product-rating">
				   	  		 <i class="fa fa-star"></i>
				     		 <i class="fa fa-star"></i>
				    		  <i class="fa fa-star"></i>
				     		 <i class="fa fa-star"></i>
				      		<i class="fa fa-star"></i>
				    	</div>
  					</c:when>
 
				
                  <c:when test="${avg > 0 && avg < 2}">
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                   </c:when>
                         
                   <c:when test="${avg >=2 && avg < 3}">
                          <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                   </c:when>
                         
                     <c:when test="${avg >=3 && avg < 4}">
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                        </c:when>
                         
                        <c:when test="${avg >=4 && avg < 5}">
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         </c:when>
                         
                         <c:when test="${avg == 5}">
                          <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                          </div>
                         </c:when>
                         
                         
                     </c:choose>  
                         
                        <div class="product-btns">
                        
                         <%User user = (User) session.getAttribute("user");
                          if(user != null){ %>
                           <button class="add-to-wishlist" onclick="addToWishlist(${o.getId()})">
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
                          <a href="inforDatailServlet?id=${o.getId()}"><i class="fa fa-eye"></i
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
                        <input type="hidden" value="${o.getId()}" name = 'idproductcart'>
                        <button class="add-to-cart-btn" type="submit" style="border-radius: 0px !important;">
                         <i class="fa fa-shopping-cart"></i> Thêm giỏ hàng
                        </button>
                      </div>
                      </form>
                      <%} %>
                    </div>
                   </div>
                    <!-- /product -->
     <c:if test="${count % 2 == 0 && count % 6 != 0}">
    <!-- /chia hết cho 2 và không chia hết cho 6 -->
    <div class="clearfix visible-sm visible-xs"></div>
  </c:if>
  <c:if test="${count % 3 == 0}">
    <!-- /chia hết cho 3 -->
    <div class="clearfix visible-lg visible-md"></div>
  </c:if>
  <c:if test="${count % 6 == 0 && count % 2 != 0}">
    <!-- /chia hết cho 6 và không chia hết cho 2 -->
    <div class="clearfix visible-lg visible-md visible-sm visible-xs"></div>
  </c:if>
              
      </c:forEach>
              
              
   </div>
   <!-- Hết row -->
       <!-- /store products -->

            <!-- store bottom filter -->
            <div class="store-filter clearfix">
              
              <ul class="store-pagination">
              
              
                 
                  <c:if test="${numberPage >= 2 && numberPage <=6}">
                  
                     <c:forEach begin="${1}" end="${numberPage}" var="i">
                           <li class ="${(requestScope.page) == i ? 'active':''}" ><a class = "numberpage" href="shoeArtifical?page=${i}">${i}</a></li>
                     </c:forEach>
                  </c:if>
              
                <c:if test="${numberPage > 6}">
					    <c:set value="1" var="startPage">
						</c:set>
						<c:set value="6" var="endPage">
						</c:set>
		
						<c:if test="${page >=5}">
							<c:set value="${page-2}" var="startPage">
							</c:set>
							<c:set value="${page+2}" var="endPage">
							</c:set>
						</c:if>
		
						<c:if test="${numberPage == page}">
							<c:set value="${numberPage}" var="endPage">
							</c:set>
						</c:if>
						<c:if test="${page == numberPage-1}">
							<c:set value="${numberPage}" var="endPage">
							</c:set>
						</c:if>
						
						
					
				
				<!-- Previous -->
				<c:if test="${page !=1}">
					
					 <li >
                         <a class = "numberpage" href="shoeArtifical?page=${page-1}"><i class="fa fa-angle-left"></i></a>
                       </li>
				</c:if>
				
				
				<c:if test="${page >= 5}">
					<li class="page-item ${(requestScope.page) == 1 ? 'active':''}">
					<a class="page-link" href="shoeArtifical?page=${1}">${1}</a>
					</li>
					<li class="page-item"><a class="page-link">...</a></li>
				</c:if>
				
				<c:forEach begin="${startPage}" end="${endPage}" var="i">

					 <li class ="${(requestScope.page) == i ? 'active':''}" ><a class = "numberpage"  href="shoeArtifical?page=${i}">${i}</a></li>
				</c:forEach>
				
				<c:if test="${page != numberPage}">
					  <li >
                         <a href="shoeArtifical?page=${page+1}"><i class="fa fa-angle-right"></i></a>
                       </li>
				</c:if>
				
				
				</c:if>          
              </ul>
            </div>
            <!-- /store bottom filter -->
            
        </c:if>
        <!-- kết thúc phân trang ở store.jsp -->
        
        
        <!-- phân trang theo tìm kiếm -->
        
        
        <c:if test="${products != null && a ==1 }">
       <div class="row">

        
               <c:set var="count" value="0"></c:set>
              <c:forEach items="${products}" var="o">
                    <c:set var = "count" value="${count+1}"></c:set>
                     <!-- product -->
                  <div class="col-md-4 col-xs-6">  
                    <div class="product">
                      <div class="product-img">
                        <img src="${o.getThumbnail()}" alt="" />
                        <div class="product-label">
                          <span class="new">Mới</span>
                        </div>
                      </div>
                      <div class="product-body">
                        <p class="product-category"><c:out value="${productDao.getNameCategory(o.getCategory_id())}" /></p>
                        <h3 class="product-name">
                          <a href="inforDatailServlet?id=${o.getId()}">${o.getName()}</a>
                        </h3>
                        <h4 class="product-price">
                          <fmt:formatNumber value="${o.getDiscount()}" type="currency" /> <del class="product-old-price">
                           <fmt:formatNumber value="${o.getPrice()}" type="currency" /></del>
                        </h4>
                       
                        
                  <c:set var="avg" value="${reviewDao.getAVGReview(o.getId())}" />
                 
                 
                 <c:choose>
				 	 <c:when test="${avg == 0}">
				  	  	<div class="product-rating">
				   	  		 <i class="fa fa-star"></i>
				     		 <i class="fa fa-star"></i>
				    		  <i class="fa fa-star"></i>
				     		 <i class="fa fa-star"></i>
				      		<i class="fa fa-star"></i>
				    	</div>
  					</c:when>
 
				
                  <c:when test="${avg > 0 && avg < 2}">
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                   </c:when>
                         
                   <c:when test="${avg >=2 && avg < 3}">
                          <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                   </c:when>
                         
                     <c:when test="${avg >=3 && avg < 4}">
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                        </c:when>
                         
                        <c:when test="${avg >=4 && avg < 5}">
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         </c:when>
                         
                         <c:when test="${avg == 5}">
                          <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                          </div>
                         </c:when>
                         
                         
                     </c:choose>  
                         
                        <div class="product-btns">
                        
                         <%User user = (User) session.getAttribute("user");
                          if(user != null){ %>
                           <button class="add-to-wishlist" onclick="addToWishlist(${o.getId()})">
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
                          <a href="inforDatailServlet?id=${o.getId()}"><i class="fa fa-eye"></i
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
                        <input type="hidden" value="${o.getId()}" name = 'idproductcart'>
                        <button class="add-to-cart-btn" type="submit" style="border-radius: 0px !important;">
                         <i class="fa fa-shopping-cart"></i> Thêm giỏ hàng
                        </button>
                      </div>
                      </form>
                      <%} %>
                    </div>
                   </div>
                    <!-- /product -->
     <c:if test="${count % 2 == 0 && count % 6 != 0}">
    <!-- /chia hết cho 2 và không chia hết cho 6 -->
    <div class="clearfix visible-sm visible-xs"></div>
  </c:if>
  <c:if test="${count % 3 == 0}">
    <!-- /chia hết cho 3 -->
    <div class="clearfix visible-lg visible-md"></div>
  </c:if>
  <c:if test="${count % 6 == 0 && count % 2 != 0}">
    <!-- /chia hết cho 6 và không chia hết cho 2 -->
    <div class="clearfix visible-lg visible-md visible-sm visible-xs"></div>
  </c:if>
              
      </c:forEach>
              
              
   </div>
   <!-- Hết row -->
       <!-- /store products -->

            <!-- store bottom filter -->
            <div class="store-filter clearfix">
              
              <ul class="store-pagination">
              
              
                 
                  <c:if test="${numberPage >= 2 && numberPage <=6}">
                  
                     <c:forEach begin="${1}" end="${numberPage}" var="i">
                           <li class ="${(requestScope.page) == i ? 'active':''}" >
                               <a class = "numberpage" href="searchArtiServlet?checkboxSearch=${checkbox}&pricemin=${pricemin}&pricemax=${pricemax}&page=${i}">${i}</a>
                           </li>
                     </c:forEach>
                  </c:if>
              
                <c:if test="${numberPage > 6}">
					    <c:set value="1" var="startPage">
						</c:set>
						<c:set value="6" var="endPage">
						</c:set>
		
						<c:if test="${page >=5}">
							<c:set value="${page-2}" var="startPage">
							</c:set>
							<c:set value="${page+2}" var="endPage">
							</c:set>
						</c:if>
		
						<c:if test="${numberPage == page}">
							<c:set value="${numberPage}" var="endPage">
							</c:set>
						</c:if>
						<c:if test="${page == numberPage-1}">
							<c:set value="${numberPage}" var="endPage">
							</c:set>
						</c:if>
						
						
					
				
				<!-- Previous -->
				<c:if test="${page !=1}">
					
					 <li >
					 <a class = "numberpage" href="searchArtiServlet?checkboxSearch=${checkbox}&pricemin=${pricemin}&pricemax=${pricemax}&page=${page-1}"><i class="fa fa-angle-left"></i></a>
                         
                       </li>
				</c:if>
				
				
				<c:if test="${page >= 5}">
					<li class="page-item ${(requestScope.page) == 1 ? 'active':''}">
					<a class = "numberpage" href="searchArtiServlet?checkboxSearch=${checkbox}&pricemin=${pricemin}&pricemax=${pricemax}&page=${1}">${1}</a>
					
					</li>
					<li class="page-item"><a class="page-link">...</a></li>
				</c:if>
				
				<c:forEach begin="${startPage}" end="${endPage}" var="i">

					 <li class ="${(requestScope.page) == i ? 'active':''}" >
					 <a class = "numberpage" href="searchArtiServlet?checkboxSearch=${checkbox}&pricemin=${pricemin}&pricemax=${pricemax}&page=${i}">${i}</a>
				</c:forEach>
				
				<c:if test="${page != numberPage}">
					  <li >
                       <a class = "numberpage" href="searchArtiServlet?checkboxSearch=${checkbox}&pricemin=${pricemin}&pricemax=${pricemax}&page=${page+1}"><i class="fa fa-angle-right"></i></a>
                       </li>
				</c:if>
				
				
				</c:if>          
              </ul>
            </div>
            <!-- /store bottom filter -->
            
        </c:if>

            
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




   
   
    <jsp:include page="footer.jsp"></jsp:include>

<script src="js/jquery.min.js"></script>





  <script>
  function redirectToLogin() {
    window.location.href = "login.jsp";
  }
</script>

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
