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
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
	<link rel="stylesheet" href="${url}/assets/css/ready.css">
	<link rel="stylesheet" href="${url}/assets/css/demo.css">
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
						<li class="nav-item active ">
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
						<h4 class="page-title">Quản lý</h4>
						<div class="row">
							<div class="col-md-3">
								<div class="card card-stats card-warning">
									<div class="card-body ">
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center">
													<i class="la la-users"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">Số người dùng</p>
													<%int countuser = userDao.getCountUser();
          											  %>
													<h4 class="card-title"><%=countuser%></h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card card-stats card-success">
									<div class="card-body ">
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center">
													<i class="la la-bar-chart"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">Số sản phẩm</p>
													 <%int countProduct = productDao.getCountProduct(); %>
													<h4 class="card-title"><%=countProduct%></h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card card-stats card-danger">
									<div class="card-body">
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center">
													<i class="la la-newspaper-o"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">Đơn hàng đang xử lý</p>
													 <%int cn = orderDao.getHandleOrder(); %>
													<h4 class="card-title"><%=cn%></h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card card-stats card-primary">
									<div class="card-body ">
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center">
													<i class="la la-check-circle"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">Đơn hàng thành công</p>
													 <%int cntsuccess = orderDao.getSuccessOrder(); %>
													<h4 class="card-title"><%=cntsuccess%></h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="row">
							<div class="col-md-3">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Lượng đơn hàng chờ xử lý</h4>
										<p class="card-category">Hoàn thành</p>
									</div>
									<div class="card-body">
										<div id="task-complete" class="chart-circle mt-4 mb-3"></div>
									</div>
									<div class="card-footer">
										<div class="legend"><i class="la la-circle text-primary"></i> Chờ xử lý</div>
									</div>
								</div>
							</div>
							<div class="col-md-9">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Bán giày</h4>
										<p class="card-category">
										Số đơn hàng bị hủy và bán được theo các tháng</p>
									</div>
									<div class="card-body">
										<div id="salesChart" class="chart"></div>
									</div>
								</div>
							</div>
						</div>


						<div class="row">
						
							<div class="col-md-12">
								<div class="card">
									<div class="card-header ">
										<h4 class="card-title">Sản phẩm</h4>
										<p class="card-category">Top sản phẩm bán chạy</p>
									</div>
									<div class="card-body">
										<table class="table table-head-bg-success table-striped table-hover">
											<thead>
												<tr>
													<th scope="col">Mã sản phẩm</th>
													<th scope="col">Tên sản phẩm</th>
													<th scope="col">Giá gốc</th>
													<th scope="col">Giá giảm giá</th>
													<th scope="col">Danh mục</th>
												</tr>
												
												  
											</thead>
											<tbody>
											<%List<Integer> list = orderDao.getBestSelling();
                             for(int o : list){
                            	 Product product = productDao.getProductWishlist(o);
                            	 String nameCate = productDao.getNameCategory(product.getCategory_id());
                            %>
												<tr>
													<td><%=product.getId()%></td>
													<td><%=product.getName()%></td>
													<td><%=new java.text.DecimalFormat("#,###").format(product.getPrice())%> đ</td>
													<td><%=new java.text.DecimalFormat("#,###").format(product.getDiscount())%> đ</td>
													<td><%=nameCate%> </td>
												</tr>
												<%} %>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>


                        <div class="row">
						
							<div class="col-md-12">
								<div class="card">
									<div class="card-header ">
										<h4 class="card-title">Đơn hàng</h4>
										<p class="card-category">Đơn hàng đang xử lý</p>
									</div>
									<div class="card-body">
										<table class="table table-head-bg-success table-striped table-hover">
											<thead>
												<tr>
													<th scope="col">Mã đơn hàng</th>
													<th scope="col">Tên khách hàng</th>
													<th scope="col">Đơn hàng</th>
													<th scope="col">Số lượng</th>
													<th scope="col">Tổng tiền</th>
												</tr>
											</thead>
											
											<tbody>
											 <% List<Orderdetail> orderdetails = orderDao.getListOrderHandle();
                                for(Orderdetail orderdetail : orderdetails){
                                	Product product = productDao.getProductById(orderdetail.getProduct_id());
                                	String nameOrder = orderDao.getNameById(orderdetail.getOrder_id());
                                
                                %>
												<tr>
													<td><%=orderdetail.getId()%></td>
													<td><%=nameOrder%></td>
													<td><%=product.getName()%></td>
													<td><%=orderdetail.getQuantity()%></td>
													 <td><%=new java.text.DecimalFormat("#,###").format(orderdetail.getTotal_money())%> đ</td>
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
<script src="${url}/assets/js/core/jquery.3.2.1.min.js"></script>
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
<script src="${url}/assets/js/demo.js"></script>



<script type="text/javascript">
<%int total = orderDao.getTotalOrder();
  int handler = orderDao.getHandleOrder();
  double piechart = (1.0*handler/total)*100;
  double roundedValue = Math.round(piechart * 10) / 10.0;
%>
Circles.create({
	  id: "task-complete",
	  radius: 75,
	  value: <%=roundedValue%>,
	  maxValue: 100,
	  width: 8,
	  text: function (value) {
	    return value + "%";
	  },
	  colors: ["#eee", "#1D62F0"],
	  duration: 400,
	  wrpClass: "circles-wrp",
	  textClass: "circles-text",
	  styleWrapper: true,
	  styleText: true,
	});

</script>

<script type="text/javascript">

<%
int[] countproductsold = new int[12];
int[] countproductcacel = new int[12];

for(int i =0;i<12;i++){
	countproductsold[i] = 0;
	countproductcacel[i] = 0;
}

List<SalesStatistics> salesStatistics = orderDao.getListSumSales();
for(SalesStatistics sale : salesStatistics){
	if(sale.getMonth() == 1){
		countproductsold[0] = sale.getCountproduct();
		
	}
	if(sale.getMonth() == 2){
		countproductsold[1] = sale.getCountproduct();
		
	}
	if(sale.getMonth() == 3){
		countproductsold[2] = sale.getCountproduct();
		
	}
	if(sale.getMonth() == 4){
		countproductsold[3] = sale.getCountproduct();
		
	}
	if(sale.getMonth() == 5){
		countproductsold[4] = sale.getCountproduct();
		
	}
	if(sale.getMonth() == 6){
		countproductsold[5] = sale.getCountproduct();
	
	}
	if(sale.getMonth() == 7){
		countproductsold[6] = sale.getCountproduct();
		
	}
	if(sale.getMonth() == 8){
		countproductsold[7] = sale.getCountproduct();
		
	}
	if(sale.getMonth() == 9){
		countproductsold[8] = sale.getCountproduct();
		
	}
	if(sale.getMonth() == 10){
		countproductsold[9] = sale.getCountproduct();
			}
	if(sale.getMonth() == 11){
		countproductsold[10] = sale.getCountproduct();
		
	}
	if(sale.getMonth() == 12){
		countproductsold[11] = sale.getCountproduct();
	
	}
	
}
	
	List<SalesStatistics> salesCancel = orderDao.getListSumSalesCancel();
	for(SalesStatistics sale : salesCancel){
		if(sale.getMonth() == 1){
			countproductcacel[0] = sale.getCountproduct();
			
		}
		if(sale.getMonth() == 2){
			countproductcacel[1] = sale.getCountproduct();
			
		}
		if(sale.getMonth() == 3){
			countproductcacel[2] = sale.getCountproduct();
			
		}
		if(sale.getMonth() == 4){
			countproductcacel[3] = sale.getCountproduct();
			
		}
		if(sale.getMonth() == 5){
			countproductcacel[4] = sale.getCountproduct();
			
		}
		if(sale.getMonth() == 6){
			countproductcacel[5] = sale.getCountproduct();
		
		}
		if(sale.getMonth() == 7){
			countproductcacel[6] = sale.getCountproduct();
			
		}
		if(sale.getMonth() == 8){
			countproductcacel[7] = sale.getCountproduct();
			
		}
		if(sale.getMonth() == 9){
			countproductcacel[8] = sale.getCountproduct();
			
		}
		if(sale.getMonth() == 10){
			countproductcacel[9] = sale.getCountproduct();
				}
		if(sale.getMonth() == 11){
			countproductcacel[10] = sale.getCountproduct();
			
		}
		if(sale.getMonth() == 12){
			countproductcacel[11] = sale.getCountproduct();
		
		}
}
%>


var dataSales = {
		  labels: [
		    "Tháng 1",
		    "Tháng 2",
		    "Tháng 3",
		    "Tháng 4",
		    "Tháng 5",
		    "Tháng 6",
		    "Tháng 7",
		    "Tháng 8",
		    "Tháng 9",
		    "Tháng 10",
		    "Tháng 11",
		    "Tháng 12",
		  ],
		  series: [
			  [<%=countproductsold[0]%>, <%=countproductsold[1]%>, <%=countproductsold[2]%>, <%=countproductsold[3]%>, <%=countproductsold[4]%>,
			    	<%=countproductsold[5]%>, <%=countproductsold[6]%>, <%=countproductsold[7]%>, <%=countproductsold[8]%>, <%=countproductsold[9]%>, <%=countproductsold[10]%>,
			    	<%=countproductsold[11]%>],
			  [<%=countproductcacel[0]%>,<%=countproductcacel[1]%>, <%=countproductcacel[2]%>, <%=countproductcacel[3]%>, <%=countproductcacel[4]%>, <%=countproductcacel[5]%>, 
			    	<%=countproductcacel[6]%>, <%=countproductcacel[7]%>, <%=countproductcacel[8]%>, <%=countproductcacel[9]%>, <%=countproductcacel[10]%>, <%=countproductcacel[11]%>],
		    
		  ]
		};
var optionChartSales = {
		  plugins: [Chartist.plugins.tooltip()],
		  seriesBarDistance: 10,
		  axisX: {
		    showGrid: false,
		  },
		  height: "245px",
		};

		var responsiveChartSales = [
		  [
		    "screen and (max-width: 640px)",
		    {
		      seriesBarDistance: 5,
		      axisX: {
		        labelInterpolationFnc: function (value) {
		          return value[0];
		        },
		      },
		    },
		  ],
		];

		Chartist.Bar("#salesChart", dataSales, optionChartSales, responsiveChartSales);

</script>

</html>