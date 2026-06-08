<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>  
<head>
<meta charset="utf-8">
<title>Đăng ký tài khoản</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
<link href="/assets/css/plugins.bundle.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="d-flex flex-column flex-root">
        <div class="d-flex flex-column flex-column-fluid bgi-position-y-bottom position-x-center bgi-no-repeat bgi-size-contain bgi-attachment-fixed" style="background-image: url(assets/media/illustrations/sketchy-1/14.png)">
            <div class="d-flex flex-center flex-column flex-column-fluid p-10 pb-lg-20">
                
                <div class="w-lg-600px bg-body rounded shadow-sm p-10 p-lg-15 mx-auto">
                    <form:form modelAttribute="account" class="form w-100" id="kt_sign_up_form" action="/sign-up" method="post" enctype="multipart/form-data">
                        <div class="mb-10 text-center">
                            <h1 class="text-dark mb-3">Đăng ký tài khoản</h1>
                            <div class="text-gray-400 fw-bold fs-4">
                                Bạn đã có tài khoản? <a href="/sign-in" class="link-primary fw-bolder">Đăng nhập</a>
                            </div>
                        </div>

                        <!-- Hiển thị thông báo thành công -->
                        <c:if test="${not empty success_message}">
                            <div class="alert alert-success">${success_message}</div>
                        </c:if>

                        <!-- Hiển thị lỗi tổng quát -->
                        <c:if test="${not empty error_signup}">
                            <div class="alert alert-danger">${error_signup}</div>
                        </c:if>

                        <!-- Tên đăng nhập -->
                        <div class="fv-row mb-7">
                            <label class="form-label fw-bolder text-dark fs-6">Tên đăng nhập</label>
                            <form:input path="username" class="form-control form-control-lg form-control-solid" type="text" />
                            <form:errors path="username" class="form-text text-danger" />
                        </div>

                        <!-- Họ và tên -->
                        <div class="fv-row mb-7">
                            <label class="form-label fw-bolder text-dark fs-6">Họ và tên</label>
                            <form:input path="fullname" class="form-control form-control-lg form-control-solid" type="text" />
                            <form:errors path="fullname" class="form-text text-danger" />
                        </div>

                        <!-- Email -->
                        <div class="fv-row mb-7">
                            <label class="form-label fw-bolder text-dark fs-6">Email</label>
                            <form:input path="email" class="form-control form-control-lg form-control-solid" type="email" />
                            <form:errors path="email" class="form-text text-danger" />
                        </div>

<!-- <!--                         Ảnh đại diện -->
<!--                         <div class="fv-row mb-7"> -->
<!--                             <label class="form-label fw-bolder text-dark fs-6">Ảnh đại diện</label> -->
<!--                             <input class="form-control form-control-lg form-control-solid" type="file" name="photo" accept="image/*" /> -->
<!--                         </div> -->

                        <!-- Mật khẩu -->
                        <div class="mb-10 fv-row">
                            <label class="form-label fw-bolder text-dark fs-6">Mật khẩu</label>
                            <form:input path="password" class="form-control form-control-lg form-control-solid" type="password" />
                            <form:errors path="password" class="form-text text-danger" />
                        </div>
                        <!-- Xác nhận lại mật khẩu -->
						<!-- Xác nhận lại mật khẩu -->
<div class="mb-10 fv-row">
    <label class="form-label fw-bolder text-dark fs-6">Xác nhận mật khẩu</label>
    <input name="confirm" class="form-control form-control-lg form-control-solid" type="password" />
    <c:if test="${not empty error_signup_confirm}">
        <div class="form-text text-danger">${error_signup_confirm}</div>
    </c:if>
</div>

						                        

                        <!-- Nút Đăng ký -->
                        <div class="text-center">
                            <button type="submit" class="btn btn-lg btn-primary">
                                <span class="indicator-label">Đăng ký</span>
                            </button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
