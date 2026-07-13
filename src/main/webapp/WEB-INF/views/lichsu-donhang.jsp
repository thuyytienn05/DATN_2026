<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Lịch sử mua hàng</title>

                <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400;500;600;700&display=swap"
                    rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.3/font/bootstrap-icons.min.css">

                <style>
                    body {
                        font-family: 'Nunito Sans', system-ui, sans-serif;
                        background: #f8f9fa;
                    }

                    .page-header {
                        background: linear-gradient(135deg, #ffffff, #f8f9fa);
                        border-bottom: 1px solid #e9ecef;
                        padding: 1.75rem 0;
                        margin-bottom: 2rem;
                    }

                    .card {
                        border: none;
                        border-radius: 16px;
                        box-shadow: 0 2px 12px rgba(0, 0, 0, 0.06);
                    }

                    .status-badge {
                        font-weight: 600;
                        padding: 6px 14px;
                        border-radius: 50px;
                        font-size: 0.85rem;
                    }
                </style>
            </head>

            <body>

                <div class="page-header">
                    <div class="container">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h2 class="fw-bold mb-0">Lịch sử mua hàng</h2>
                                <p class="text-muted mb-0">Quản lý và theo dõi tất cả đơn hàng của bạn</p>
                            </div>
                            <a href="/" class="btn btn-outline-secondary d-flex align-items-center gap-2">
                                <i class="bi bi-arrow-left"></i> Thoát
                            </a>
                        </div>
                    </div>
                </div>

                <div class="container pb-5">

                    <c:if test="${empty orders}">
                        <div class="text-center py-5">
                            <i class="bi bi-bag-x display-1 text-muted"></i>
                            <h4 class="fw-semibold mt-3">Chưa có đơn hàng nào</h4>
                            <a href="${pageContext.request.contextPath}/shop" class="btn btn-primary btn-lg mt-3">
                                <i class="bi bi-shop"></i> Tiếp tục mua sắm
                            </a>
                        </div>
                    </c:if>

                    <c:forEach var="o" items="${orders}">
                        <div class="card mb-4">
                            <div class="card-header d-flex justify-content-between align-items-center flex-wrap gap-3">
                                <div class="d-flex align-items-center gap-3">
                                    <span class="order-id fw-bold">Đơn hàng #${o.id}</span>
                                    <span class="text-muted small">
                                        <i class="bi bi-calendar3"></i>
                                        <fmt:formatDate value="${o.createDate}" pattern="dd/MM/yyyy HH:mm" />
                                    </span>
                                </div>

                                <div class="d-flex align-items-center gap-3">
                                    <c:choose>
                                        <c:when test="${o.status == 0}">
                                            <span class="status-badge bg-secondary text-white"><i
                                                    class="bi bi-clock"></i> Chờ xử lý</span>
                                        </c:when>
                                        <c:when test="${o.status == 1}">
                                            <span class="status-badge bg-info text-white"><i class="bi bi-truck"></i>
                                                Đang giao</span>
                                        </c:when>
                                        <c:when test="${o.status == 2}">
                                            <span class="status-badge bg-success text-white"><i
                                                    class="bi bi-check-circle"></i> Hoàn thành</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status-badge bg-dark text-white">${o.status}</span>
                                        </c:otherwise>
                                    </c:choose>

                                    <!-- Nút Xóa (cách an toàn) -->
                                    <button onclick="confirmDelete('${o.id}')" class="btn btn-outline-danger btn-sm">
                                        <i class="bi bi-trash"></i> Xóa
                                    </button>
                                </div>
                            </div>

                            <div class="card-body p-4">
                                <div class="row mb-4">
                                    <div class="col-md-8">
                                        <p class="mb-1 text-muted small">Địa chỉ nhận hàng</p>
                                        <p class="fw-medium">${o.address}</p>
                                    </div>
                                </div>

                                <div class="table-responsive">
                                    <table class="table table-hover align-middle">
                                        <thead>
                                            <tr>
                                                <th>Sản phẩm</th>
                                                <th class="text-end">Đơn giá</th>
                                                <th class="text-center">Số lượng</th>
                                                <th class="text-end">Thành tiền</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="d" items="${o.orderDetails}">
                                                <tr>
                                                    <td>${d.product.name}</td>
                                                    <td class="text-end">
                                                        <fmt:formatNumber value="${d.price}" pattern="#,###" /> ₫
                                                    </td>
                                                    <td class="text-center">${d.quantity}</td>
                                                    <td class="text-end fw-semibold">
                                                        <fmt:formatNumber value="${d.price * d.quantity}"
                                                            pattern="#,###" /> ₫
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="border-top pt-4 mt-4">
                                    <div class="row justify-content-end">
                                        <div class="col-md-5">
                                            <div class="d-flex justify-content-between mb-2">
                                                <span class="text-muted">Tạm tính:</span>
                                                <span>
                                                    <fmt:formatNumber value="${o.subTotal}" pattern="#,###" /> ₫
                                                </span>
                                            </div>
                                            <div class="d-flex justify-content-between mb-2">
                                                <span class="text-muted">Giảm giá:</span>
                                                <span class="text-success">-
                                                    <fmt:formatNumber value="${o.discountAmount}" pattern="#,###" /> ₫
                                                </span>
                                            </div>
                                            <hr>
                                            <div class="d-flex justify-content-between align-items-center total-amount">
                                                <span>Tổng cộng:</span>
                                                <span>
                                                    <fmt:formatNumber value="${o.total}" pattern="#,###" /> ₫
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script>
                    function confirmDelete(orderId) {
                        if (confirm("Bạn có chắc chắn muốn xóa đơn hàng #" + orderId + " không?\nHành động này không thể hoàn tác!")) {
                            window.location.href = "/order/delete/" + orderId;
                        }
                    }
                </script>

            </body>

            </html>