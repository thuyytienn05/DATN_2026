<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assignment</title>
<!-- Bootstrap CSS -->
<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

<!-- Bootstrap 5 CSS (Chỉ giữ phiên bản mới nhất) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap 5 và Popper.js -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Thông báo -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
</head>
<style>
.header a {
    text-decoration: none; /* Xóa gạch chân */
}

.header a:hover {
    text-decoration: none; /* Giữ nguyên khi hover */
}

     
</style>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<header class="header bg-dark py-3 shadow-sm text-white" style="background: linear-gradient(135deg, #696969, #000000); color: #535353;">
    <div class="container">
        <!-- Dòng đầu tiên (Đăng nhập, ngôn ngữ) -->
        <div class="d-flex justify-content-between align-items-center">
            <!-- Bên trái -->
            <div class="d-flex align-items-center">
                <a href="#" class="text-white me-3" data-translate="seller-channel">Kênh Người Bán</a>
                <span class="divider text-white">|</span>
                <a href="#" class="text-white mx-3" data-translate="download-app">Tải ứng dụng</a>
                <span class="divider text-white">|</span>
                <span class="text-white mx-3" data-translate="connect">Kết nối</span>
                <a href="#" class="text-white me-2"><i class="bi bi-facebook"></i></a>
                <a href="#" class="text-white"><i class="bi bi-instagram"></i></a>
            </div>

            <!-- Bên phải -->
            <div class="d-flex align-items-center">
                <a href="#" class="text-white me-3"><i class="bi bi-bell"></i> <span data-translate="notification">Thông báo</span></a>
                <a href="#" class="text-white me-3"><i class="bi bi-question-circle"></i> <span data-translate="support">Hỗ trợ</span></a>

                <!-- Chọn ngôn ngữ -->
                <div class="dropdown">
                    <button id="language-btn" class="btn btn-link text-white dropdown-toggle" type="button" data-bs-toggle="dropdown" style="text-decoration: none;">
                        <i class="bi bi-globe"></i> <span id="selected-lang">Tiếng Việt</span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item language-option" data-lang="vi" href="#">Tiếng Việt</a></li>
                        <li><a class="dropdown-item language-option" data-lang="en" href="#">English</a></li>
                    </ul>
                </div>

                <!-- Tài khoản -->
               <div class="dropdown">
    <c:choose>
        <c:when test="${not empty user}">
            <button class="btn btn-link text-white dropdown-toggle" type="button" data-bs-toggle="dropdown" style="text-decoration: none;">
                <i class="bi bi-person-circle me-1"></i> ${user.fullname}
            </button>
            <ul class="dropdown-menu">
                <c:if test="${user.admin}">
                    <li><a class="dropdown-item" href="/admin/product"><i class="bi bi-speedometer2"></i> <span data-translate="admin">Quản trị</span></a></li>
                </c:if>
                <li><a class="dropdown-item" href="/profile-account"><i class="bi bi-arrow-repeat"></i> <span data-translate="change-password">Đổi mật khẩu</span></a></li>
                <li><a class="dropdown-item" href="/account/logout"><i class="bi bi-box-arrow-right"></i> <span data-translate="logout">Đăng xuất</span></a></li>
            </ul>
        </c:when>
        <c:otherwise>
            <a href="/sign-in" class="text-white ms-3">
                <i class="bi bi-person-circle"></i> <span data-translate="login">Đăng nhập</span>
            </a>
        </c:otherwise>
    </c:choose>
</div>

            </div>
        </div>

        <!-- Dòng thứ hai (Logo, menu, giỏ hàng) -->
        <div class="d-flex align-items-center justify-content-between">
            <!-- Logo bên trái -->
            <a class="navbar-brand fw-bold" href="#" style="font-size:40px;">AZ</a>

            <!-- Menu điều hướng ở giữa -->
          <nav class="navbar navbar-expand-lg navbar-light">
                <ul class="navbar-nav d-flex flex-row">
                    <li class="nav-item"><a class="nav-link me-4 fw-bold text-white" href="/"> <i class="bi bi-house-door fw-bold"></i> <span data-translate="home">Trang chủ</span></a></li>
                    <li class="nav-item"><a class="nav-link me-4 fw-bold text-white" href="/shop"> <i class="bi bi-shop me-2"></i> <span data-translate="shop">Tất cả sản phẩm</span></a></li>
                    <li class="nav-item"><a class="nav-link me-4 fw-bold text-white" href="/bosuutap"> <i class="bi bi-collection me-2"></i> <span data-translate="collection">Bộ sưu tầm</span></a></li>
                    <li class="nav-item"><a class="nav-link me-4 fw-bold text-white" href="/GioiThieu"> <i class="bi bi-info-circle me-2"></i> <span data-translate="about">Giới thiệu</span></a></li>
                </ul>
            </nav>

            <!-- Giỏ hàng bên phải -->
            <a href="#" class="position-relative nav-link"> 
                <i class="bi bi-cart3 fs-5"></i> 
                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                    ${numberCart}
                </span>
            </a>
        </div>
    </div>
</header>

<script>
document.addEventListener("DOMContentLoaded", function () { 
    const translations = {
        vi: { "home": "Trang chủ", "shop": "Tất cả sản phẩm", "collection": "Bộ sưu tầm", "about": "Giới thiệu", "notification": "Thông báo", "support": "Hỗ trợ","admin": "Quản lý", "login": "Đăng nhập", "logout": "Đăng xuất", "change-password": "Đổi mật khẩu", "seller-channel": "Kênh Người Bán", "download-app": "Tải ứng dụng", "connect": "Kết nối" },
        en: { "home": "Home", "shop": "All Products", "collection": "Collection", "about": "About", "notification": "Notification", "support": "Support", "login": "Sign In","admin": "Admin","logout": "Log Out", "change-password": "Change Password", "seller-channel": "Seller Channel", "download-app": "Download App", "connect": "Connect" }
    };

    const currentLang = localStorage.getItem("lang") || "vi";
    updateLanguageUI(currentLang);

    document.querySelectorAll(".language-option").forEach(item => {
        item.addEventListener("click", function (event) {
            event.preventDefault();
            const selectedLang = this.getAttribute("data-lang");
            localStorage.setItem("lang", selectedLang);
            updateLanguageUI(selectedLang);
        });
    });

    function updateLanguageUI(lang) {
        document.getElementById("selected-lang").innerText = lang === "vi" ? "Tiếng Việt" : "English";
        document.body.querySelectorAll("[data-translate]").forEach(element => {
            element.childNodes.forEach(node => {
                if (node.nodeType === Node.TEXT_NODE) {
                    const key = element.getAttribute("data-translate");
                    if (translations[lang][key]) {
                        node.nodeValue = " " + translations[lang][key];
                    }
                }
            });
        });
    }
});
</script>

	<!-- Header Section End -->

	<!-- Shopping Cart Section Begin -->
	<section class="shopping-cart spad mt-5 mb-5">
    <div class="container">
        <div class="row">
            <!-- Cột trái: Bảng sản phẩm -->
            <div class="col-lg-7">
                <div class="card shadow-sm table-light p-1">
                    <table class="table table-hover align-middle text-center ">
                        <thead >
                            <tr class="table-light">
                                <th>Sản phẩm</th>
                                <th>Đơn giá</th>
                                <th>Số lượng</th>
                                <th>Số tiền</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="totalQuantity" value="0" />
                            <c:forEach items="${products}" var="item">
                                <c:set var="totalQuantity" value="${totalQuantity + item.value[2]}" />
                                <tr id="product${item.key.productId}">
                                    <td class="d-flex align-items-center">
                                        <img class="rounded me-3" src="<c:url value="/assets/img/product/${item.value[1][3][0]}" />" alt="" width="80">
                                        <span>${item.value[1][1]}</span>
                                    </td>
                                    <td>
                                        <fmt:formatNumber value="${item.value[1][2]}" pattern="#,###" /> &#8363;
                                    </td>
                                    <td>
                                        <input id="qty${item.key.productId}" min="1" max="${item.value[3].quantity}" 
                                               onblur="changeQty('${item.key.productId}','${item.value[2]}')" 
                                               type="number" class="form-control text-center w-50 mx-auto" 
                                               value="${item.value[2]}">
                                    </td>
                                    <td>
                                        <fmt:formatNumber value="${item.value[1][2] * item.value[2]}" pattern="#,###" /> &#8363;
                                    </td>
                                    <td>
                                        <i onclick="changeDelete('${item.key.productId}')" 
                                           class="fas fa-trash-alt fs-5" style="cursor: pointer;"></i>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Cột phải: Tổng tiền, Mã giảm giá, Thanh toán -->
            <div class="col-lg-5">
    <div class="card p-4 shadow-sm" style="background-color: #FFFFE0;">

        <div class="d-flex justify-content-between align-items-center mb-3">
            <h6 class="me-3"><strong>Tổng cộng</strong> (<fmt:formatNumber value="${totalQuantity}" pattern="#,###" /> sản phẩm):</h6>
            <span class="fw-bold"><fmt:formatNumber value="${totalCart}" pattern="#,###" /> &#8363;</span>
        </div>

        <!-- Phí vận chuyển -->
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h6 class="me-3"><i class="fas fa-truck text-warning"></i> Phí vận chuyển:</h6>
            <span id="shippingFee" class="fw-bold text-primary">Miễn phí</span>
        </div>

        

        <div class="mb-3">
            <h6><i class="fas fa-ticket-alt text-primary"></i> Nhập mã giảm giá</h6>
            <input type="text" class="form-control" name="coupon" placeholder="Nhập mã giảm giá">
        </div>

        <h6 class="mb-3"><i class="fas fa-credit-card text-success"></i> Phương thức thanh toán</h6>
        <select class="form-select mb-3">
            <option value="cod">Thanh toán khi nhận hàng</option>
            <option value="bank">Chuyển khoản ngân hàng</option>
            <option value="momo">Ví MoMo</option>
        </select>

        <h6 class="mb-3"><i class="fas fa-map-marker-alt text-danger"></i> Địa chỉ giao hàng</h6>
       <form action="${totalCart > 0 ? '/shop/order' : '/shop'}" method="${totalCart > 0 ? 'post' : 'get'}">
    <div class="row g-2 mb-3">
        <div class="col-md-6">
            <select class="form-select" name="province" id="provinceSelect" required>
                <option value="">Chọn tỉnh/thành phố</option>
                <option value="hanoi">Hà Nội</option>
                <option value="hochiminh">Hồ Chí Minh</option>
                <option value="danang">Đà Nẵng</option>
            </select>
        </div>
        <div class="col-md-6">
            <select class="form-select" name="district" required>
                <option value="">Chọn quận/huyện</option>
                <option value="baDinh">Ba Đình</option>
                <option value="tanBinh">Tân Bình</option>
                <option value="haiChau">Hải Châu</option>
            </select>
        </div>
    </div>

    <div class="row g-2 mb-3">
        <div class="col-md-5 mb-3">
            <select class="form-select" name="ward" required>
                <option value="">Chọn phường/xã</option>
                <option value="phuong1">Phường Thới Hòa</option>
                <option value="phuong2">Phường Trung Mỹ Tây</option>
                <option value="phuong3">Phường Hiệp Thành</option>
            </select>
        </div>
        <div class="col-md-7 mb-3">
            <input type="text" class="form-control" name="address" placeholder="Nhập tên đường, tòa nhà, số nhà" required>
        </div>
    </div>

    <!-- Tổng tiền sau khi cộng phí vận chuyển -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h5 class="me-3"><strong>Tổng thanh toán:</strong></h5>
        <h5>
            <span id="totalWithShipping" class="fw-bold text-success">
                <fmt:formatNumber value="${totalCart}" pattern="#,###" /> &#8363;
            </span>
        </h5>
    </div>

    <!-- Nút đặt hàng -->
    <button type="submit" class="btn btn-success w-100">
        <i class="fas fa-wallet"></i> Đặt hàng
    </button>
</form>

    </div>
</div>
        </div>
    </div>
</section>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const provinceSelect = document.getElementById("provinceSelect");
    const shippingFeeElement = document.getElementById("shippingFee");
    const totalWithShippingElement = document.getElementById("totalWithShipping");
    const totalCart = ${totalCart}; // Lấy giá trị tổng giỏ hàng từ server

    // Bảng phí vận chuyển
    const shippingFees = {
        hanoi: 20000,
        hochiminh: 25000,
        danang: 15000
    };

    provinceSelect.addEventListener("change", function () {
        const selectedProvince = provinceSelect.value;
        const shippingFee = shippingFees[selectedProvince] || 0;
        
        if (shippingFee > 0) {
            shippingFeeElement.textContent = shippingFee.toLocaleString("vi-VN") + " đ";
        } else {
            shippingFeeElement.textContent = "Miễn phí";
        }

        // Tính tổng thanh toán
        const totalWithShipping = totalCart + shippingFee;
        totalWithShippingElement.textContent = totalWithShipping.toLocaleString("vi-VN") + " đ";
    });
});
</script>
	<!-- Shopping Cart Section End -->

 <!-- TEXT CONTENT -->
	<section>
		<div class="">
			<div class="row"
				style="padding: 100px 100px; background: #fafafa !important; width: 100%;">
				<div class="col-md-4">
					<div class="blog-card"
						style="background: white; padding: 20px; border-radius: 10px; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); transition: 0.3s;">
						<p class="blog-date"
							style="color: #777; font-size: 12px; margin-bottom: 5px;">June
							30, 2017</p>
						<h3 class="blog-title"
							style="font-size: 20px; color: #333; margin-bottom: 10px;">Unique
							Position</h3>
						<p class="blog-description"
							style="color: #949494; font-size: 13px; line-height: 1.6;">
							Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper
							libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc,
							blandit vel, luctus pulvinar, hendrerit.</p>
						<a href="#" class="blog-link"
							style="color: #ff6600; text-decoration: none; font-weight: bold; display: inline-block; margin-top: 10px;">Learn
							more →</a>
					</div>
				</div>
				<div class="col-md-4">
					<div class="blog-card"
						style="background: white; padding: 20px; border-radius: 10px; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); transition: 0.3s;">
						<p class="blog-date"
							style="color: #777; font-size: 12px; margin-bottom: 5px;">June
							30, 2017</p>
						<h3 class="blog-title"
							style="font-size: 20px; color: #333; margin-bottom: 10px;">Something
							in Order</h3>
						<p class="blog-description"
							style="color: #949494; font-size: 13px; line-height: 1.6;">
							Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper
							libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc,
							blandit vel, luctus pulvinar, hendrerit.</p>
						<a href="#" class="blog-link"
							style="color: #ff6600; text-decoration: none; font-weight: bold; display: inline-block; margin-top: 10px;">Learn
							more →</a>
					</div>
				</div>
				<div class="col-md-4">
					<div class="blog-card"
						style="background: white; padding: 20px; border-radius: 10px; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); transition: 0.3s;">
						<p class="blog-date"
							style="color: #777; font-size: 12px; margin-bottom: 5px;">June
							30, 2017</p>
						<h3 class="blog-title"
							style="font-size: 20px; color: #333; margin-bottom: 10px;">Women
							Love Shopping!</h3>
						<p class="blog-description"
							style="color: #949494; font-size: 13px; line-height: 1.6;">
							Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper
							libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc,
							blandit vel, luctus pulvinar, hendrerit.</p>
						<a href="#" class="blog-link"
							style="color: #ff6600; text-decoration: none; font-weight: bold; display: inline-block; margin-top: 10px;">Learn
							more →</a>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- Footer Section Begin -->

	<footer
		class="footer text-center text-md-start"
		style="background: linear-gradient(135deg, #D6D6D6, #8C8C8C); color: #535353; padding: 50px 0px;">
		<div class="container">
			<div class="row">
				<!-- Logo + Social Icons -->
				<div class="col-md-3">
					<div class="footer-logo"
						style="font-weight: bold; font-size: 2.25rem;">AZ</div>
					<p>&copy; Qode Interactive</p>
					<div class="social-icons mt-2" style="display: flex; gap: 15px;">
						<a href="#"><i style="color: gray;" class="fa-brands fa-vimeo"></i></a>
						<a href="#"><i style="color: gray;"
							class="fa-brands fa-instagram"></i></a> <a href="#"><i
							style="color: gray;" class="fa-brands fa-twitter"></i></a> <a
							href="#"><i style="color: gray;"
							class="fa-brands fa-facebook"></i></a> <a href="#"><i
							style="color: gray;" class="fa-brands fa-tumblr"></i></a>
					</div>
				</div>

				<!-- Contact Info -->
				<div class="col-md-3">
					<h5 style="color: #2E2E2E">Locate us</h5>
					<p style="color: #535353">28 Bartholomeo street, NY, NY</p>
					<p style="color: #535353">Phone: 0035 265 244 58</p>
					<p style="color: #535353">Phone: 0035 244 58 265</p>
					<p style="color: #535353">Email: AZ@example.com</p>
				</div>

				<!-- Profile Links -->
				<div class="col-md-3">
					<h5 style="color: #2E2E2E">Profile</h5>
					<ul class="profile-links"
						style="list-style: none; padding: 0; display: flex; flex-direction: column; gap: 10px;">
						<li style="display: flex; align-items: center;"><i
							style="color: gray;" class="fa-solid fa-user"></i> <a href="#"
							style="text-decoration: none; color: #535353; margin-left: 10px;">My
								Account</a></li>
						<li style="display: flex; align-items: center;"><i
							style="color: gray;" class="fa-solid fa-search"></i> <a href="#"
							style="text-decoration: none; color: #535353; margin-left: 10px;">Checkout</a>
						</li>
						<li style="display: flex; align-items: center;"><i
							style="color: gray;" class="fa-solid fa-house"></i> <a href="#"
							style="text-decoration: none; color: #535353; margin-left: 10px;">Order
								Tracking</a></li>
						<li style="display: flex; align-items: center;"><i
							style="color: gray;" class="fa-solid fa-map-marker-alt"></i> <a
							href="#"
							style="text-decoration: none; color: #535353; margin-left: 10px;">Help
								& Support</a></li>
					</ul>
				</div>

				<!-- Subscribe -->
				<div class="col-md-3">
					<h5 style="color: #2E2E2E">Subscribe</h5>
					<div class="subscribe">
						<form action="subscribe.jsp" method="post">
							<input type="email" name="email" placeholder="E-mail" required>
							<button style="color: #535353" type="submit">Subscribe</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div
			style="display: flex; flex-direction: column; align-items: center; text-align: center; margin-top: 50px;">
			<div
				style="width: 600px; height: 1px; background-color: #59554B; margin-bottom: 10px;"></div>
			<h1
				style="color: #535353; font-weight: 400; font-size: 18px; margin-top: 20px;">©
				Copyright 2020 by Mayad Ahmed. All rights reserved.</h1>
		</div>


	</footer> <!-- Bootstrap 5 JS --> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Footer Section End -->

	<script type="text/javascript">
	    function detail(id) {
	    	location.assign("http://localhost:8080/shop/detail/"+id);
		}
	    function changeQty(id, qty) {
	    	location.assign("http://localhost:8080/shop/cart/update?id="+id+"&qty="+document.getElementById('qty'+id).value);  
	    }
	    function changeDelete(id) {
	    	location.assign("http://localhost:8080/shop/cart/delete?id="+id);
	    }
	    function alertUser(title, message, status){
			swal(
			  title,
			  message,
			  status
	        )
		}
    </script>
	<c:if test="${not empty order_success}">
    <script type="text/javascript">
        alertUser('Success!', ' 🎉 Đặt hàng thành công! Cảm ơn bạn đã mua hàng. !', 'success');
        
        // Xóa giỏ hàng sau khi đặt hàng thành công
        setTimeout(function() {
            location.assign("http://localhost:8080/shop/cart");
        }, 2000); // Chuyển hướng sau 2 giây để người dùng thấy thông báo
    </script>
</c:if>

	<!-- Js Plugins -->
	<script src="<c:url value="/assets/js/jquery-3.3.1.min.js" />"></script>
	<script src="<c:url value="/assets/js/bootstrap.min.js"/> "></script>
	<script src="<c:url value="/assets/js/jquery.nice-select.min.js"/>"></script>
	<script src="<c:url value="/assets/js/jquery.magnific-popup.min.js"/> "></script>
	<script src="<c:url value="/assets/js/jquery.countdown.min.js"/> "></script>
	<script src="<c:url value="/assets/js/jquery.slicknav.js"/> "></script>
	<script src="<c:url value="/assets/js/mixitup.min.js"/> "></script>
	<script src="<c:url value="/assets/js/owl.carousel.min.js"/> "></script>
	<script src="<c:url value="/assets/js/main.js"/> "></script>
</body>
</html>