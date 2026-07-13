<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập</title>
    
    <!-- Nunito Sans -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <link href="/assets/css/plugins.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <style>
        body {
            font-family: 'Nunito Sans', system-ui, sans-serif;
        }
        .form-control {
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="d-flex flex-column flex-root">
        <div class="d-flex flex-column flex-column-fluid bgi-position-y-bottom position-x-center bgi-no-repeat bgi-size-contain bgi-attachment-fixed" 
             style="background-image: url(assets/img/icon/etchy-1/14.png)">
            <div class="d-flex flex-center flex-column flex-column-fluid p-10 pb-lg-20">
                
                <div class="w-lg-500px bg-body rounded shadow-sm p-10 p-lg-15 mx-auto">
                    <form class="form w-100" novalidate="novalidate" action="/sign-in" method="post">
                        <div class="text-center mb-10">
                            <h1 class="text-primary mb-3">ĐĂNG NHẬP</h1>
                            <div class="text-success-400 fw-bold fs-4">
                                Chưa có tài khoản? 
                                <a href="/sign-up" class="link-primary fw-bolder">Đăng ký ngay</a>
                            </div>
                        </div>

                        <div class="fv-row mb-10">
                            <label class="form-label fs-6 fw-bolder text-dark">Tài khoản</label>
                            <input class="form-control form-control-lg form-control-solid" 
                                   type="text" name="username" value="${username}" autocomplete="off" required/>
                            <c:if test="${not empty error_signin_username}">
                                <div class="form-text text-danger">${error_signin_username}</div>
                            </c:if>
                        </div>

                        <div class="fv-row mb-10">
                            <label class="form-label fw-bolder text-dark fs-6">Mật khẩu</label>
                            <div class="input-group">
                                <input id="password" class="form-control form-control-lg form-control-solid" 
                                       type="password" name="password" autocomplete="off" required/>
                                <span class="input-group-text bg-transparent border-0" onclick="togglePassword()">
                                    <i id="eyeIcon" class="fa-solid fa-eye"></i>
                                </span>
                            </div>
                            <c:if test="${not empty error_signin_password}">
                                <div class="form-text text-danger">${error_signin_password}</div>
                            </c:if>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-lg btn-primary w-100">
                                Đăng nhập
                            </button>
                        </div>

                        <div class="text-center mt-5">
                            <a href="/forgot-password" class="link-primary">Quên mật khẩu?</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
       function togglePassword() {
    const password = document.getElementById("password");
    const eye = document.getElementById("eyeIcon");

    if (password.type === "password") {
        password.type = "text";

        eye.classList.remove("fa-eye");
        eye.classList.add("fa-eye-slash");

    } else {
        password.type = "password";

        eye.classList.remove("fa-eye-slash");
        eye.classList.add("fa-eye");
    }
}
    </script>
</body>
</html>