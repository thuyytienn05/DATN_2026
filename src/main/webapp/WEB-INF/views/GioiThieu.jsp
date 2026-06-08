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
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
  
<style>
body {
	background: #F8F8F8;
	 font-family: 'Poppins', sans-serif;
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


</style>
</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

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
	<!-- NỌI DUNG GIỚI THIỆU   -->
	<div>
		<h1
			style="font-size: 40px; margin: 30px 0px; color: black; text-align: center;">Về
			thương hiệu thời trang nam 360®</h1>
		<div style="display: flex; justify-content: center;">
			<img style="width: 80%;" alt="anh"
				src="/assets/img/bosuutap/gioithieu1.jpg">
		</div>
		<p
			style="text-align: justify-content; font-size: 16px; margin: 20px 0px; padding: 0px 153px;">
			Ra đời từ 2014, thương hiệu thời trang nam 360 xác định sứ mệnh giúp
			các chàng trai trở nên đẹp và tự tin hơn vào bản thân mình. Ngày nay
			nam giới trẻ đang đứng những cơ hội tuyệt vời của xã hội hiện đại,
			công nghệ thông tin phát triển, cuộc cách mạng của các trang mạng xã
			hội để khẳng định bản thân. Bên cạnh đó, 360 hiểu rằng người trẻ cũng
			đang phải đối diện với những áp lực, thử thách thôi thúc bản thân
			phải thể hiện mình so với những người khác.</p>

		<!--  -->

		<div style="display: flex; justify-content: center;">
			<img style="width: 80%;" alt="anh"
				src="/assets/img/bosuutap/gioithieu2.jpg">
		</div>
		<p
			style="text-align: justify-content; font-size: 16px; margin: 20px 0px; padding: 0px 153px;">
			Thương hiệu thời trang nam 360 ra đời với mong muốn được đồng hành,
			truyền cảm hứng và khuyến khích các bạn nam giới trẻ dám bước ra khỏi
			vùng an toàn để tự do, tự tin thể hiện chính mình theo phong cách phù
			hợp với bản thân. Chính vì thế hệ thống thời trang nam 360 đầu tư tâm
			huyết nghiên cứu thiết kế chi tiết từng sản phẩm để có thể mang lại
			những trải nghiệm mới cho khách hàng, cũng là thông điệp muốn nhắn
			nhủ đến các bạn trẻ hãy cho bản thân trải nghiệm, dám thay đổi, bứt
			phá để vươn lên.</p>
			
			<p
			style="text-align: justify-content; font-size: 16px; margin: 20px 0px; padding: 0px 153px;">
			Chúng ta chỉ thực sự thay đổi khi chúng ta hành động. 360 tin rằng dù có thể thành công hay thất bại, nhưng chắc chắn chỉ có những trải nghiệm mới giúp bạn trưởng thành. Trưởng thành là một hành trình với những dấu mốc thanh xuân, để khi nhìn lại tôi và bạn có thể tự tin không phải nuối tiếc “giá như…”</p>
			
			
			<p
			style="text-align: justify-content; font-size: 16px; margin: 20px 0px; padding: 0px 153px;">
			360 tin rằng mỗi bạn trẻ là một phiên bản độc đáo và duy nhất.</p>
			


	</div>

	<!-- NHÚNG GG MAP -->
	<div onload="initMap()">
    <div class="container mt-4">
        <h2 class="text-center">Hệ thống cửa hàng</h2>
        <div class="row" style="gap:150px; margin: 30px 0px;">
            <div class="col-md-4">
                <h4>Tìm cửa hàng</h4>
                <label>Chọn cửa hàng:</label>
                <select id="storeSelect" class="form-control">
                    <option value="DongDa">TORANO 02 CHÙA BỘC</option>
                    <option value="YenLang">TORANO 31 YÊN LÃNG</option>
                </select>
                <div class="mt-3">
                    <p><strong>TORANO 02 CHÙA BỘC</strong><br>
                        Số 02, Chùa Bộc, Đống Đa, Hà Nội<br>
                        Thời gian: <strong>8:30 - 22:00</strong><br>
                        SĐT: <strong>097 640 8388</strong></p>
                    <p><strong>TORANO 31 YÊN LÃNG</strong><br>
                        Số 31 Yên Lãng, Quận Đống Đa, TP. Hà Nội<br>
                        Thời gian: <strong>8:30 - 22:00</strong><br>
                        SĐT: <strong>0969963658</strong></p>
                </div>
            </div>
            <div class="col-md-4">
                <div id="map" style="height: 500px;">
                 <iframe 
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.691220847089!2d105.841200515402!3d21.02851129319766!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abbd5e5fdfbf%3A0xa4b6a3b2a5d94f64!2zSOG7kyBIw7JhIMSQw6xuaCDEkMOsbmggUGjDuiBUw6Ju!5e0!3m2!1svi!2s!4v1636548749373!5m2!1svi!2s" 
        width="600" 
        height="450" 
        style="border:0;" 
        allowfullscreen="" 
        loading="lazy">
    </iframe>
                </div>
            </div>
        </div>
    </div>
        </div>
      


        
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


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

	<!-- Search End -->
	<script type="text/javascript">
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
</body>
</html>