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
<style>
body {
	background: #F8F8F8;
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

.banner-card img {
	transition: transform 0.3s;
}

.banner-card:hover img {
	transform: scale(1.05);
}

.shop__sidebar__categories ul {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between; /* Dàn đều khoảng cách */
	padding: 0;
	gap: 20px; /* Khoảng cách giữa các danh mục */
}

.category-item {
	display: flex;
	flex-direction: column;
	align-items: center; /* Căn giữa cả ảnh và chữ */
	text-align: center;
	transition: transform 0.2s ease-in-out;
	width: 120px; /* Định kích thước mỗi danh mục */
}

.category-item:hover {
	transform: scale(1.1);
}

.category-icon {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	overflow: hidden;
	background-color: #f8f9fa;
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 8px;
}

.category-icon img {
	max-width: 70%;
	max-height: 70%;
	object-fit: contain;
}

.category-name {
	font-size: 14px;
	font-weight: 500;
	text-align: center; /* Căn giữa chữ */
	display: block;
	width: 100%; /* Đảm bảo chữ không bị lệch */
	color: black !important;
}

/* Thiết lập chung cho thanh tìm kiếm */
.search-form {
	display: flex;
	border: 3px solid #707070; /* Viền cam */
	border-radius: 5px;
	overflow: hidden;
	width: 100%;
}

.search-input {
	flex: 1;
	padding: 12px 15px;
	border: none;
	outline: none;
	font-size: 16px;
	color: #333;
}

.search-btn {
	background-color: #888888; /* Màu cam */
	border: none;
	padding: 12px 18px;
	color: white;
	font-size: 18px;
	cursor: pointer;
}

.search-btn:hover {
	background-color: #E64A19;
}

/* Bộ lọc */
.filter-group {
	display: flex;
	align-items: center;
	gap: 10px;
}

.filter-label {
	font-weight: 500;
	color: #333;
}

.filter-select {
	min-width: 160px;
	border-radius: 5px;
}
.product-card:hover .product__hover {
    opacity: 1 !important;
}
.header a {
    text-decoration: none; /* Xóa gạch chân */
}

.header a:hover {
    text-decoration: none; /* Giữ nguyên khi hover */
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

	<!-- Shop Section Begin -->
	<section class="shop">
		<div class="container">
			<div class="row">
				<div class="row g-3 align-items-center mb-3">
					<!-- Ô tìm kiếm (Bên trái - chiếm nhiều không gian hơn) -->
					<div class="col-lg-6 col-md-7 col-12">
						<form action="/shop" method="get" class="search-form">
							<input type="text" class="search-input" name="name"
								value="${searchShop}" placeholder="Nhập tên sản phẩm">
							<button type="submit" class="search-btn">
								<i class="fas fa-search"></i>
							</button>
						</form>
					</div>

					<!-- Bộ lọc giá (Bên phải) -->
					<div
						class="col-lg-6 col-md-4 col-12 d-flex justify-content-end gap-3">
						<div class="filter-group">
							<label class="filter-label mb-0">Lọc giá:</label>
							 <select
								class="form-select filter-select" id="filterPrice"
								onchange="location.href='/shop?price=' + this.value">
								<option value="0">Dưới 100.000đ</option>
								<option value="1">100.000đ - 200.000đ</option>
								<option value="2">Trên 200.000đ</option>
							</select>
						</div>

					</div>
				</div>


				<div class="card"
					style="background: linear-gradient(135deg, #D3D3D3, #A9A9A9);">
					<div id="collapseOne" class="collapse show mt-2"
						data-bs-parent="#accordionExample">
						<div class="card-body">
							<div class="shop__sidebar__categories">
								<ul class="nice-scroll d-flex flex-wrap gap-3 list-unstyled">
									<li class="text-center category-item" data-category-id="1">
										<a href="/shop?category=1"
										class="d-block text-decoration-none">
											<div class="category-icon">
												<img class="category-image" src="" alt="Áo thun">
											</div>
											<div class="category-name">Áo thun</div>
									</a>
									</li>
									<li class="text-center category-item" data-category-id="2">
										<a href="/shop?category=2"
										class="d-block text-decoration-none">
											<div class="category-icon">
												<img class="category-image" src="" alt="Áo khoác">
											</div>
											<div class="category-name">Áo khoác</div>
									</a>
									</li>
									<li class="text-center category-item" data-category-id="3">
										<a href="/shop?category=3"
										class="d-block text-decoration-none">
											<div class="category-icon">
												<img class="category-image" src="" alt="Áo polo">
											</div>
											<div class="category-name">Áo polo</div>
									</a>
									</li>
									<li class="text-center category-item" data-category-id="4">
										<a href="/shop?category=4"
										class="d-block text-decoration-none">
											<div class="category-icon">
												<img class="category-image" src="" alt="Áo sơ mi">
											</div>
											<div class="category-name">Áo sơ mi</div>
									</a>
									</li>
									<li class="text-center category-item" data-category-id="5">
										<a href="/shop?category=5"
										class="d-block text-decoration-none">
											<div class="category-icon">
												<img class="category-image" src="" alt="Quần jeans">
											</div>
											<div class="category-name">Quần dài</div>
									</a>
									</li>
									<li class="text-center category-item" data-category-id="6">
										<a href="/shop?category=6"
										class="d-block text-decoration-none">
											<div class="category-icon">
												<img class="category-image" src="" alt="Quần short">
											</div>
											<div class="category-name">Quần short</div>
									</a>
									</li>
									<li class="text-center category-item" data-category-id="7">
										<a href="/shop?category=7"
										class="d-block text-decoration-none">
											<div class="category-icon">
												<img class="category-image" src="" alt="Quần dài">
											</div>
											<div class="category-name">Quần jeans</div>
									</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<script>
    // Định nghĩa danh sách ảnh theo ID danh mục
    const categoryImages = {
        "1": "/assets/img/Danhmuc/aothun.png",
        "2": "/assets/img/Danhmuc/aokhoac.png",
        "3": "/assets/img/Danhmuc/aopolo.png",
        "4": "/assets/img/Danhmuc/aosomi.png",
        "5": "/assets/img/Danhmuc/quanjeans.jpeg",
        "6": "/assets/img/Danhmuc/quanshort.jpeg",
        "7": "/assets/img/Danhmuc/quandai.png"
    };

    document.addEventListener("DOMContentLoaded", function () {
        console.log("Dữ liệu categoryImages:", categoryImages); // Debug kiểm tra dữ liệu
        
        document.querySelectorAll(".category-item").forEach(item => {
            const categoryId = item.getAttribute("data-category-id");
            const imgElement = item.querySelector(".category-image");
            
            if (categoryImages[categoryId]) {
                imgElement.src = categoryImages[categoryId]; // Gán ảnh đúng danh mục
            } else {
                imgElement.src = "/assets/img/default.png"; // Ảnh mặc định nếu không có
            }
        });
    });
</script>


				<div class="row g-4">
					<c:forEach items="${products}" var="item">
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div
								class="card border-0 shadow-sm product-card position-relative p-3"
								style="border-radius: 8px; overflow: hidden; transition: box-shadow 0.3s ease-in-out;">
								<div class="product-img-wrapper"
									style="position: relative; cursor: pointer;"
									onclick="detail(${item.key})">
									<img src="assets/img/product/${item.value[3][0]}"
										class="card-img-top product-img" alt="${item.value[0]}"
										style="height: 250px; object-fit: cover; transition: transform 0.3s ease-in-out;">
									<!-- Nhãn giảm giá -->
									<div
										class="position-absolute top-0 start-0 bg-danger text-white px-2 py-1 rounded"
										style="margin: 8px; font-size: 14px;">-30%</div>
									<!-- Hiển thị hover khi di chuột vào ảnh -->
								<!-- Hiển thị hover khi di chuột vào ảnh -->
<ul class="product__hover"
    style="list-style: none; padding: 0; position: absolute; bottom: 10px; right: 10px; 
           display: flex; gap: 5px; opacity: 0; transition: opacity 0.3s ease-in-out;">
    <li>
        <a href="#" class="d-flex align-items-center justify-content-center bg-white rounded-circle shadow"
           style="width: 35px; height: 35px; transition: transform 0.2s;">
            <i class="bi bi-heart-fill" style="color: red; font-size: 18px;"></i>
        </a>
    </li>
    <li>
        <a href="#" class="d-flex align-items-center justify-content-center bg-white rounded-circle shadow"
           style="width: 35px; height: 35px; transition: transform 0.2s;">
            <i class="bi bi-share-fill text-primary" style="font-size: 18px;"></i>
        </a>
    </li>
</ul>


								</div>

								<div class="product__item__text mt-2">
									<h6 class="text-truncate">${item.value[0]}</h6>
									<div class="d-flex justify-content-between align-items-center">
										<span class="text-muted text-decoration-line-through">
											<fmt:formatNumber value="${item.value[1] * 1.3}"
												pattern="#,###" /> &#8363;
										</span> <span class="text-danger fw-bold h5"> <fmt:formatNumber
												value="${item.value[1]}" pattern="#,###" /> &#8363;
										</span>
									</div>
									<div class="rating text-warning mt-1">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star-half-o"></i> <span class="text-muted">(3.8k)</span>
									</div>
									<div class="d-flex justify-content-between mt-2">
										<button onclick="addToCartOne(${item.key})"
											class="btn btn-outline-danger btn-sm">
											<i class="bi bi-cart3" style="font-size: 20px;"></i> Giỏ hàng
										</button>
										<button class="btn btn-outline-dark btn-sm">Mua ngay</button>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>
				</div>


				<!-- Pagination -->
				<div class="d-flex justify-content-center mt-4">
					<nav>
						<ul class="pagination">
							<c:forEach var="i" begin="0" end="${page.totalPages - 1}">
								<li class="page-item ${i == page.number ? 'active' : ''}"
									style="margin: 0 5px;"><a class="page-link" href="?p=${i}"
									style="border-radius: 8px; padding: 10px 15px; transition: 0.3s; 
                              ${i == page.number ? 'background-color: #ff5722; color: white; border: none;' 
                              : 'color: #ff5722; border: 1px solid #ff5722;'}">
										${i + 1} </a></li>
							</c:forEach>
						</ul>
					</nav>
				</div>

			</div>
		</div>
		</div>
	</section>

	<!-- Shop Section End -->
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
	<!-- Footer --> 
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
    await fetch("http://localhost:8080/shop/cart/add?id=" + id + "&qty=1");
    location.assign("http://localhost:8080/shop/cart");
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