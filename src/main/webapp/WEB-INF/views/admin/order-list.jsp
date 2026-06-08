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
<!-- SweetAlert2 (Phiên bản mới nhất) -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- Bootstrap 5.3 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Bootstrap Icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<!-- Google Fonts -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700">

<!-- FontAwesome (Chỉ cần 1 lần) -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<!-- Global Stylesheets -->
<link href="/assets/css/plugins.bundle.css" rel="stylesheet"
	type="text/css" />
<link href="/assets/css/style.bundle.css" rel="stylesheet"
	type="text/css" />
		<!-- Thông báo -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>

<style>
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
	margin: 0 !important;
	min-width: 156px;
}

.img_upload_button .file-preview {
	width: 156px;
}

.img_upload_button .file-preview svg {
	fill: #aaa;
	height: 36%;
}

.menu-title, .menu-section {
	color: white !important;
}

.menu-icon i {
	color: white !important;
}
/* Tạo hiệu ứng bo góc và bóng đổ nhẹ */
#kt_table_users {
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

/* Header màu đen, chữ trắng */
#kt_table_users thead {
	background-color: #343a40;
	color: white;
}

/* Bo góc cho header */
#kt_table_users thead tr:first-child th:first-child {
	border-top-left-radius: 10px;
}

#kt_table_users thead tr:first-child th:last-child {
	border-top-right-radius: 10px;
}

/* Hàng xen kẽ màu sáng */
#kt_table_users tbody tr:nth-child(odd) {
	background-color: #f8f9fa;
}

#kt_table_users tbody tr:nth-child(even) {
	background-color: #ffffff;
}

/* Bo góc cho hàng cuối cùng */
#kt_table_users tbody tr:last-child td:first-child {
	border-bottom-left-radius: 10px;
}

#kt_table_users tbody tr:last-child td:last-child {
	border-bottom-right-radius: 10px;
}

/* Badge cho trạng thái đơn hàng */
.badge.bg-success {
	background-color: #28a745 !important;
	color: white;
}

.badge.bg-warning {
	background-color: #ffc107 !important;
	color: black;
}

/* Nút sửa và xóa */
.btn-edit {
	background-color: #ffc107;
	color: black;
	border-radius: 5px;
	padding: 5px 10px;
}

.btn-delete {
	background-color: #dc3545;
	color: white;
	border-radius: 5px;
	padding: 5px 10px;
}
</style>
</head>
<body>
	<div class="d-flex flex-column flex-root">
		<div class="page d-flex flex-row flex-column-fluid">
			<div id="kt_aside" class="aside" data-kt-drawer="true"
				data-kt-drawer-name="aside"
				data-kt-drawer-activate="{default: true, lg: false}"
				data-kt-drawer-overlay="true"
				data-kt-drawer-width="{default:'200px', '300px': '250px'}"
				data-kt-drawer-direction="start"
				data-kt-drawer-toggle="#kt_aside_mobile_toggle"
				style="background: linear-gradient(135deg, #1e40af, #1e3a8a);">
				<div class="aside-menu flex-column-fluid">
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
								<a class="menu-link active" href="/admin/order"> <span
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
								<a class="menu-link" href="/product/report"> <span
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


			<!--  -->
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
								<div style="display: inline-block; cursor: pointer;">
									<div
										style="width: 20px; height: 3px; background-color: white; margin: 3px 0;"></div>
									<div
										style="width: 20px; height: 3px; background-color: white; margin: 3px 0;"></div>
									<div
										style="width: 20px; height: 3px; background-color: white; margin: 3px 0;"></div>
								</div>
							</span> <span class="svg-icon svg-icon-1 minimize-active">
								<div style="display: inline-block; cursor: pointer;">
									<div
										style="width: 20px; height: 3px; background-color: white; margin: 3px 0;"></div>
									<div
										style="width: 20px; height: 3px; background-color: white; margin: 3px 0;"></div>
									<div
										style="width: 20px; height: 3px; background-color: white; margin: 3px 0;"></div>
								</div>
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
											<path opacity="0.3"
											d="M21 14H3C2.4 14 2 13.6 2 13V11C2 10.4 2.4 10 3 10H21C21.6 10 22 10.4 22 11V13C22 13.6 21.6 14 21 14ZM22 20V18C22 17.4 21.6 17 21 17H3C2.4 17 2 17.4 2 18V20C2 20.6 2.4 21 3 21H21C21.6 21 22 20.6 22 20Z"
											fill="black" />
										</svg>
								</span>
							</div>
						</div>
					</div>
					<div class="toolbar"
						style="background: linear-gradient(135deg, #1e40af, #1e3a8a);">
						<div
							class="container-fluid py-6 py-lg-0 d-flex flex-column flex-lg-row align-items-lg-stretch justify-content-lg-between">
							<div class="page-title d-flex flex-column me-5">
								<h1 class="d-flex flex-column text-white fw-bolder fs-3 mb-0 ">QUẢN LÍ ĐƠN HÀNG</h1>
								<ul
									class="breadcrumb breadcrumb-separatorless fw-bold fs-7 pt-1">
									<li class="breadcrumb-item text-muted"><a
										href="/admin/product"
										class="text-muted text-hover-primary text-white">Quản lí</a></li>
									<li class="breadcrumb-item"><span
										class="bullet bg-gray-200 w-5px h-2px"></span></li>
									<li class="breadcrumb-item text-white">Sản phẩm</li>
								</ul>
							</div>
						</div>
					</div>
				</div>




				<div class="content d-flex flex-column flex-column-fluid"
					id="kt_content"
					style="background: linear-gradient(135deg, #dbeafe, #818cf8);">
					<div class="post d-flex flex-column-fluid" id="kt_post">
						<div id="kt_content_container" class="container">
							<div class="card">
								<!-- BẢNG ODER  -->
								<div id="editForm" class="card">
									<div class="card-header">
										<h3 style="margin-top: 20px;">Chi Tiết đơn hàng</h3>
									</div>
									<!-- Chỉnh sửa đơn hàng -->
									<div id="editForm" class="card shadow-lg border-0"
										style='margin: 30px auto; width: 50%; padding: 15px;'>
										<form action="/admin/updateOrder" method="post">
											<!-- Order ID -->
											<div class="mb-3">
												<label class="form-label fw-bold">Order ID</label>
												<div class="input-group">
													<span class="input-group-text"><i
														class="bi bi-upc-scan"></i></span> <input type="text"
														id="orderId" name="orderId" class="form-control" readonly>
												</div>
											</div>

											<!-- User -->
											<div class="mb-3">
												<label class="form-label fw-bold">User</label>
												<div class="input-group">
													<span class="input-group-text"><i
														class="bi bi-person-circle"></i></span> <input type="text"
														id="username" name="username" class="form-control"
														readonly>
												</div>
											</div>

											<!-- Create Date -->
											<div class="mb-3">
												<label class="form-label fw-bold">Create Date</label>
												<div class="input-group">
													<span class="input-group-text"><i
														class="bi bi-calendar-date"></i></span> <input type="text"
														id="createDate" name="createDate" class="form-control">
												</div>
											</div>

											<!-- Total -->
											<div class="mb-3">
												<label class="form-label fw-bold">Total</label>
												<div class="input-group">
													<span class="input-group-text"><i
														class="bi bi-currency-dollar"></i></span> <input type="text"
														id="total" name="total" class="form-control">
												</div>
											</div>

											<!-- Status -->
											<div class="mb-3">
												<label class="form-label fw-bold">Status</label>
												<div class="input-group">
													<span class="input-group-text"><i
														class="bi bi-info-circle"></i></span> <select id="status"
														name="status" class="form-control">
														<option value="">Chọn trạng thái</option>
														<option value="Paid">Đã thanh toán</option>
														<option value="Unpaid">Chưa thanh toán</option>
													</select>
												</div>
											</div>

											<!-- Nút Cập nhật -->
											<button type="submit" class="btn btn-success w-100">
												<i class="bi bi-save"></i> Cập nhật
											</button>
										</form>
									</div>
									<!-- Tìm kiếm  -->
									<form action="/admin/order" method="get" class="d-flex align-items-center justify-content-end my-4 me-3">
    <div class="position-relative w-100" style="max-width: 500px;">
        <!-- Ô nhập liệu -->
        <input type="text" name="id" value="${id}"
    class="form-control form-control-lg px-5 rounded-pill shadow-sm text-center"
    style="border: 1px solid #ddd;
           background: #fff;
           font-size: 16px;
           color: #333;
           height: 50px;
           padding-right: 150px;"
    placeholder="Nhập tên người dùng...">

        
        <!-- Icon kính lúp (có nền) bên trái -->
        <span class="position-absolute top-50 start-0 translate-middle-y bg-light rounded-circle d-flex align-items-center justify-content-center "
              style="width: 40px; height: 40px; margin-left: 5px;">
            <i class="bi bi-search text-primary fs-5"></i>
        </span>

        <!-- Thanh ngăn cách -->
        <span class="position-absolute top-50 end-0 translate-middle-y"
              style="height: 24px; width: 1px; background-color: #ccc; right: 110px;"></span>

        <!-- Các icon bên phải -->
        <div class="position-absolute top-50 end-0 translate-middle-y d-flex align-items-center me-3">
            <i class="bi bi-keyboard text-secondary fs-5 me-3"></i>
            <i class="bi bi-mic text-danger fs-5 me-3"></i>
            <i class="bi bi-camera text-primary fs-5"></i>
        </div>
    </div>
</form>
									
									<!--  -->
									<div class="card-body pt-0" style="margin-top: 30px;">
										<table
											class="table table-striped align-middle table-hover fs-6 gy-5 table-bordered"
											id="kt_table_users">
											<thead class="table-dark text-white rounded-top">
												<tr class="text-start text-uppercase gs-0 text-center">
    <th class="min-w-125px">Mã đơn hàng</th>
    <th class="min-w-125px">Người dùng</th>
    <th class="min-w-125px">Ngày tạo</th>
    <th class="min-w-125px">Tổng tiền</th>
    <th class="min-w-125px">Trạng thái</th>
    <th class="min-w-100px">Hành động</th>
</tr>

											</thead>
											<tbody class="text-gray-800 fw-bold bg-white">
												<c:forEach items="${orderList}" var="o">
													<tr class="border-bottom text-center">
														<td>${o.id}</td>
														<td>${o.account.username}</td>
														<td>${o.createDate}</td>
														<td>${o.total}</td>
														<td><span
															class="badge ${o.status ? 'bg-success' : 'bg-warning'} p-2">
																${o.status ? 'Đã thanh toán' : 'Chưa thanh toán'} </span></td>
														<td class="text-end"><a href="#"
															onclick="detail('${o.id}')"
															class="btn btn-sm btn-warning"> <i
																class="bi bi-pencil-square"></i> Edit
														</a> <a href="#" class="btn btn-sm btn-danger"> <i
																class="bi bi-trash"></i> Delete
														</a></td>
													</tr>
												
												</c:forEach>
											</tbody>
										</table>
									</div>

								</div>

								<!-- Thêm Bootstrap Icons -->
								<link rel="stylesheet"
									href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

							</div>
							<!--  -->
							<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
							<script>
    $(document).ready(function () {
        // Khi nhấp vào một dòng trong bảng
        $("#kt_table_users tbody tr").click(function () {
            // Lấy dữ liệu từ các cột của hàng được click
            var orderId = $(this).find("td:eq(0)").text().trim();
            var username = $(this).find("td:eq(1)").text().trim();
            var createDate = $(this).find("td:eq(2)").text().trim();
            var total = $(this).find("td:eq(3)").text().trim();
            var status = $(this).find("td:eq(4)").text().trim();

            // Đổ dữ liệu vào các input
            $("#orderId").val(orderId);
            $("#username").val(username);
            $("#createDate").val(createDate);
            $("#total").val(total);
            $("#status").val(status === "Đã thanh toán" ? "Paid" : "Unpaid");
        });

        // Khi thay đổi trạng thái thanh toán
        $("#status").change(function () {
            var selectedStatus = $(this).val();
            if (selectedStatus === "Paid") {
                alert("Thanh toán thành công!");
                
                // Gửi dữ liệu cập nhật về server
                $.ajax({
                    url: "/admin/updateOrder",
                    type: "POST",
                    data: {
                        orderId: $("#orderId").val(),
                        status: "Paid"
                    },
                    success: function (response) {
                        alert("Cập nhật trạng thái thành công!");
                    },
                    error: function () {
                        alert("Có lỗi xảy ra khi cập nhật trạng thái!");
                    }
                });
            }
        });
    });
</script>


							<!-- ODER TEST  -->

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	<script type="text/javascript">
		function detail(id) {
			document.getElementById(id+"detailTitle").classList.toggle("d-none");
			
			for (const element of document.getElementsByClassName(id+"detail")) {
				element.classList.toggle("d-none");
			}
		}

		function alertUser(title, message, status){
			swal(
			  title,
			  message,
			  status
	        )
		}
	</script>

	<script src="/assets/js/plugins.bundle.js"></script>
	<script src="/assets/js/scripts.bundle.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
		integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
		crossorigin="anonymous"></script>
</body>
</html>