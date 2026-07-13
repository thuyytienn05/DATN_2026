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
<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link href="/assets/css/plugins.bundle.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    body{
        font-family: 'Nunito Sans', sans-serif;
    }

    input,
    button,
    textarea,
    select,
    label,
    .form-control,
    .btn,
    h1,
    h2,
    h3,
    h4,
    h5,
    h6{
        font-family: 'Nunito Sans', sans-serif !important;
    }

    .input-group .form-control{
        border-right: 0;
    }

    .input-group-text{
        background: #fff;
        border-left: 0;
        cursor: pointer;
    }

    .input-group-text i{
        color: #6c757d;
        font-size: 18px;
        transition: .2s;
    }

    .input-group-text:hover i{
        color: #0d6efd;
    }
</style>
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

    <div class="input-group">
        <form:password
            path="password"
            id="password"
            class="form-control form-control-lg form-control-solid" />

        <span class="input-group-text" style="cursor:pointer;"
              onclick="togglePassword('password','eyePassword')">
            <i id="eyePassword" class="fa-solid fa-eye"></i>
        </span>
    </div>

    <form:errors path="password" class="form-text text-danger" />
</div>
                        <!-- Xác nhận lại mật khẩu -->
						<!-- Xác nhận lại mật khẩu -->
<div class="mb-10 fv-row">
    <label class="form-label fw-bolder text-dark fs-6">
        Xác nhận mật khẩu
    </label>

    <div class="input-group">
        <input
            id="confirmPassword"
            name="confirm"
            class="form-control form-control-lg form-control-solid"
            type="password" />

        <span class="input-group-text" style="cursor:pointer;"
              onclick="togglePassword('confirmPassword','eyeConfirm')">
            <i id="eyeConfirm" class="fa-solid fa-eye"></i>
        </span>
    </div>

    <c:if test="${not empty error_signup_confirm}">
        <div class="form-text text-danger">
            ${error_signup_confirm}
        </div>
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
    <script>
function togglePassword(inputId, eyeId) {

    const input = document.getElementById(inputId);
    const eye = document.getElementById(eyeId);

    if (input.type === "password") {
        input.type = "text";
        eye.classList.remove("fa-eye");
        eye.classList.add("fa-eye-slash");
    } else {
        input.type = "password";
        eye.classList.remove("fa-eye-slash");
        eye.classList.add("fa-eye");
    }
}

</script>
</body>
</html>
