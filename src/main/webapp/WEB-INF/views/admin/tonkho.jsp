<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!--begin::Fonts-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
<!--end::Fonts-->
<!--begin::Global Stylesheets Bundle(used by all pages)-->
<link href="/assets/css/plugins.bundle.css" rel="stylesheet"
	type="text/css" />
<link href="/assets/css/style.bundle.css" rel="stylesheet"
	type="text/css" />
<!--end::Global Stylesheets Bundle-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
	<!-- Thông báo -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
<style type="text/css">
	

.aside-menu .menu .menu-item .menu-link .menu-title {
	color: black;
}

.aside-menu .menu .menu-item .menu-link.active {
	transition: color .2sease, background-color .2sease;
	background-color: #009ef7;
	color: black;
	font-weight: 600;
}

.aside-menu .menu .menu-item .menu-link.active .menu-title {
	color: black;
}
/* Tăng khoảng cách giữa các menu items */
.menu-item {
    margin-bottom: 10px; /* Tăng khoảng cách giữa các mục */
    padding: 12px 15px; /* Tăng khoảng cách trong từng mục */
    border-radius: 8px; /* Bo tròn góc */
    transition: all 0.3s ease-in-out;
}

/* Tăng kích thước icon */
.menu-icon i {
    font-size: 20px;
}

/* Tăng khoảng cách giữa icon và tiêu đề menu */
.menu-icon {
    margin-right: 10px;
}
.menu-link {
    transition: all 0.3s ease-in-out;
}

.menu-link:hover {
    color: black !important;
    font-weight: 600 !important;
    background-color: #a3daff !important;
    border-radius: 5px;
}
.menu-title:hover {
	color: black;
}
		.img_up {
			position: relative;
		    border: 2px dashed #aaa;
		    text-align: center;
		    -webkit-transition: all .6s;
		    transition: all .6s;
		    width: 100%;
		    min-height: 100px;
		}
		
		.input_upload_file {
			position: absolute;
		    top: 0;
		    right: 0;
		    bottom: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    z-index: 10;
		    opacity: 0;
		    cursor: pointer;
		}
		.img_upload_button {
			border: 1px solid transparent;
		    margin: 0!important;
		    min-width: 156px;
		}
		.img_upload_button .file-preview {
		    width: 156px;
		}
		.img_upload_button .file-preview svg{
		    fill: #aaa;
		    height: 36%;
		}
		    .menu-title, .menu-section {
        color: white !important;
    }
    
    .menu-icon i {
    color: white !important;
}
    
	</style>
</style>



</head>

<body>
	<div class="d-flex flex-column flex-root">
		<div class="page d-flex flex-row flex-column-fluid">
			<div id="kt_aside" class="aside " data-kt-drawer="true"
				data-kt-drawer-name="aside"
				data-kt-drawer-activate="{default: true, lg: false}"
				data-kt-drawer-overlay="true"
				data-kt-drawer-width="{default:'200px', '300px': '250px'}"
				data-kt-drawer-direction="start"
				data-kt-drawer-toggle="#kt_aside_mobile_toggle" style="background: linear-gradient(135deg, #1e40af, #1e3a8a);">
				<div class="aside-menu flex-column-fluid ">
					<div class="hover-scroll-overlay-y px-2 my-5 my-lg-5"
						id="kt_aside_menu_wrapper" data-kt-scroll="true"
						data-kt-scroll-height="auto"
						data-kt-scroll-dependencies="{default: '#kt_aside_toolbar, #kt_aside_footer', lg: '#kt_header, #kt_aside_toolbar, #kt_aside_footer'}"
						data-kt-scroll-wrappers="#kt_aside_menu"
						data-kt-scroll-offset="5px">
						<div
							class="menu menu-column menu-title-gray-800 menu-state-title-light menu-state-icon-primary menu-state-bullet-primary menu-arrow-gray-500"
							id="#kt_aside_menu" data-kt-menu="true">
							<div class="menu-item">
								<div class="menu-content pt-8 pb-2">
									<span class="menu-section text-muted text-uppercase fs-8 ls-1 ">Quản lí</span>
								</div>
							</div>
							<div class="menu-item">
								<a class="menu-link " href="/admin/product"> <span
									class="menu-icon"> <span class="svg-icon svg-icon-2">
											<i class="fa-solid fa-bag-shopping"></i>
									</span>
								</span> <span class="menu-title">Sản phẩm</span>
								</a>
							</div>
							<div class="menu-item">
								<a class="menu-link" href="/admin/order"> <span
									class="menu-icon"> <span class="svg-icon svg-icon-2">
											<i class="fa-solid fa-cart-shopping"></i>
									</span>
								</span> <span class="menu-title">Đơn hàng</span>
								</a>
							</div>
							<div class="menu-item">
								<a class="menu-link" href="/admin/user"> <span
									class="menu-icon"> <span class="svg-icon svg-icon-2">
											<i class="fa-solid fa-user-shield"></i>

									</span>
								</span> <span class="menu-title">Người dùng</span>
								</a>
							</div>
								<div class="menu-item">
								<a class="menu-link active" href="/product/report"> <span
									class="menu-icon"> <span class="svg-icon svg-icon-2">
											<i class="fa-solid fa-boxes-stacked"></i> 

									</span>
								</span> <span class="menu-title">Tồn kho</span>
								</a>
							</div>
							<div class="menu-item">
								<a class="menu-link" href="/admin/danhmuc"> <span
									class="menu-icon"> <span class="svg-icon svg-icon-2">
											<i class="fa-solid fa-folder"></i>

									</span>
								</span> <span class="menu-title">Danh mục sản phẩm</span>
								</a>
							</div>
							
							<div class="menu-item mb-5">
								<a class="menu-link" href="/admin/add-product"> <span
									class="menu-icon"> <span class="svg-icon svg-icon-2">
											<i class="fa-solid fa-tags"></i>

									</span>
								</span> <span class="menu-title">Thêm sản phẩm</span>
								</a>
							</div>
													<div class="menu-item mb-5">
    <a class="menu-link " href="/admin/stats"> 
        <span class="menu-icon">
            <span class="svg-icon svg-icon-2">
                <i class="fa-solid fa-chart-line"></i>
            </span>
        </span> 
        <span class="menu-title">Thống Kê</span>
    </a>
</div>
		
								<div class="menu-item m-auto mt-5 bg-warning">

								<a class="menu-link" href="/account/logout"> <span class="menu-icon">
										<span class="svg-icon svg-icon-2"> <i
											class="fa-solid fa-right-from-bracket"></i>
									</span>
								</span>
								<span class="menu-title">Đăng xuất</span>
								</a>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="wrapper d-flex flex-column flex-row-fluid"
				id="kt_wrapper">
				<div id="kt_header" style="" class="header align-items-stretch">
					<div class="header-brand"
						style="background: linear-gradient(135deg, #1e40af, #1e3a8a);">
						<a href="/"
							style="font-size: 24px; font-weight: bold; color: white;">
							AZ </a>
						<div id="kt_aside_toggle"
							class="btn btn-icon w-auto px-0 btn-active-color-primary aside-minimize"
							data-kt-toggle="true" data-kt-toggle-state="active"
							data-kt-toggle-target="body" data-kt-toggle-name="aside-minimize">
							<span class="svg-icon svg-icon-1 me-n1 minimize-default">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none">
                                                    <rect opacity="0.3"
										x="8.5" y="11" width="12" height="2" rx="1" fill="black" />
                                                    <path
										d="M10.3687 11.6927L12.1244 10.2297C12.5946 9.83785 12.6268 9.12683 12.194 8.69401C11.8043 8.3043 11.1784 8.28591 10.7664 8.65206L7.84084 11.2526C7.39332 11.6504 7.39332 12.3496 7.84084 12.7474L10.7664 15.3479C11.1784 15.7141 11.8043 15.6957 12.194 15.306C12.6268 14.8732 12.5946 14.1621 12.1244 13.7703L10.3687 12.3073C10.1768 12.1474 10.1768 11.8526 10.3687 11.6927Z"
										fill="black" />
                                                    <path opacity="0.5"
										d="M16 5V6C16 6.55228 15.5523 7 15 7C14.4477 7 14 6.55228 14 6C14 5.44772 13.5523 5 13 5H6C5.44771 5 5 5.44772 5 6V18C5 18.5523 5.44771 19 6 19H13C13.5523 19 14 18.5523 14 18C14 17.4477 14.4477 17 15 17C15.5523 17 16 17.4477 16 18V19C16 20.1046 15.1046 21 14 21H5C3.89543 21 3 20.1046 3 19V5C3 3.89543 3.89543 3 5 3H14C15.1046 3 16 3.89543 16 5Z"
										fill="black" />
                                                </svg>
							</span> <span class="svg-icon svg-icon-1 minimize-active"> <svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none">
                                                    <rect opacity="0.3"
										width="12" height="2" rx="1"
										transform="matrix(-1 0 0 1 15.5 11)" fill="black" />
                                                    <path
										d="M13.6313 11.6927L11.8756 10.2297C11.4054 9.83785 11.3732 9.12683 11.806 8.69401C12.1957 8.3043 12.8216 8.28591 13.2336 8.65206L16.1592 11.2526C16.6067 11.6504 16.6067 12.3496 16.1592 12.7474L13.2336 15.3479C12.8216 15.7141 12.1957 15.6957 11.806 15.306C11.3732 14.8732 11.4054 14.1621 11.8756 13.7703L13.6313 12.3073C13.8232 12.1474 13.8232 11.8526 13.6313 11.6927Z"
										fill="black" />
                                                    <path
										d="M8 5V6C8 6.55228 8.44772 7 9 7C9.55228 7 10 6.55228 10 6C10 5.44772 10.4477 5 11 5H18C18.5523 5 19 5.44772 19 6V18C19 18.5523 18.5523 19 18 19H11C10.4477 19 10 18.5523 10 18C10 17.4477 9.55228 17 9 17C8.44772 17 8 17.4477 8 18V19C8 20.1046 8.89543 21 10 21H19C20.1046 21 21 20.1046 21 19V5C21 3.89543 20.1046 3 19 3H10C8.89543 3 8 3.89543 8 5Z"
										fill="#C4C4C4" />
                                                </svg>
							</span>
						</div>
						<div class="d-flex align-items-center d-lg-none ms-n3 me-1"
							title="Show aside menu">
							<div class="btn btn-icon btn-active-color-primary w-30px h-30px"
								id="kt_aside_mobile_toggle">
								<span class="svg-icon svg-icon-1"> <svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none">
                                                        <path
											d="M21 7H3C2.4 7 2 6.6 2 6V4C2 3.4 2.4 3 3 3H21C21.6 3 22 3.4 22 4V6C22 6.6 21.6 7 21 7Z"
											fill="black" />
                                                        <path
											opacity="0.3"
											d="M21 14H3C2.4 14 2 13.6 2 13V11C2 10.4 2.4 10 3 10H21C21.6 10 22 10.4 22 11V13C22 13.6 21.6 14 21 14ZM22 20V18C22 17.4 21.6 17 21 17H3C2.4 17 2 17.4 2 18V20C2 20.6 2.4 21 3 21H21C21.6 21 22 20.6 22 20Z"
											fill="black" />
                                                    </svg>
								</span>
							</div>
						</div>
					</div>
					<div class="toolbar" style="background: linear-gradient(135deg, #1e40af, #1e3a8a);">
						<div 
							class="container-fluid py-6 py-lg-0 d-flex flex-column flex-lg-row align-items-lg-stretch justify-content-lg-between">
							<div class="page-title d-flex flex-column me-5">
								<h1 class="d-flex flex-column fw-bolder fs-3 mb-0 text-white">QUẢN LÍ TỒN KHO THEO DANH MỤC
								</h1>
								<ul
									class="breadcrumb breadcrumb-separatorless fw-bold fs-7 pt-1">
									<li class="breadcrumb-item text-muted"><a
										href="/admin/product" class="text-muted text-hover-primary text-white">Quản lí</a>
									</li>
									<li class="breadcrumb-item"><span
										class="bullet bg-gray-200 w-5px h-2px"></span></li>
									<li class="breadcrumb-item text-white">Danh mục</li>
								</ul>
							</div>
						</div>
					</div>
				</div>


				<div class="content d-flex flex-column flex-column-fluid"
					id="kt_content"
					style="background: linear-gradient(135deg, #dbeafe, #818cf8);">
					<div class="post d-flex flex-column" id="kt_post">
						<div id="kt_content_container" class="container">
							<div class="card shadow-lg rounded-4 overflow-hidden border-0"
								style="background: linear-gradient(135deg, #f3f4f6, #e0e7ff);">
								<div class="card-header bg-gradient-primary text-white d-flex justify-content-between align-items-center py-4 px-5">
    <h2 class="card-title text-uppercase fw-bold mb-0">BÁO CÁO TỒN KHO THEO LOẠI HÀNG</h2>
</div>
<form:form action="/admin/product" method="post"
										modelAttribute="productEdit">
							
        <table class="table table-bordered table-hover text-center align-middle shadow-sm rounded-4 overflow-hidden  m-auto mt-3 mb-3" style="width:95%;">
    <thead class="text-white" style="background: linear-gradient(135deg, #4f46e5, #6366f1);">
        <tr>
            <th scope="col" class="py-3"><i class="fas fa-boxes text-warning"></i> Loại hàng</th>
            <th scope="col" class="py-3"><i class="fas fa-dollar-sign text-success"></i> Tổng giá</th>
            <th scope="col" class="py-3"><i class="fas fa-shopping-cart text-primary"></i> Số sản phẩm còn</th>
        </tr>
    </thead>
    <tbody class="table-bordered table-hover">
        <c:forEach var="item" items="${items}">
            <tr class="">
                <td class="fw-bold"> ${item.group}</td>
                <td class="text-success fw-semibold"> ${item.sum} </td>
                <td class="text-primary fw-semibold"> ${item.count} </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

   
			</form:form>				

			
  



							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="/assets/js/plugins.bundle.js"></script>
	<script src="/assets/js/scripts.bundle.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
		integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
		crossorigin="anonymous"></script>
</body>

</html>