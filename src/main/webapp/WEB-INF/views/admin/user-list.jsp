<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Quản lý Tài khoản</title>
    
    <!-- Nunito Sans -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <style>
        :root {
            --primary: #0d6efd;
            --sidebar-bg: #1e3a8a;
        }
        
        body {
            font-family: 'Nunito Sans', system-ui, sans-serif;
            background: #f8fafc;
        }
        
        /* Sidebar */
        #kt_aside {
            background: linear-gradient(180deg, #1e40af, #1e3a8a);
            color: white;
        }
        
        .menu-title, .menu-section {
            color: #e0f2fe !important;
        }
        
        .menu-link {
            color: #bae6fd;
            border-radius: 8px;
            margin: 4px 8px;
            transition: all 0.3s;
        }
        
        .menu-link:hover, .menu-link.active {
            background: rgba(255,255,255,0.15) !important;
            color: white !important;
        }
        
        /* Header */
        #kt_header {
            background: white;
            border-bottom: 1px solid #e2e8f0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        
        /* Main Content */
        #kt_content {
            background: #f8fafc;
        }
        
        .card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.06);
        }
        
        .table {
            border-radius: 12px;
            overflow: hidden;
        }
        
        .badge {
            font-weight: 600;
            padding: 8px 14px;
            border-radius: 9999px;
        }
        
        .form-control, .form-select {
            border-radius: 10px;
            border: 1px solid #cbd5e1;
        }
        
        .btn {
            border-radius: 10px;
            font-weight: 600;
        }
    </style>
</head>
<body>

<div class="d-flex flex-column flex-root">
    <div class="page d-flex flex-row flex-column-fluid">
        
        <!-- Sidebar -->
        <div id="kt_aside" class="aside" style="width: 280px;">
            <div class="aside-menu flex-column-fluid p-4">
                <div class="text-white mb-5 px-3">
                    <h3 class="fw-bold mb-0">AZ Admin</h3>
                    <small class="opacity-75">Quản trị hệ thống</small>
                </div>
                
                <div class="menu menu-column">
                    <div class="menu-item">
                        <div class="menu-content pt-4 pb-2 px-3">
                            <span class="menu-section text-uppercase fs-7 fw-semibold opacity-75">Quản lý</span>
                        </div>
                    </div>
                    
                    <a class="menu-link" href="/admin/product"><i class="fa-solid fa-bag-shopping me-3"></i> Sản phẩm</a>
                    <a class="menu-link" href="/admin/order"><i class="fa-solid fa-cart-shopping me-3"></i> Đơn hàng</a>
                    <a class="menu-link active" href="/admin/user"><i class="fa-solid fa-user-shield me-3"></i> Người dùng</a>
                    <a class="menu-link" href="/product/report"><i class="fa-solid fa-boxes-stacked me-3"></i> Tồn kho</a>
                    <a class="menu-link" href="/admin/danhmuc"><i class="fa-solid fa-folder me-3"></i> Danh mục</a>
                    <a class="menu-link" href="/admin/add-product"><i class="fa-solid fa-tags me-3"></i> Thêm sản phẩm</a>
                    <a class="menu-link" href="/admin/stats"><i class="fa-solid fa-chart-line me-3"></i> Thống kê</a>
                    
                    <div class="mt-auto pt-5">
                        <a class="menu-link text-danger" href="/account/logout">
                            <i class="fa-solid fa-right-from-bracket me-3"></i> Đăng xuất
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="wrapper d-flex flex-column flex-row-fluid">
            <!-- Header -->
            <div id="kt_header" class="header py-4">
                <div class="container-fluid">
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="d-flex align-items-center">
                            <h4 class="fw-bold text-dark mb-0">Quản lý Tài khoản</h4>
                        </div>
                        <div class="d-flex align-items-center gap-3">
                            <span class="badge bg-primary fs-6 px-3 py-2">
                                <i class="bi bi-person-circle me-2"></i> Admin
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Content -->
            <div class="content flex-column-fluid py-5" id="kt_content">
                <div class="container">
                    <div class="card">
                        <div class="card-header bg-white border-0 py-4 px-5">
                            <h2 class="card-title fw-bold text-primary">QUẢN LÝ TÀI KHOẢN NGƯỜI DÙNG</h2>
                        </div>
                        
                        <div class="card-body p-5">
                            <!-- Form chỉnh sửa -->
                            <div class="card shadow-sm mb-5">
                                <div class="card-body p-5">
                                    <form:form id="editForm" action="/admin/user/edit" method="post" 
                                               modelAttribute="userEdit" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-md-4 text-center">
                                                <div class="border border-2 border-light rounded-4 overflow-hidden mx-auto" 
                                                     style="width: 160px; height: 160px;">
                                                    <img id="previewImage" src="/assets/img/avatars/${userEdit.photo}" 
                                                         class="img-fluid h-100 w-100" style="object-fit: cover;">
                                                </div>
                                                <div class="mt-3">
                                                    <input type="file" id="photoFile" name="image" class="form-control" 
                                                           accept="image/*" onchange="previewPhoto(event)">
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-8">
                                                <div class="row g-3">
                                                    <div class="col-12">
                                                        <label class="form-label fw-semibold">Email</label>
                                                        <form:input path="email" type="email" class="form-control" required="required"/>
                                                    </div>
                                                    <div class="col-12">
                                                        <label class="form-label fw-semibold">Họ và tên</label>
                                                        <form:input path="fullname" type="text" class="form-control"/>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-check form-switch mt-4">
                                                            <form:checkbox path="activated" class="form-check-input"/>
                                                            <label class="form-check-label">Kích hoạt tài khoản</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-check form-switch mt-4">
                                                            <form:checkbox path="admin" class="form-check-input"/>
                                                            <label class="form-check-label">Quyền Quản trị viên</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="text-center mt-4">
                                            <button type="submit" class="btn btn-primary px-5 py-2">Lưu thay đổi</button>
                                        </div>
                                    </form:form>
                                </div>
                            </div>

                            <!-- Bảng danh sách -->
                            <div class="table-responsive">
                                <table class="table table-hover align-middle">
                                    <thead class="table-light">
                                        <tr>
                                            <th>Người dùng</th>
                                            <th>Vai trò</th>
                                            <th>Trạng thái</th>
                                            <th class="text-center">Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="acc" items="${accountList}">
                                            <tr>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <img src="/assets/img/avatars/${acc.photo}" 
                                                             class="rounded-circle me-3" width="45" height="45">
                                                        <div>
                                                            <div class="fw-semibold">${acc.fullname}</div>
                                                            <small class="text-muted">${acc.email}</small>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <span class="badge ${acc.admin ? 'bg-primary' : 'bg-secondary'}">
                                                        ${acc.admin ? 'Quản trị viên' : 'Khách hàng'}
                                                    </span>
                                                </td>
                                                <td>
                                                    <span class="badge ${acc.activated ? 'bg-success' : 'bg-danger'}">
                                                        ${acc.activated ? 'Hoạt động' : 'Bị khóa'}
                                                    </span>
                                                </td>
                                                <td class="text-center">
                                                    <button class="btn btn-warning btn-sm me-2" 
                                                            onclick="editUser('${acc.username}', '${acc.email}', '${acc.fullname}', 
                                                                            '${acc.activated}', '${acc.admin}', '${acc.photo}')">
                                                        <i class="bi bi-pencil"></i> Sửa
                                                    </button>
                                                    <a href="/admin/user/delete/${acc.username}" 
                                                       class="btn btn-danger btn-sm">
                                                        <i class="bi bi-trash"></i> Xóa
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

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

function editUser(username, email, fullname, activated, admin, photo) {
    // Logic edit (giữ nguyên)
    document.getElementById("editForm").scrollIntoView({ behavior: "smooth" });
}
</script>

</body>
</html>