<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đặt lại mật khẩu</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background: #f4f6f9;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .form-container {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
            max-width: 420px;
            width: 100%;
            text-align: center;
        }
        .form-control {
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid #ced4da;
        }
        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0px 0px 5px rgba(0, 123, 255, 0.5);
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 8px;
            padding: 12px;
            font-weight: bold;
            transition: 0.3s;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .form-title {
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }
        .form-footer {
            margin-top: 15px;
        }
        .form-footer a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        .input-group-text {
            background: #f8f9fa;
            border: 1px solid #ced4da;
            border-radius: 8px 0 0 8px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2 class="form-title text-center">MẬT KHẨU</h3>
        <hr>
        <form action="/reset-password/${username}" method="post">
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                <input type="password" class="form-control" name="password" placeholder="Nhập mật khẩu mới" required>
            </div>
            <c:if test="${not empty error_resetPassword_password}">
                <div class="text-danger">${error_resetPassword_password}</div>
            </c:if>

            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                <input type="password" class="form-control" name="confirm" placeholder="Xác nhận mật khẩu" required>
            </div>
            <c:if test="${not empty error_resetPassword_confirm}">
                <div class="text-danger">${error_resetPassword_confirm}</div>
            </c:if>
            <c:if test="${not empty success_resetPassword}">
                <div class="text-success">${success_resetPassword}</div>
            </c:if>

            <button type="submit" class="btn btn-primary w-100 mt-3">Xác nhận</button>
        </form>
        <div class="form-footer mt-3">
            <a href="/sign-in"><i class="fas fa-sign-in-alt"></i> Quay lại đăng nhập</a>
        </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
