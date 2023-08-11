<%@page import="Model.Category"%>
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

	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
	<link rel="stylesheet" href="${url}/assets/css/ready.css">
	<link rel="stylesheet" href="${url}/assets/css/demo.css">

     <!-- font anwersome -->
   
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<script type="text/javascript">
  
$(document).ready(function() {
    
    
    $('.edit').on('click', function() {
        var row = $(this).closest('tr');
        
        // Lấy thông tin từ các thuộc tính data-* của hàng
        var id = row.data('id');
        var name = row.data('name');
        var shoetype = row.data('shoetype');
       
        
        // Điền thông tin vào các input trong modal
        $('#modalUpdate #idmodaledit').val(id);
        $('#modalUpdate #name').val(name);
        $('#modalUpdate #Oname').val(name);
        $('#modalUpdate #shoetype').val(shoetype);
       
      
    });
    
    
});
  
  
</script>


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

                        <li class="nav-item active">
							<a href="managecategory.jsp">
								<i class="la la-bookmark-o"></i>
								<p>Quản lý danh mục</p>
							
							</a>
						</li>

						<li class="nav-item">
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
						<h4 class="page-title">Quản lý danh mục</h4>
                        <div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-header ">			
									    <button class="card-title btn btn-primary" data-toggle="modal" data-target="#modalAdd" style="background-color: #007bff; color: #fff; border: #fff;font-size: 14px; "> <i class="fas fa-plus"></i> Thêm danh mục</button>
									     
									     
									      <% HttpSession ses = request.getSession();
									    String fail =(String) ses.getAttribute("failcategory");
									    if(fail != null){
									  %>
									  
									 		 <h5 style="color: red;"><%=fail%></h5>
									 		 <script type="text/javascript">
									 		    setTimeout(function() {
									             <% ses.removeAttribute("failcategory"); %>
									         }, 20000); // 20 giây
									 		 </script>
									 		 
									 	<%} %>	 
									 	
									 	 <%
									    String exist =(String) ses.getAttribute("existCate");
									    if(exist != null){
									  %>
									  
									 		 <h5 style="color: red;"><%=exist%></h5>
									 		 <script type="text/javascript">
									 		    setTimeout(function() {
									             <% ses.removeAttribute("existCate"); %>
									         }, 20000); // 20 giây
									 		 </script>
									 		 
									 	<%} %>	 
									     
									     
									</div>
									<div class="card-body">
                                        <table
                    id="example"
                    class="table table-striped data-table"
                    style="width: 100%"
                  >
                    <thead>
                      <tr>
                        <th>Mã danh mục</th>
                        <th>Tên danh mục</th>
                        <th>Loại giày </th>
                        <th>Chức năng</th>
                      </tr>
                    </thead>
                    <tbody>
                      <%List<Category> categories = productDao.getListCategorys();
                                 for(Category category : categories){
                                       String name = productDao.getNameShoetype(category.getShoetype_id());
                                                       %>                    
                                                    
                      <tr  data-id="<%= category.getId() %>" data-name="<%= category.getName() %>" data-shoetype="<%= category.getShoetype_id() %>" >
                        <td><%=category.getId()%></td>
                        <td><%=category.getName() %></td>
                        <td><%=name%></td>
                        
                        <td class="td-actions">
                            <div class="form-button-action">
                                <button type="button" data-toggle="modal" data-target="#modalUpdate" title="Edit Task" class="btn btn-link btn-simple-primary edit" style="font-size: 25px;padding: 8px 10px;">
                                    <i class="la la-edit"></i>
                                </button>
                            </div>
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
	

	<!-- modal -->
	<div class="modal fade" id="modalAdd" tabindex="-1" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h6 class="modal-title"><i class="la la-frown-o"></i> Thêm damh mục</h6>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			 <form action="/shopshoe/AddCategory" method="post">
			 
				<div class="modal-body text-center">									
                    <div class="form-group">
                        <label for="squareInput">Tên danh mục</label>
                        <input type="text" class="form-control input-square" id="squareInput" placeholder="Tên danh mục" name = "namecategory">
                    </div>
                    <div class="form-group">
                        <label for="squareInput">Danh mục</label>
                        <select class="form-control input-square" id="squareSelect" name = "shoetype">
                        
							<option value="1">Giày cỏ nhân tạo</option>
							<option value="2">Giày futsal</option>
						   
						</select>
                    </div>
                    
                   

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Thêm</button>
				</div>
			 </form>
			</div>
		</div>
	</div>

    <!-- sửa  -->
	<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h6 class="modal-title"><i class="la la-frown-o"></i> Sửa damh mục</h6>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			 <form action="/shopshoe/EditCategory" method="post">
			 
				<div class="modal-body text-center">									
                    <div class="form-group">
                        <label for="squareInput">Tên danh mục</label>
                        <input type="text" class="form-control input-square" id="name" placeholder="Tên danh mục" name = "namecategory">
                    </div>
                    <div class="form-group">
                        <label for="squareInput">Danh mục</label>
                        <select class="form-control input-square" id="shoetype" name = "shoetype">
                        
							<option value="1">Giày cỏ nhân tạo</option>
							<option value="2">Giày futsal</option>
						   
						</select>
                    </div>
                    
                   

				</div>
				<div class="modal-footer">
				     <input type="hidden" id="idmodaledit" name="idedit" value="">
				      <input type="hidden" id="Oname" name="Onamecate" value="">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Sửa</button>
				</div>
			 </form>
			</div>
		</div>
	</div>

	<!-- end -->
</body>
<!-- <script src="assets/js/core/jquery.3.2.1.min.js"></script> -->





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