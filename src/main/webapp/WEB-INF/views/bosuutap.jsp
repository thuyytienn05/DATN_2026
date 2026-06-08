<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assignment</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
	background: #F8F8F8;
	font-family: Arial, sans-serif;
}

.footer-container {
	display: flex;
	justify-content: space-between;
	padding: 20px;
	background-color: #f5f5f5;
}

.footer-item {
	flex: 1;
	padding: 10px;
}

.footer-item i {
	font-size: 30px;
	color: #ccc;
	display: block;
	margin-bottom: 10px;
}

.footer-item h3 {
	font-size: 16px;
	margin-bottom: 5px;
}

.footer-item p {
	font-size: 14px;
	color: #666;
}

.header__menu .nav-link:hover {
	color: #DCDCDC; /* Màu chữ nhạt đi */
	text-decoration: underline; /* Thêm gạch chân */
	text-decoration-color: #DCDCDC; /* Màu gạch chân là xanh dương */
	text-decoration-thickness: 2px; /* Độ dày của gạch chân */
	text-underline-offset: 5px; /* Khoảng cách gạch chân với chữ */
	font-weight: bold; /* Chữ in đậm */
}

.footer__about img {
	margin-right: 8px;
}

.footer__widget ul li a:hover {
	color: #d1d1d1;
	text-decoration: underline;
}

.footer__widget form input {
	border: 1px solid #ccc;
	background-color: transparent;
	color: #fff;
}

.footer__widget form input::placeholder {
	color: #aaa;
}

.product-card:hover .product__hover {
	opacity: 1 !important;
}
/* Giảm padding trên dưới để navbar gọn hơn */
.navbar-custom {
	padding-top: 4px !important;
	padding-bottom: 4px !important;
}

/* Giảm khoảng cách giữa các phần tử */
.nav-link {
	padding: 4px 6px !important;
}

.navbar .dropdown-toggle {
	font-size: 14px; /* Điều chỉnh kích thước chữ */
	background: none !important; /* Xóa nền */
	border: none !important; /* Xóa viền */
	box-shadow: none !important; /* Xóa hiệu ứng đổ bóng */
	padding: 0; /* Xóa khoảng cách thừa */
}

.navbar .dropdown-toggle:focus, .navbar .dropdown-toggle:hover {
	background: none !important;
	border: none !important;
	box-shadow: none !important;
}

.dropdown-menu {
	display: none;
}

.dropdown:hover .dropdown-menu {
	display: block;
}

.header a {
	text-decoration: none; /* Xóa gạch chân */
}

.header a:hover {
	text-decoration: none; /* Giữ nguyên khi hover */
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

body {
	background-color: #f8f8f8;
}

.collection-container {
	display: flex;
	gap: 15px;
	padding: 20px;
	justify-content: center;
}

.collection-item {
	position: relative;
	width: 45%;
	height: 300px;
	border-radius: 15px;
	background-size: cover;
	background-position: center;
	overflow: hidden;
	display: flex;
	align-items: flex-end;
	padding: 20px;
}

.collection-content {
	color: white;
	text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.7);
}

.collection-content h2 {
	font-size: 28px;
	font-weight: bold;
}

.collection-content p {
	font-size: 14px;
}

.view-btn {
	background-color: rgba(255, 255, 255, 0.8);
	border: none;
	padding: 8px 16px;
	font-size: 14px;
	cursor: pointer;
	border-radius: 5px;
	margin-top: 10px;
}

.fw-tag {
	position: absolute;
	top: 10px;
	right: 15px;
	color: white;
	font-weight: bold;
}

.news-container {
	background: #f5f5f5;
	padding: 20px;
	border-radius: 10px;
}

.news-text {
	padding: 20px;
}

.news-text h3 {
	font-weight: bold;
}

.news-text a {
	color: red;
	font-weight: bold;
	text-decoration: none;
}

.news-text a:hover {
	text-decoration: underline;
}

.news-images img {
	width: 100%;
	border-radius: 8px;
}

.news-card {
	background: #fff;
	border-radius: 10px;
	overflow: hidden;
	transition: all 0.3s;
	border: 1px solid #ddd;
}

.news-card:hover {
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
}

.news-img img {
	width: 100%;
	height: auto;
}

.news-content {
	padding: 15px;
}

.news-content p {
	font-size: 14px;
	color: #666;
}

.news-content h5 {
	font-weight: bold;
}

.read-more {
	color: red;
	font-weight: bold;
	text-decoration: none;
}

.read-more:hover {
	text-decoration: underline;
}

.btn-more {
	display: block;
	width: 200px;
	margin: 20px auto;
	background: red;
	color: #fff;
	border: none;
	border-radius: 20px;
	padding: 10px;
	text-align: center;
	font-weight: bold;
}
</style>
</head>
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
            <a href="shop/cart" class="position-relative nav-link"> 
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
	<!-- Header Section End -->

	<!-- HÌNH  -->
	<img alt="ẢNH"
		src="https://4menshop.com/images/thumbs/slides/banner-top-trang-chu-2-slide-20.png?t=1736355140"
		style="width: 100%; margin: 20px 0px;">

	<!--  -->
	<div class="collection-container" style="margin: 20px 0px;">
		<div class="collection-item"
			style="background-image: url('/assets/img/bosuutap/bosuutap1.jpg');">
			<div class="collection-content">
				<p>RA MẮT BST MỚI</p>
				<h2>CHILLAX</h2>
				<p>chill + (re)lax</p>
			</div>
		</div>
		<div class="collection-item"
			style="background-image: url('/assets/img//bosuutap/bosuutap2.jpg');">
			<div class="collection-content">
				<h2>
					STAY <br> <strong>FOCUSED</strong>
				</h2>
				<p>
					WORD HARD & SUCCESS <br> REMEMBER WHY YOU STARTED
				</p>
				<button class="view-btn">Xem ngay</button>
			</div>
			<span class="fw-tag">FW24</span>
		</div>
	</div>
	<!-- Bộ Suu Tap  -->
	<div class="container my-4">
		<div class="row news-container">
			<!-- Cột nội dung -->
			<div class="col-md-6 news-text">
				<p>
					🕒
					<%= new java.text.SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date()) %></p>
				<h3>UPDATE XU HƯỚNG THỜI TRANG NAM XUÂN HÈ 2025</h3>
				<p>Thời trang nam Xuân Hè 2025 hứa hẹn mang đến nhiều phong cách
					ấn tượng, kết hợp giữa tính ứng dụng cao và yếu tố thẩm mỹ hiện
					đại. Nếu bạn muốn bắt kịp xu hướng và thể hiện phong cách riêng,
					hãy cùng 360 khám phá những xu hướng...</p>
				<a href="#">XEM THÊM +</a>
			</div>

			<!-- Cột hình ảnh -->
			<div class="col-md-6 news-images">
				<div class="row">
					<div class="col-8">
						<img
							src="/assets/img/bosuutap/Toi-gian-Thoi-trang-Anh-ghep-1 (1).jpg"
							alt="Main Image">
					</div>
					<div class="col-4">
						<img src="/assets/img/bosuutap/img_banner_tab.webp"
							alt="Small Image 1">

					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  -->

	<div class="container my-4">
		<div class="row">
			<!-- Bài viết 1 -->
			<div class="col-md-4">
				<div class="news-card">
					<div class="news-img">
						<img  src="https://360.com.vn/wp-content/uploads/2025/01/BANNER-WEB-595X363.jpg" alt="Sale Tết">
					</div>
					<div class="news-content">
						<p>🕒 09/01/2025</p>
						<h5>TẾT XUÂN SƠN – SALE HẾT HÀNG UPTO 60%</h5>
						<p>Chương trình giảm giá đặc biệt lên đến 60% dành cho dịp Tết
							Nguyên Đán...</p>
						<a href="#" class="read-more">XEM THÊM +</a>
					</div>
				</div>
			</div>

			<!-- Bài viết 2 -->
			<div class="col-md-4">
				<div class="news-card">
					<div class="news-img">
						<img style="height: 252px;" src="https://360.com.vn/wp-content/uploads/2024/07/APHTK527-QJDTK502-4.jpg"
							alt="Xu hướng T-Shirts">
					</div>
					<div class="news-content">
						<p>🕒 30/12/2024</p>
						<h5>XU HƯỚNG T-SHIRTS XUÂN HÈ 2025 DÀNH CHO NAM GIỚI</h5>
						<p>T-shirt luôn là item thời trang không thể thiếu trong tủ đồ
							nam giới...</p>
						<a href="#" class="read-more">XEM THÊM +</a>
					</div>
				</div>
			</div>

			<!-- Bài viết 3 -->
			<div class="col-md-4">
				<div class="news-card">
					<div class="news-img">
						<img style="height: 252px;" src="https://360.com.vn/wp-content/uploads/2024/12/PANTONE.png"
							alt="Màu sắc thời trang 2025">
					</div>
					<div class="news-content">
						<p>🕒 24/12/2024</p>
						<h5>XU HƯỚNG MÀU SẮC NĂM 2025: MOCHA MOUSSE & FUTURE DUSK</h5>
						<p>Màu sắc đóng vai trò quan trọng trong lĩnh vực thời trang,
							tạo cảm hứng sáng tạo...</p>
						<a href="#" class="read-more">XEM THÊM +</a>
					</div>
				</div>
			</div>
		</div>

		<!-- Nút Xem thêm -->
		<button class="btn btn-more">Xem thêm</button>
	</div>
	<!-- NỘI DUNG BỘ SƯU TẬP -->
	<section>
		<div class="footer-container">
			<div class="footer-item">
				<i class="fas fa-plane"></i>
				<h3>THANH TOÁN & GIAO HÀNG</h3>
				<p>Miễn phí vận chuyển cho đơn hàng trên 399.000 VNĐ</p>
				<p>- Giao hàng và thu tiền tận nơi</p>
				<p>- Chuyển khoản và giao hàng</p>
				<p>- Mua hàng tại shop</p>
			</div>
			<div class="footer-item">
				<i class="fas fa-credit-card"></i>
				<h3>THẺ THÀNH VIÊN</h3>
				<p>Chế độ ưu đãi thành viên VIP:</p>
				<p>- 5% cho thành viên Bạc</p>
				<p>- 10% cho thành viên Vàng</p>
				<p>- 15% cho thành viên Kim cương</p>
			</div>
			<div class="footer-item">
				<i class="fas fa-clock"></i>
				<h3>GIỜ MỞ CỬA</h3>
				<p>
					<strong>8h30 đến 22:00</strong>
				</p>
				<p>- Tất cả các ngày trong tuần</p>
				<p>- Áp dụng cho tất cả các chi nhánh hệ thống cửa hàng 4MEN</p>
			</div>
			<div class="footer-item">
				<i class="fas fa-headset"></i>
				<h3>HỖ TRỢ 24/7</h3>
				<p>Gọi ngay cho chúng tôi khi bạn có thắc mắc</p>
				<p>
					<strong>0868.444.644</strong>
				</p>
			</div>
		</div>

		<!-- Import FontAwesome cho icon -->
		<script src="https://kit.fontawesome.com/a076d05399.js"
			crossorigin="anonymous"></script>
	</section>

	<!-- Footer Section Begin -->
	<!-- Footer -->
	<footer class="footer text-center text-md-start"
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


	</footer>
	<!-- Bootstrap 5 JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<c:if test="${sortShop == true}">
		<script type="text/javascript">
    		document.getElementById("sortSelect").value = true;
    	</script>
	</c:if>
	<c:if test="${sortShop == false}">
		<script type="text/javascript">
    		document.getElementById("sortSelect").value = false;
    	</script>
	</c:if>

	<script type="text/javascript">
	    document.getElementById("sortSelect").addEventListener("change", function(){
	        location.assign("http://localhost:8080/shop?sort="+document.getElementById("sortSelect").value);
	    });

	    function detail(id) {
	    	location.assign("http://localhost:8080/shop/detail/"+id);
		}

	    async function addToCartOne(id) {
	    	if(${not empty user}){
	    	  const response = await fetch("http://localhost:8080/shop/cart/add?id="+id+"&qty=1");
			}
		    else {
	    	  location.assign("http://localhost:8080/sign-in");
			}
	    }
    </script>

	<!-- Js Plugins -->
	<script src="assets/js/jquery-3.3.1.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.nicescroll.min.js"></script>
	<script src="assets/js/jquery.magnific-popup.min.js"></script>
	<script src="assets/js/jquery.countdown.min.js"></script>
	<script src="assets/js/jquery.slicknav.js"></script>
	<script src="assets/js/mixitup.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>