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
								<a class="menu-link active" href="/admin/user"> <span
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
								<h1 class="d-flex flex-column fw-bolder fs-3 mb-0 text-white">QUẢN LÍ TÀI KHOẢN
								</h1>
								<ul
									class="breadcrumb breadcrumb-separatorless fw-bold fs-7 pt-1">
									<li class="breadcrumb-item text-muted"><a
										href="/admin/product" class="text-muted text-hover-primary text-white">Quản lí</a>
									</li>
									<li class="breadcrumb-item"><span
										class="bullet bg-gray-200 w-5px h-2px"></span></li>
									<li class="breadcrumb-item text-white">Người dùng</li>
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
    <h2 class="card-title text-uppercase fw-bold mb-0">QUẢN LÝ TÀI KHOẢN</h2>
</div>

								<div class="d-flex justify-content-center mt-4" >

									<div
										class="card shadow-lg border-0 rounded-4 p-4 bg-light w-100"
										style="max-width: 700px;">
										<form:form id="editForm" action="/admin/user/edit"
											method="post" modelAttribute="userEdit"
											enctype="multipart/form-data"
											class="p-3 border rounded-3 shadow-sm bg-white">
											<h2 class="text-center">THÔNG TIN NGƯỜI DÙNG</h2>
											<hr>
											<!-- Ảnh + Thông tin chung khung -->
											<div class="d-flex align-items-center gap-4 mb-3">
												<!-- Ảnh đại diện -->
												<div
													class="border rounded-3 overflow-hidden d-flex align-items-center justify-content-center mt-5"
													style="width: 150px; height: 150px; background-color: #f0f0f0;">
													<img id="previewImage"
														src="/assets/img/avatars/${userEdit.photo}"
														alt="Ảnh đại diện" class="img-fluid"
														style="max-width: 100%; max-height: 100%; object-fit: cover;">
												</div>

												<!-- Thông tin cá nhân -->
												<div class="w-100">
													<!-- Email -->
													<div class="mb-2">
														<label class="form-label fw-semibold">Email</label>
														<form:input id="email" path="email" type="email"
															class="form-control" required="required" />
													</div>

													<!-- Họ và tên -->
													<div class="mb-2">
														<label class="form-label fw-semibold">Họ và Tên</label>
														<form:input id="fullname" path="fullname" type="text"
															class="form-control" />
													</div>
												</div>
											</div>

											<!-- Hiển thị lỗi -->
											<c:if test="${not empty errorMessages}">
												<div class="alert alert-danger">
													<c:forEach var="error" items="${errorMessages}">
														<p>${error.defaultMessage}</p>
													</c:forEach>
												</div>
											</c:if>

											<!-- Ẩn Tên đăng nhập và Mật khẩu -->
											<form:input id="username" path="username" type="hidden" />
											<form:input id="password" path="password" type="password"
												class="form-control d-none" />

											<!-- Trạng thái & Vai trò -->
											<div class="d-flex align-items-center gap-3 mb-2"
												style="margin-left: 135px;">
												<div class="form-check form-switch">
													<form:checkbox id="activated" path="activated"
														class="form-check-input" />
													<label class="form-check-label" for="activated">Kích
														hoạt</label>
												</div>
												<div class="form-check form-switch"
													style="margin-left: 135px;">
													<form:checkbox id="admin" path="admin"
														class="form-check-input" />
													<label class="form-check-label" for="admin">Quyền
														quản trị</label>
												</div>
											</div>

											<!-- Tải ảnh lên -->
											<div class="mb-2">
												<label class="form-label fw-semibold">Chọn ảnh đại
													diện</label> <input id="photoFile" name="image" type="file"
													class="form-control" accept="image/*"
													onchange="previewPhoto(event)">
											</div>

											<!-- Nút lưu -->
											<div class="text-center">
												<button type="submit"
													class="btn btn-primary w-50 text-center mt-2">Lưu
													thay đổi</button>
											</div>
										</form:form>
									</div>
								</div>
<form action="/admin/user" method="get" class="d-flex align-items-center justify-content-end my-4 me-3" >
    <div class="position-relative w-100" style="max-width: 500px;">
        <!-- Ô nhập liệu -->
        <input type="text" name="name" value="${name}" 
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

								<script>
    function previewPhoto(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById("previewImage").src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    }
</script>

			
  <table class="table table-hover table-striped align-middle text-center border-0 shadow-lg rounded-3 overflow-hidden m-3" style="width:98%;">
    <thead class="table-dark text-uppercase">
        <tr class="fw-bold fs-6">
            <th class="py-3 px-4">Người dùng</th>
            <th class="py-3 px-4">Vai trò</th>
            <th class="py-3 px-4">Kích hoạt</th>
            <th class="py-3 px-4">Thao tác</th>
        </tr>
    </thead>
    <tbody class="table-group-divider fw-semibold border-0">

        <c:forEach var="acc" items="${accountList}">
            <tr class="border-0">
                <!-- Cột User -->
                <td class="d-flex align-items-center px-4 py-3">
                    <div class="rounded-circle overflow-hidden border border-2 border-primary me-3" style="width: 50px; height: 50px;">
                        <a href="#">
                            <img src="/assets/img/avatars/${acc.photo}" class="img-fluid">
                        </a>
                    </div>
                    <div class="d-flex flex-column text-start">
                        <a href="#" class="text-dark fw-bold text-decoration-none">${acc.fullname}</a>
                        <span class="text-muted small">${acc.email}</span>
                    </div>
                </td>

                <!-- Cột Vai trò -->
             <td>
    <span class="badge text-bg-${acc.admin ? 'primary' : 'secondary'} px-3 py-2 fw-bold">
        <i class="bi ${acc.admin ? 'bi-person-badge-fill' : 'bi-person-fill'} me-1"></i>
        ${acc.admin ? 'Quản trị viên' : 'Khách hàng'}
    </span>
</td>

                <!-- Cột Activated -->
                <td>
                    <span class="badge text-bg-${acc.activated ? 'success' : 'danger'} px-3 py-2">
                        <i class="bi ${acc.activated ? 'bi-check-circle-fill' : 'bi-x-circle-fill'} me-1"></i>
                        ${acc.activated ? 'Đang hoạt động' : 'Bị khóa'}
                    </span>
                </td>

                <!-- Cột Thao tác -->
                <td class="d-flex justify-content-center gap-2">
                    <button type="button" class="btn btn-warning btn-sm px-3 py-2 d-flex align-items-center shadow-sm"
                        onclick="editUser('${acc.username}', '${acc.email}', '${acc.fullname}', '${acc.activated}', '${acc.admin}', '${acc.photo}')">
                        <i class="bi bi-pencil-square me-1"></i> Sửa
                    </button>
                    <a href="/admin/user/delete/${acc.username}" class="btn btn-danger btn-sm px-3 py-2 d-flex align-items-center shadow-sm">
                        <i class="bi bi-trash me-1"></i> Xóa
                    </a>
                </td>
            </tr>
        </c:forEach>

    </tbody>
</table>



							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">

                        function editUser(username, email, fullname, activated, admin, photo) {
                            document.getElementById("username").value = username;
                            document.getElementById("email").value = email;
                            document.getElementById("fullname").value = fullname;
                            document.getElementById("activated").checked = (activated === 'true' || activated === true);
                            document.getElementById("admin").checked = (admin === 'true' || admin === true);
                            document.getElementById("password").value = "********"; // Giữ giá trị placeholder
                            // Hiển thị ảnh đại diện
                            document.getElementById("previewImage").src = photo ? "/assets/img/avatars/" + photo : "/images/default.png";

                            // Cuộn đến form chỉnh sửa
                            document.getElementById("editForm").scrollIntoView({ behavior: "smooth" });
                        }

                        function alertUser(title, message, status) {
                            swal(title, message, status);
                        }

                    </script>

	<c:if test="${not empty error_user_delete}">
	<script type="text/javascript">
        alertUser('❌ Lỗi!', 'Không thể xóa người dùng. Vui lòng thử lại sau.', 'error');
    </script>
</c:if>

<c:if test="${not empty success_user_delete}">
	<script type="text/javascript">
        alertUser('✅ Thành công!', 'Người dùng đã được xóa khỏi hệ thống.', 'success');
    </script>
</c:if>

<c:if test="${not empty error_user_update}">
	<script type="text/javascript">
        alertUser('⚠️ Cập nhật thất bại!', 'Có lỗi xảy ra khi cập nhật thông tin. Vui lòng kiểm tra lại dữ liệu.', 'error');
    </script>
</c:if>

<c:if test="${not empty success_user_update}">
	<script type="text/javascript">
        alertUser('🎉 Cập nhật thành công!', 'Thông tin người dùng đã được cập nhật thành công!', 'success');
    </script>
</c:if>


	<script src="/assets/js/plugins.bundle.js"></script>
	<script src="/assets/js/scripts.bundle.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
		integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
		crossorigin="anonymous"></script>
</body>

</html>