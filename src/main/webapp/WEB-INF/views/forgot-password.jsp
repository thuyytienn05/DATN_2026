<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>  
<head>
<meta charset="ISO-8859-1">
<title>Sign In</title>
	<!--begin::Global Stylesheets Bundle(used by all pages)-->
	<link href="/assets/css/plugins.bundle.css" rel="stylesheet" type="text/css" />
	<link href="/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
	<!--end::Global Stylesheets Bundle-->
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
	<div class="d-flex flex-column flex-root">
		<div class="d-flex flex-column flex-column-fluid bgi-position-y-bottom position-x-center bgi-no-repeat bgi-size-contain bgi-attachment-fixed" style="background-image: url(assets/media/illustrations/sketchy-1/14.png">
			<div class="d-flex flex-center flex-column flex-column-fluid p-10 pb-lg-20">
				
				<div class="w-lg-500px bg-body rounded shadow-sm p-10 p-lg-15 mx-auto">
					<form class="form w-100" novalidate="novalidate" id="kt_password_reset_form" action="/forgot-password" method="post">
						<div class="text-center mb-10">
							<h1 class="text-dark mb-3">Quên mật khẩu?</h1>
							<div class="text-gray-400 fw-bold fs-4">Nhập tên tài khoản của bạn.</div>
						</div>
						<div class="fv-row mb-10">
							<label class="form-label fw-bolder text-gray-900 fs-6">Tài khoản</label>
							<input class="form-control form-control-solid" type="text" placeholder="" value="${username}" name="username" autocomplete="off" />
							<c:if test="${not empty error_forgot_username}">
								<div class="form-text text-danger" >${error_forgot_username}</div>
							</c:if>
							<c:if test="${not empty success_forgot_username}">
								<div class="form-text text-success" >${success_forgot_username}</div>
							</c:if>
						</div>
						<div class="d-flex flex-wrap justify-content-center pb-lg-0">
							<button type="submit" id="kt_password_reset_submit" class="btn btn-lg btn-primary fw-bolder me-4">
								<span class="indicator-label">Tìm</span>
							</button>
							<a href="/sign-in" class="btn btn-lg btn-light-primary fw-bolder">Hủy</a>
						</div>
						<div class="fw-bold fs-6">
					<a href="/sign-in" class="text-muted text-hover-primary px-2"><i class="fas fa-sign-out-alt"></i> Quay lại</a>
				</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="/assets/js/plugins.bundle.js"></script>
	<script src="/assets/js/scripts.bundle.js"></script>
</body>
</html>