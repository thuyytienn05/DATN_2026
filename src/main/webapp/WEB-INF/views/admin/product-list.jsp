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
<style>
/* Tùy chỉnh form tìm kiếm */
.card-title .form-control {
	border-radius: 25px;
	padding-left: 45px;
	background-color: #ffffff;
	border: 2px solid #007bff;
	transition: all 0.3s ease;
}

.card-title .form-control:focus {
	background-color: #e3f2fd;
	box-shadow: 0 0 12px rgba(0, 123, 255, 0.4);
}

/* Làm card trông hiện đại hơn */
.card {
	border-radius: 20px;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.15);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	background: linear-gradient(145deg, #ffffff, #f0f0f0);
	border: none;
}

.card:hover {
	transform: translateY(-7px);
	box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.2);
}

/* Bảng sản phẩm - Làm đẹp hơn */
.table {
	border-radius: 12px;
	overflow: hidden;
}

.table thead {
	background-color: #000000;
	color: white;
	text-transform: uppercase;
	font-weight: bold;
}

.table tbody tr:nth-child(odd) {
	background-color: #f1f8ff;
}

.table tbody tr:hover {
	background-color: #969696;
	transition: background 0.3s ease;
	color: white;
}

/* Nút bấm - Làm cho đẹp hơn */
.btn {
	border-radius: 10px;
	transition: all 0.3s ease;
	font-weight: bold;
}

.btn:hover {
	transform: scale(1.08);
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.25);
}

/* Icon mới cho nút bấm */
.btn-warning i {

	font-weight: 900;
}

.btn-danger i {
	
	font-weight: 900;
}

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


#editForm {
    max-width: 700px; /* Đặt chiều rộng tối đa cho form */
    margin: auto; /* Căn giữa form theo chiều ngang */
    background-color: #fff; /* Màu nền */
    border-radius: 8px; /* Bo góc */
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); /* Đổ bóng */
}

#editForm h3 {
    font-weight: bold;
}

#editForm .form-control {
    border-radius: 6px;
}

#editForm button {
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 6px;
}

#previewImage {
    display: block;
    margin: 0 auto;
    border-radius: 8px;
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
				style="background: linear-gradient(135deg, #1e40af, #1e3a8a);" >
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
								<a class="menu-link active" href="/admin/product"> <span
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
				id="kt_wrapper" >
				<div id="kt_header" style="" class="header align-items-stretch">
					<div class="header-brand" style="background: linear-gradient(135deg, #1e40af, #1e3a8a);">
							<a href="/" style="font-size: 24px; font-weight: bold; color: white;">
								AZ
							</a>
							
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

					<div class="toolbar" style="background: linear-gradient(135deg, #1e40af, #1e3a8a);">
							<div class="container-fluid py-6 py-lg-0 d-flex flex-column flex-lg-row align-items-lg-stretch justify-content-lg-between">
								<div class="page-title d-flex flex-column me-5">
									<h1 class="d-flex flex-column text-white fw-bolder fs-3 mb-0 ">TẠO SẢN PHẨM MỚI</h1>
									<ul class="breadcrumb breadcrumb-separatorless fw-bold fs-7 pt-1">
										<li class="breadcrumb-item text-muted">
											<a href="/admin/product" class="text-muted text-hover-primary text-white">Quản lí</a>
										</li>
										<li class="breadcrumb-item">
											<span class="bullet bg-gray-200 w-5px h-2px"></span>
										</li>
										<li class="breadcrumb-item text-white">Sản phẩm</li>
									</ul>
								</div>
							</div>
						</div>
				</div>



				<div class="content d-flex flex-column flex-column-fluid"
					id="kt_content" style="background: linear-gradient(135deg, #dbeafe, #818cf8);">
					<div class="post d-flex flex-column-fluid" id="kt_post">
						<div id="kt_content_container" class="container">
							<div class="card shadow-lg rounded-4 overflow-hidden border-0">
								<div
									class="card-header bg-gradient-primary text-white d-flex justify-content-between align-items-center py-4 px-5">
									<h2 class="card-title text-uppercase fw-bold mb-0">QUẢN LÝ SẢN PHẨM</h2>
									
								</div>
								<div class="card mt-5 p-4" id="editForm" style="background: linear-gradient(135deg, #f3f4f6, #e0e7ff);"">
									<h2 class="card-title text-uppercase fw-bold mb-0 text-center">THÔNG
TIN SẢN PHẨM</h2>
<hr>
									<form:form action="/admin/product/edit" method="post"
										modelAttribute="productEdit">
										<div class="row">
											<div class="col-md-4 text-center" style="max-width: auto; height: auto; display: block;  object-fit: cover; ">
												<!-- Ảnh sản phẩm -->
												<div
class="border rounded-3 overflow-hidden d-flex align-items-center justify-content-center mt-5"
style="width: 200px; height: 200px; background-color: #f0f0f0;">
												<img id="previewImage"
													src="/assets/img/product/${productEdit.image}"
													alt="Product Image" class="img-thumbnail mb-3"
													style="max-width: auto; height: auto; display: block;  object-fit: cover;">
												<c:forEach var="image" items="${product.images}">
													<p>${image}</p>
												</c:forEach>


													</div>
													
												<!-- Ô chọn file ảnh -->
												<input type="file" id="imageUpload" name="imageFile"
													class="form-control mt-2" accept="image/*">
											</div>


											<div class="col-md-8">
    <div class="mb-3">
        <label class="form-label">Mã sản phẩm <span class="text-danger">*</span></label>
        <form:input id="id" path="id" readonly="true" type="number" class="form-control" required="required" />
    </div>
    <div class="mb-3">
        <label class="form-label">Tên sản phẩm <span class="text-danger">*</span></label>
        <form:input id="name" path="name" type="text" class="form-control" required="required" />
    </div>
    <div class="row">
        <div class="col-md-6 mb-3">
            <label class="form-label">Giá <span class="text-danger">*</span></label>
            <form:input id="price" path="price" type="number" min="0" class="form-control" required="required" />
        </div>
        <div class="col-md-6 mb-3">
            <label class="form-label">Số lượng <span class="text-danger">*</span></label>
            <form:input id="quantity" path="quantity" type="number" min="0" class="form-control" required="required" />
        </div>
    </div>
    <div class="mb-3">
        <label class="form-label">Ngày tạo <span class="text-danger">*</span></label>
        <form:input id="createDate" path="createDate" type="text" class="form-control" readonly="true" required="required" />
    </div>
    <div class="d-flex align-items-center mb-5">
        <label class="form-label me-2">Trạng thái: </label>
        <form:checkbox id="isDelete" class="me-1 mb-2" value="true" path="isDelete" /> <p class=" mb-2">Đang hoạt động</p> 
    </div>
    <div class="mb-3">
        <label class="form-label">Danh mục <span class="text-danger">*</span></label> 
        <select id="category" name="categoryId" class="form-control">
            <c:forEach items="${categories}" var="item">
                <option value="${item.id}">${item.name}</option>
            </c:forEach>
        </select>
    </div>
</div>

										</div>
									<hr>
<div class="text-center mt-3">
<button type="submit" class="btn btn-primary">Lưu
thay đổi</button>
</div>
									</form:form>
								</div>
								
								<form action="/admin/product" method="get" class="d-flex align-items-center justify-content-end my-4 me-3">
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
    placeholder="Nhập tên sản phẩm cần tìm...">

        
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
									document
											.getElementById('imageUpload')
											.addEventListener(
													'change',
													function(event) {
														var file = event.target.files[0];

														if (file) {
															var reader = new FileReader();
															reader.onload = function(
																	e) {
																document
																		.getElementById('previewImage').src = e.target.result;
															};
															reader
																	.readAsDataURL(file);
														}
													});
								</script>



								<div class="card-body p-5 bg-light">
									<table
										class="table table-bordered table-hover align-middle text-center shadow rounded-4">
										<thead class="bg-dark text-white text-uppercase">
											<tr class="fw-bold fs-6">
    <th class="py-3 px-4">Sản phẩm</th>
    <th class="py-3 px-4">Số lượng</th>
    <th class="py-3 px-4">Ngày tạo</th>
    <th class="py-3 px-4">Trạng thái</th>
    <th class="py-3 px-4">Hình ảnh</th>
    <th class="py-3 px-4">Hành động</th>
</tr>

										</thead>
										<tbody class="bg-white text-dark fw-semibold">
											<c:forEach items="${productList}" var="p">
												<tr class="border-bottom">
													<td class="text-start py-3 px-4"><a href="#"
														class="text-dark text-hover-primary fw-bold fs-5">${p.name}</a>
														<div class="text-muted small">${p.price}VND</div></td>
													<td class="py-3 px-4">${p.quantity}</td>
													<td class="py-3 px-4">${p.createDate}</td>
													<td class="py-3 px-4"><span
														class="badge ${!p.isDelete ? 'bg-success' : 'bg-danger'} px-3 py-2 fs-6">
															${!p.isDelete ? 'Active' : 'Inactive'} </span></td>
													<!-- Cột mới để hiển thị ảnh sản phẩm -->
													<td class="py-3 px-4 text-center">
    <c:choose>
        <c:when test="${not empty product.images}">
            <c:forEach var="image" items="${product.images}" begin="0" end="0">
                <img src="${pageContext.request.contextPath}/assets/img/product/${image}" 
                     alt="Ảnh sản phẩm" class="img-thumbnail" width="50" height="50">
            </c:forEach>
        </c:when>
        <c:otherwise>
            <img src="${pageContext.request.contextPath}/images/default.png" 
                 alt="Ảnh mặc định" class="img-thumbnail" width="50" height="50">
        </c:otherwise>
    </c:choose>
</td>




													<td class="py-3 px-4 d-flex justify-content-center gap-3">
														<button type="button"
															class="btn btn-lg btn-warning d-flex align-items-center px-3 py-2 shadow-sm"
															onclick="editProduct('${p.id}+${p.name}+${p.price}+${p.quantity}+${p.createDate}+${!p.isDelete}+${p.category.id}+${p.image}')">
															<i class="bi bi-pencil-square me-2 fs-5"></i> Edit
														</button> <a href="/admin/product/delete/${p.id}"
														class="btn btn-lg btn-danger d-flex align-items-center px-3 py-2 shadow-sm">
															<i class="bi bi-trash me-2 fs-5"></i> Delete
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
	</div>
	</div>
	</div>
	</div>
	</div>

	<script type="text/javascript">
	window.onload = function () {
	    function editProduct(pro) {
	        const account = pro.split("+");

	        document.getElementById("id").value = account[0];
	        document.getElementById("name").value = account[1];
	        document.getElementById("price").value = account[2];
	        document.getElementById("quantity").value = account[3];
	        document.getElementById("createDate").value = account[4];
	        document.getElementById("isDelete").checked = (account[5] === 'true');
	        document.getElementById("category").value = account[6];

	        // Hiển thị ảnh sản phẩm
	        const previewImage = document.getElementById("previewImage");
	        if (previewImage) {
	            let imageUrl = account[7]?.trim(); // Lấy tên ảnh, loại bỏ khoảng trắng

	            if (imageUrl) {
	                // Nếu có nhiều ảnh, chỉ lấy ảnh đầu tiên
	                if (imageUrl.includes(",")) {
	                    imageUrl = imageUrl.split(",")[0];
	                }

	                // Kiểm tra nếu ảnh không có tiền tố URL hợp lệ, thêm đường dẫn thư mục
	                if (!imageUrl.startsWith("http") && !imageUrl.startsWith("/")) {
	                    imageUrl = "/assets/img/product/" + imageUrl;
	                }
	            } else {
	                // Nếu không có ảnh, hiển thị ảnh mặc định
	                imageUrl = "/images/default.png";
	            }

	            previewImage.src = imageUrl;
	        } else {
	            console.error("❌ LỖI: Không tìm thấy thẻ <img id='previewImage'> trong HTML!");
	        }

	        // Cuộn trang đến form edit
	        document.getElementById("editForm").scrollIntoView({
	            behavior: "smooth"
	        });
	    }

	    // Gán hàm vào window để gọi từ HTML
	    window.editProduct = editProduct;
	};

	</script>
	<script src="/assets/js/plugins.bundle.js"></script>
	<script src="/assets/js/scripts.bundle.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
		integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
		crossorigin="anonymous"></script>
</body>
</html>