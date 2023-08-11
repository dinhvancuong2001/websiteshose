<%@page import="Model.SalesStatistics"%>
<%@page import="Model.Orderdetail"%>
<%@page import="Dao.userDao"%>
<%@page import="Model.User"%>
<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page import="Admin.*"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDao" class="Dao.productDao" scope="page" />
<jsp:useBean id="reviewDao" class="Dao.reviewDao" scope="application" />
<jsp:useBean id="userDao" class="Dao.userDao" scope="application" />
<jsp:useBean id="orderDao" class="Dao.orderDao" scope="application" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="url" value="/admin"></c:url>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Trang chủ</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
		<link rel="stylesheet" href="${url}/assets/css/bootstrap.min.css">

    <!-- <link rel="stylesheet" href="css/dataTables.bootstrap5.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" /> -->

    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap4.min.css">


	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
		<link rel="stylesheet" href="${url}/assets/css/ready.css">
	<link rel="stylesheet" href="${url}/assets/css/demo.css">
  

     <!-- font anwersome -->
   
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

</head>
<body>
	<div class="wrapper">
		<div class="main-header">
			<div class="logo-header">
				<a href="trang-chu.html" class="logo">
					Quản lý bán giày
				</a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<button class="topbar-toggler more"><i class="la la-ellipsis-v"></i></button>
			</div>
			<nav class="navbar navbar-header navbar-expand-lg">
				<div class="container-fluid">

					<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
						
						
						<li class="nav-item dropdown">
							<a class="dropdown-item mt-3" href="/shopshoe/logoutAdmin"><i class="fa fa-power-off"></i> Logout</a>
								<!-- /.dropdown-user -->
							</li>
						</ul>
					</div>
				</nav>
			</div>
			<div class="sidebar">
				<div class="scrollbar-inner sidebar-wrapper">
					<div class="user">
						<div class="photo">
							<img src="assets/img/profile.jpg">
						</div>
						<div class="info">
							<a class="" data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								
							 <% User user = (User) session.getAttribute("userAdmin");
          						if(user != null){
        					  %>
								<span>
									<%=user.getUsername()%>
									<span class="user-level">Administrator</span>
								</span>
							   <%} %>
							    <% if(user == null){ 
        							  response.sendRedirect("/shopshoe/login.jsp");
     							   }	
       							%>
           
							</a>
							<div class="clearfix"></div>
						</div>
					</div>
					<ul class="nav">
						<li class="nav-item  ">
							<a href="trang-chu.jsp">
								<i class="la la-dashboard"></i>
								<p>Trang chủ</p>
							
							</a>
						</li>
						<li class="nav-item">
							<a href="manageuser.jsp">
								<i class="la la-users"></i>
								<p>Quản lý tài khoản</p>
							
							</a>
						</li>
						<li class="nav-item ">
							<a href="manageproduct.jsp">
								<i class="la la-keyboard-o"></i>
								<p>Quản lý sản phẩm</p>
							
							</a>
						</li>

                        <li class="nav-item ">
							<a href="managecategory.jsp">
								<i class="la la-bookmark-o"></i>
								<p>Quản lý danh mục</p>
							
							</a>
						</li>

						<li class="nav-item active">
							<a href="manageorder.jsp">
								<i class="la la-shopping-cart"></i>
								<p>Quản lý đơn hàng</p>
								
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<h4 class="page-title">Quản lý đơn hàng</h4>
                        <div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-header ">	
                                        <p>Đơn hàng</p>		
									</div>
									<div class="card-body">
                                        <table
                    id="example"
                    class="table table-striped data-table"
                    style="width: 100%"
                  >
                    <thead>
                      <tr>
                        <th>Mã đơn hàng</th>
                        <th>Khách hàng</th>
                        <th>Tên đơn hàng</th>
                        <th>Số lượng</th>
                        <th>Tổng tiền</th>
                        <th>Tình trạng</th>
                        <th>Tính năng</th>
                      </tr>
                    </thead>
                    <tbody>
                     <%List<Orderdetail> orderdetails = orderDao.getListOrderdetailsAdmin();
                 for(Orderdetail o: orderdetails){
                	 String name = orderDao.getNameById(o.getOrder_id());
                	 String nameproduct = productDao.getNameProduct(o.getProduct_id());
                %>
                      <tr>
                        <td><%=o.getId()%></td>
                        <td><%=name %></td>
                        <td><%=nameproduct %></td>
                        <td><%=o.getQuantity()%></td>
                        <td><%=new java.text.DecimalFormat("#,###").format(o.getTotal_money())%></td>
                         <% if(o.getStatus() ==1){ %>
                        <td>Đang xử lý</td>
                        <%} %>
                        
                         <% if(o.getStatus() ==2){ %>
                        <td>Thành công</td>
                        <%} %>
                        
                         <% if(o.getStatus() ==3){ %>
                        <td>Hủy</td>
                        <%} %>
                        
                        <td>
                        <form  id="form_<%=o.getId()%>" method="post" action="/shopshoe/UpdateStatus">
                              <input type="hidden" name="orderdetail_id" value="<%=o.getId()%>">
                         <% if(o.getStatus() ==1){ %>
                          <select class="form-control input-square" id="squareSelect"  name = "status"  onchange="submitForm(<%=o.getId()%>)">
                                <option value="1" selected="selected">Đang xử lý</option>
                                <option value="2">Thành công</option>
                                <option value="3">Hủy</option>
                            </select>
                         
                         <%} %>
                         
                          <% if(o.getStatus() ==3){ %>
                          <select class="form-control input-square" id="squareSelect"  name = "status"  onchange="submitForm(<%=o.getId()%>)">
                               <option value="3" selected="selected">Hủy</option>
                                <option value="2">Thành công</option>
                                  <option value="1" >Đang xử lý</option>
                            </select>
                         
                         <%} %>
                        </form>
                           
                        </td>
                      </tr>
                      
                      <%} %>
                      
                    </tbody>
                  
                  </table>
									</div>
								</div>
							</div>
						</div>


					</div>
				</div>
				<footer class="footer">
					<div class="container-fluid">
						<nav class="pull-left">
							<ul class="nav">
								<li class="nav-item">
									<a class="nav-link" href="http://www.themekita.com">
										ThemeKita
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#">
										Help
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="https://themewagon.com/license/#free-item">
										Licenses
									</a>
								</li>
							</ul>
						</nav>
						<div class="copyright ml-auto">
							2023, made with <i class="la la-heart heart text-danger"></i> by <a href="http://www.themekita.com">HND ThemeKita</a>
						</div>				
					</div>
				</footer>
			</div>
		</div>
	</div>
	


  
</body>
<!-- <script src="assets/js/core/jquery.3.2.1.min.js"></script> -->

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

  <script>
  function submitForm(formId) {
    var form = document.getElementById('form_' + formId);
    form.submit();
  }
</script>

<script src="${url}/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="${url}/assets/js/core/popper.min.js"></script>
<script src="${url}/assets/js/core/bootstrap.min.js"></script>
<script src="${url}/assets/js/plugin/chartist/chartist.min.js"></script>
<script src="${url}/assets/js/plugin/chartist/plugin/chartist-plugin-tooltip.min.js"></script>
<script src="${url}/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="${url}/assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<script src="${url}/assets/js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
<script src="${url}/assets/js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
<script src="${url}/assets/js/plugin/chart-circle/circles.min.js"></script>
<script src="${url}/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="${url}/assets/js/ready.min.js"></script>

<script src="${url}/assets/js/ready.js"></script>

<script src="${url}/assets/js/jquery.dataTables.min.js"></script>
    <script src="${url}/assets/js/dataTables.bootstrap5.min.js"></script>
    
    
</html>