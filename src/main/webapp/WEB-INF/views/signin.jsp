<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>  
<head>
<meta charset="ISO-8859-1">
<title>Sign In</title>
	<!--begin::Fonts-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
	<!--end::Fonts-->
	<!--begin::Global Stylesheets Bundle(used by all pages)-->
	<link href="/assets/css/plugins.bundle.css" rel="stylesheet" type="text/css" />
	<link href="/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
	<!--end::Global Stylesheets Bundle-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
	<div class="d-flex flex-column flex-root">
		<div class="d-flex flex-column flex-column-fluid bgi-position-y-bottom position-x-center bgi-no-repeat bgi-size-contain bgi-attachment-fixed" style="background-image: url(assets/img/icon/etchy-1/14.png">
			<div class="d-flex flex-center flex-column flex-column-fluid p-10 pb-lg-20">
				
				<div class="w-lg-500px bg-body rounded shadow-sm p-10 p-lg-15 mx-auto">
					<form class="form w-100" novalidate="novalidate" id="kt_sign_in_form" action="/sign-in" method="post">
						<div class="text-center mb-10">
							<h1 class="text-primary mb-3">ĐĂNG NHẬP</h1>
							<div class="text-success-400 fw-bold fs-4">Bạn có tài khoản chưa?
							<a href="/sign-up" class="link-primary fw-bolder"> Đăng ký</a></div>
						</div>
						<div class="fv-row mb-10">
							<label class="form-label fs-6 fw-bolder text-dark">Tài khoản</label>
							<input class="form-control form-control-lg form-control-solid" type="text" name="username" value="${username}" autocomplete="off" required="required"/>
							<c:if test="${not empty error_signin_username}">
								<div class="form-text text-danger" >${error_signin_username}</div>
							</c:if>
						</div>
						<div class="fv-row mb-10">
							<div class="d-flex flex-stack mb-2">
								<label class="form-label fw-bolder text-dark fs-6 mb-0">Mật khẩu</label>
								
							</div>
							<input class="form-control form-control-lg form-control-solid" type="password" name="password" autocomplete="off" required="required"/>
							<c:if test="${not empty error_signin_password}">
								<div class="form-text text-danger" >${error_signin_password}</div>
							</c:if>
							<div class="text-end mt-2">
								<a href="/forgot-password" class="link-primary fs-6 fw-bolder">Quên mật khẩu ?</a></div>
						</div>
						
					
				<div class="text-center">
							<button type="submit" id="kt_sign_up_submit" class="btn btn-lg btn-primary">
								<span class="indicator-label">Đăng nhập</span>
							</button>
						</div>
						
						
				<div class="fw-bold fs-6">
					<a href="/" class="text-muted text-hover-primary px-2"><i class="fas fa-sign-out-alt"></i> Quay lại</a>
				</div>
					</form>
				</div>
			</div>
			
			</div>
		</div>

	<script src="/assets/plugins.bundle.js"></script>
	<script src="/assets/js/scripts.bundle.js"></script>
	<script src="/assets/js/general.js"></script>
</body>
</html>