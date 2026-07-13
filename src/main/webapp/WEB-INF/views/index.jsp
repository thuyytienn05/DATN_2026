<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="ISO-8859-1">
				<title>Trang chủ</title>
				<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
					rel="stylesheet">
				<!-- Bootstrap Icons -->
				<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

				<!-- Bootstrap 5 CSS (Chỉ giữ phiên bản mới nhất) -->
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

				<!-- FontAwesome -->
				<link rel="stylesheet"
					href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
				<style>
					html,
					body {
						margin: 0;
						padding: 0;
						overflow-x: hidden;
					}

					body {
						font-family: 'Quicksand', sans-serif;
					}

					.banner-card img {
						transition: transform 0.3s;
					}

					.banner-card:hover img {
						transform: scale(1.05);
					}

					.discount-badge {
						position: absolute;
						top: 10px;
						left: 10px;
						background: red;
						color: white;
						padding: 5px 10px;
						font-weight: bold;
						border-radius: 5px;
					}

					.product-card {
						position: relative;
						border-radius: 10px;
						overflow: hidden;
					}

					.flash-sale-header {
						text-align: center;
						font-size: 24px;
						font-weight: bold;
						color: red;
						margin-bottom: 20px;
					}

					.card-img-top {
						with: 100%;
						height: 350px;
					}

					/* Phần filter controls */
					.filter__controls {
						list-style: none;
						display: flex;
						gap: 20px;
						justify-content: center;
						/* canh giữa */
						margin-bottom: 30px;
						padding: 0;
					}

					.filter__controls li {
						cursor: pointer;
						font-weight: 600;
						color: #777;
						position: relative;
						transition: color 0.3s;
					}

					.filter__controls li:hover,
					.filter__controls li.active {
						color: #000;
						/* đậm hơn khi active */
					}

					/* Product Item Container */
					.product__item {
						background: #fff;
						border: 1px solid #eee;
						position: relative;
						margin-bottom: 30px;
						overflow: hidden;
						/* để ẩn phần hover */
						transition: box-shadow 0.3s;
					}

					.product__item:hover {
						box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
					}

					/* Ảnh sản phẩm (dùng background) */
					.product__item__pic {
						position: relative;
						background-size: cover;
						background-position: center;
						padding-top: 100%;
						/* tạo tỷ lệ vuông: height = width */
						cursor: pointer;
						overflow: hidden;
					}

					.product__item__pic:hover .product__hover {
						opacity: 1;
						visibility: visible;
					}

					/* Nhãn sale/new góc trên trái */
					.product__item__pic .label {
						position: absolute;
						top: 10px;
						left: 10px;
						background: #e74c3c;
						color: #fff;
						font-size: 0.75rem;
						font-weight: 700;
						padding: 4px 8px;
						border-radius: 4px;
					}

					/* Hover icon (heart, compare, search) */
					.product__hover {
						position: absolute;
						bottom: 10px;
						right: 10px;
						display: flex;
						gap: 10px;
						opacity: 0;
						visibility: hidden;
						transition: all 0.3s;
					}

					.product__hover li {
						list-style: none;
					}

					.product__hover li a {
						display: flex;
						align-items: center;
						justify-content: center;
						width: 40px;
						/* Kích thước khung tròn */
						height: 40px;
						background: white;
						border-radius: 50%;
						/* Làm tròn */
						box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
						/* Hiệu ứng bóng */
						transition: background 0.3s ease-in-out;
						text-decoration: none;
						/* Bỏ gạch chân mặc định */
					}

					.product__hover li a:hover {
						background: #ffdddd;
						/* Màu nền khi hover */
					}

					.product__hover li a i {
						font-size: 20px;
						color: red;
					}

					/* Text thông tin sản phẩm */
					.product__item__text {
						padding: 15px;

					}

					.product__item__text h6 {
						font-size: 1rem;
						overflow: hidden;
					}

					.add-cart {
						color: #555;
						font-size: 0.9rem;
						font-weight: 600;
						cursor: pointer;
					}

					.add-cart:hover {
						color: #000;
					}

					.rating i {
						color: #FFD700;
						/* màu sao vàng */
						margin-right: 2px;
					}

					.rating i.fa-star-o:before {
						content: "\f005";
						/* icon sao rỗng thay bằng sao đặc nếu cần */
						color: #ccc;
					}

					.product__item__text h5 {
						margin-top: 5px;
						font-size: 1rem;
						color: #e74c3c;
						font-weight: 700;
					}

					.products {
						background: #DCDCDC;
					}

					/*  */
					.navbar-custom {
						background-color: #f8f9fa;
						padding: 10px;
					}

					.login-section {
						display: flex;
						align-items: center;
						color: #6c757d;
						font-size: 12px;
						cursor: pointer;
					}

					.login-section i {
						font-size: 12px;
						margin-right: 2px;
					}

					.language-dropdown i {
						font-size: 14px;
						margin-right: 5px;
					}

					/* Thu nhỏ chữ và icon */
					.small-text {
						font-size: 14px;
					}

					.small-icon {
						font-size: 14px;
					}

					/* Giảm padding trên dưới để navbar gọn hơn */
					.navbar-custom {
						padding-top: 4px !important;
						padding-bottom: 4px !important;
					}

					.navbar .dropdown-toggle {

						background: none !important;
						/* Xóa nền */
						border: none !important;
						/* Xóa viền */
						box-shadow: none !important;
						/* Xóa hiệu ứng đổ bóng */

					}

					.navbar .dropdown-toggle:focus,
					.navbar .dropdown-toggle:hover {
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
						text-decoration: none;
						/* Xóa gạch chân */
					}

					.header a:hover {
						text-decoration: none;
						/* Giữ nguyên khi hover */
					}
				</style>

			<body style="background-color: #F8F8F8;">
				<!-- Header Section Begin -->
				<header class="header bg-dark py-3 shadow-sm text-white"
					style="background: linear-gradient(135deg, #696969, #000000); color: #535353;">
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
								<a href="#" class="text-white me-3"><i class="bi bi-bell"></i> <span
										data-translate="notification">Thông báo</span></a>
								<a href="#" class="text-white me-3"><i class="bi bi-question-circle"></i> <span
										data-translate="support">Hỗ trợ</span></a>

								<!-- Chọn ngôn ngữ -->
								<div class="dropdown">
									<button id="language-btn" class="btn btn-link text-white dropdown-toggle"
										type="button" data-bs-toggle="dropdown" style="text-decoration: none;">
										<i class="bi bi-globe"></i> <span id="selected-lang">Tiếng Việt</span>
									</button>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item language-option" data-lang="vi" href="#">Tiếng
												Việt</a></li>
										<li><a class="dropdown-item language-option" data-lang="en" href="#">English</a>
										</li>
									</ul>
								</div>

								<!-- Tài khoản -->
								<div class="dropdown">
									<c:choose>
										<c:when test="${not empty user}">
											<button class="btn btn-link text-white dropdown-toggle" type="button"
												data-bs-toggle="dropdown" style="text-decoration: none;">
												<i class="bi bi-person-circle me-1"></i> ${user.fullname}
											</button>
											<ul class="dropdown-menu">
												<c:if test="${user.admin}">
													<li><a class="dropdown-item" href="/admin/product"><i
																class="bi bi-speedometer2"></i> <span
																data-translate="admin">Quản trị</span></a></li>
												</c:if>
												<li><a class="dropdown-item" href="/account/lich-su-don-hang"><i
															class="bi bi-receipt"></i> Lịch sử mua hàng</a></li>
												<li><a class="dropdown-item" href="/profile-account"><i
															class="bi bi-arrow-repeat"></i> <span
															data-translate="change-password">Đổi mật khẩu</span></a>
												</li>
												<li><a class="dropdown-item" href="/account/logout"><i
															class="bi bi-box-arrow-right"></i> <span
															data-translate="logout">Đăng xuất</span></a></li>
											</ul>
										</c:when>
										<c:otherwise>
											<a href="/sign-in" class="text-white ms-3">
												<i class="bi bi-person-circle"></i> <span data-translate="login">Đăng
													nhập</span>
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
									<li class="nav-item"><a class="nav-link me-4 fw-bold text-white" href="/"> <i
												class="bi bi-house-door fw-bold"></i> <span data-translate="home">Trang
												chủ</span></a></li>
									<li class="nav-item"><a class="nav-link me-4 fw-bold text-white" href="/shop"> <i
												class="bi bi-shop me-2"></i> <span data-translate="shop">Tất cả sản
												phẩm</span></a></li>
									<li class="nav-item"><a class="nav-link me-4 fw-bold text-white" href="/bosuutap">
											<i class="bi bi-collection me-2"></i> <span data-translate="collection">Bộ
												sưu tầm</span></a></li>
									<li class="nav-item"><a class="nav-link me-4 fw-bold text-white" href="/GioiThieu">
											<i class="bi bi-info-circle me-2"></i> <span data-translate="about">Giới
												thiệu</span></a></li>
								</ul>
							</nav>

							<!-- Giỏ hàng bên phải -->
							<a href="shop/cart" class="position-relative nav-link">
								<i class="bi bi-cart3 fs-5"></i>
								<span
									class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
									${numberCart}
								</span>
							</a>
						</div>
					</div>
				</header>

				<script>
					document.addEventListener("DOMContentLoaded", function () {
						const translations = {
							vi: { "home": "Trang chủ", "shop": "Tất cả sản phẩm", "collection": "Bộ sưu tầm", "about": "Giới thiệu", "notification": "Thông báo", "support": "Hỗ trợ", "admin": "Quản lý", "login": "Đăng nhập", "logout": "Đăng xuất", "change-password": "Đổi mật khẩu", "seller-channel": "Kênh Người Bán", "download-app": "Tải ứng dụng", "connect": "Kết nối" },
							en: { "home": "Home", "shop": "All Products", "collection": "Collection", "about": "About", "notification": "Notification", "support": "Support", "login": "Sign In", "admin": "Admin", "logout": "Log Out", "change-password": "Change Password", "seller-channel": "Seller Channel", "download-app": "Download App", "connect": "Connect" }
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

				<!-- Hero Section Begin -->
				<section class="hero">
					<div class="container">
						<div id="carouselExampleIndicators" class="carousel slide mt-2" data-bs-ride="carousel"
							data-bs-interval="2000">
							<div class="carousel-indicators">
								<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
									class="active" aria-current="true" aria-label="Slide 1"></button>
								<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
									aria-label="Slide 2"></button>

							</div>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<a href="/shop" class="btn"><img src="assets/img/hero/hero-1.jpg"
											class="d-block w-100" alt="..."></a>
								</div>
								<div class="carousel-item">
									<a href="/shop" class="btn"><img src="assets/img/hero/hero-2.jpg"
											class="d-block w-100" alt="..."></a>
								</div>

							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>


					</div>

				</section>
				<!-- Hero Section End -->

				<!-- Products Section Begin -->
				<section class="container py-5 mt-5 products" style="padding: 0px 80px; border-radius: 20px;">
					<div style="display: flex; align-items: center; position: relative; margin-bottom: 30px;">
						<div style="font-size: 28px; font-weight: bold; color: black; position: absolute; left: 0;">
							⚡ FLASH SALE
						</div>
						<div class="countdown"
							style="margin-left: auto; display: flex; gap: 10px; padding: 5px; border-radius: 8px;">
							<div
								style="display: flex; flex-direction: column; align-items: center; justify-content: center; width: 50px; height: 50px; background: white; border: 2px solid #ff5722; border-radius: 8px; text-align: center; box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);">
								<span id="hours" style="font-size: 16px; font-weight: bold; color: black;">00</span>
								<span style="font-size: 14px; color: #ff5722; font-weight: bold;">Giờ</span>
							</div> <strong style="margin-top:10px;">:</strong>
							<div
								style="display: flex; flex-direction: column; align-items: center; justify-content: center; width: 50px; height: 50px; background: white; border: 2px solid #ff5722; border-radius: 8px; text-align: center; box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);">
								<span id="minutes" style="font-size: 16px; font-weight: bold; color: black;">00</span>
								<span style="font-size: 14px; color: #ff5722; font-weight: bold;">Phút</span>
							</div><strong style="margin-top:10px;">:</strong>
							<div
								style="display: flex; flex-direction: column; align-items: center; justify-content: center; width: 50px; height: 50px; background: white; border: 2px solid #ff5722; border-radius: 8px; text-align: center; box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);">
								<span id="seconds" style="font-size: 16px; font-weight: bold; color: black;">00</span>
								<span style="font-size: 14px; color: #ff5722; font-weight: bold;">Giây</span>
							</div>
						</div>


					</div>

					<div class="row">
						<c:set var="index" value="0" />
						<c:forEach items="${bestSellers}" var="item">
							<c:if test="${item.value[4] == false and index < 4}">

								<c:if test="${item.value[1] < 200000}">
									<div class="carousel-item active">
										<div class="row">
								</c:if>

								<div class="col-lg-3 col-md-6 col-sm-6 ">
									<div class="product__item p-2"
										style="border: 1px solid #ddd; border-radius: 8px; overflow: hidden; position: relative; transition: box-shadow 0.3s;">
										<div class="product__item__pic set-bg " onclick="detail(${item.key})"
											data-setbg="/assets/img/product/${item.value[3][0]}"
											style="height: 250px; background-size: cover; background-position: center;">

											<span class="badge bg-danger position-absolute top-0 start-0">-30%</span>
											<span class="badge bg-warning text-dark position-absolute top-0 end-0">Giảm
												giá</span>

											<ul class="product__hover"
												style="list-style: none; padding: 0; position: absolute; bottom: 10px; right: 10px; display: flex; gap: 5px;">
												<li><a href="#"
														class="d-flex align-items-center justify-content-center bg-white rounded-circle shadow"
														style="width: 35px; height: 35px;"> <i class="bi bi-heart-fill"
															style="color: red; font-size: 18px;"></i>
													</a></li>
												<li><a href="#"
														class="d-flex align-items-center justify-content-center bg-white rounded-circle shadow"
														style="width: 35px; height: 35px;"> <i
															class="bi bi-share-fill text-primary"
															style="font-size: 18px;"></i>
													</a></li>
											</ul>
										</div>
										<div class="product__item__text mt-2">
											<h6 class="text-truncate">${item.value[0]}</h6>
											<div class="d-flex justify-content-between align-items-center">
												<span class="text-muted text-decoration-line-through">
													<fmt:formatNumber value="${item.value[1] * 1.3}" pattern="#,###" />
													&#8363;
												</span> <span class="text-danger fw-bold h5">
													<fmt:formatNumber value="${item.value[1]}" pattern="#,###" />
													&#8363;
												</span>
											</div>
											<div class="rating text-warning mt-1">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star-half-o"></i> <span
													class="text-muted">(3.8k)</span>
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

								<c:set var="index" value="${index + 1}" />

								<c:if test="${index == 4}">
					</div>
					</div>
					</c:if>
					</c:if>
					</c:forEach>

				</section>

				<script>
					function updateCountdown() {
						let now = new Date();
						let hours = now.getHours();
						let minutes = now.getMinutes();
						let seconds = now.getSeconds();

						document.getElementById("hours").textContent = String(hours).padStart(2, '0');
						document.getElementById("minutes").textContent = String(minutes).padStart(2, '0');
						document.getElementById("seconds").textContent = String(seconds).padStart(2, '0');
					}

					setInterval(updateCountdown, 1000);
					updateCountdown();
				</script>

				<!-- Summer trên sản phẩm bán chạy  -->
				<section
					style="font-family: Arial, sans-serif; margin: 0; padding: 0; padding: 120px 0px; display: flex; justify-content: center; align-items: center; background-color: #fff;">
					<div style="display: flex; align-items: center; max-width: 1200px;">
						<!-- Phần text bên trái -->
						<div style="flex: 1; text-align: left; padding-right: 50px;">
							<h1 style="font-size: 50px; font-style: italic; font-weight: bold; margin: 0;">New!</h1>
							<h2 style="font-size: 24px; font-weight: normal; margin: 10px 0;">spring/summer
								2025.</h2>
							<p style="font-size: 14px; color: #777; margin: 10px 0;">Alienum
								phaedrum torquatos nec eu, vis detraxitssa periculiser ex, nihil
								expetendis in</p>
							<a href="#"
								style="text-decoration: none; font-weight: bold; color: black; display: inline-block; margin-top: 10px;">learn
								more →</a>
						</div>

						<!-- Phần hình ảnh bên phải -->
						<div style="display: flex; gap: 20px;">
							<div style="position: relative; overflow: hidden; text-align: center;">
								<img src="https://bazaar.qodeinteractive.com/wp-content/uploads/2017/06/h2-product-1a.jpg"
									alt="frilled midi dress"
									style="display: block; width: 200px; height: auto; transition: transform 0.3s ease-in-out; border-radius: 10px;">
							</div>

							<div style="position: relative; overflow: hidden; text-align: center;">
								<img src="https://bazaar.qodeinteractive.com/wp-content/uploads/2017/06/h2-product-2a.jpg"
									alt="buckled wedges"
									style="display: block; width: 200px; height: auto; transition: transform 0.3s ease-in-out; border-radius: 10px;">

							</div>
						</div>
					</div>
				</section>

				<!-- Product Section Begin -->
				<section class="product spad mt-5">
					<div class="container">
						<!-- Filter Options -->
						<div class="row">
							<div class="col-lg-12">
								<ul class="filter__controls">
									<li class="active h2" data-filter="*">Sản phẩm bán chạy</li>
								</ul>
							</div>
						</div>

						<!-- Product Carousel -->
						<div id="bestSellersCarousel" class="carousel slide" data-bs-ride="carousel">
							<div class="carousel-inner">
								<c:forEach items="${bestSellers}" var="item" varStatus="status">
									<c:if test="${status.index % 4 == 0}">
										<div class="carousel-item ${status.index == 0 ? 'active' : ''}">
											<div class="row">
									</c:if>

									<div class="col-lg-3 col-md-6 col-sm-6">
										<div class="product__item p-2"
											style="border: 1px solid #ddd; border-radius: 8px; overflow: hidden; position: relative; transition: box-shadow 0.3s;">
											<div class="product__item__pic set-bg" onclick="detail(${item.key})"
												data-setbg="/assets/img/product/${item.value[3][0]}"
												style="height: 250px;">
												<span
													class="badge bg-danger position-absolute top-0 start-0">-30%</span>
												<span
													class="badge bg-warning text-dark position-absolute top-0 end-0">Mới</span>
												<ul class="product__hover"
													style="list-style: none; padding: 0; position: absolute; bottom: 10px; right: 10px;">
													<li><a href="#"
															class="d-flex align-items-center justify-content-center bg-white rounded-circle shadow">
															<i class="bi bi-heart-fill"
																style="color: red; font-size: 20px;"></i>
														</a></li>
													<li><a href="#"
															class="d-flex align-items-center justify-content-center bg-white rounded-circle shadow">
															<i class="bi bi-share-fill text-primary fs-4"></i>
														</a></li>
												</ul>
											</div>
											<div class="product__item__text mt-2">
												<h6 class="text-truncate">${item.value[0]}</h6>
												<div class="d-flex justify-content-between align-items-center">
													<span class="text-muted text-decoration-line-through">
														<fmt:formatNumber value="${item.value[1] * 1.3}"
															pattern="#,###" /> &#8363;
													</span> <span class="text-danger fw-bold h5">
														<fmt:formatNumber value="${item.value[1]}" pattern="#,###" />
														&#8363;
													</span>
												</div>
												<div class="rating text-warning mt-1">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star-half-o"></i> <span
														class="text-muted">(3.8k)</span>
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

									<c:if test="${(status.index + 1) % 4 == 0 || status.last}">
							</div>
						</div>
						</c:if>
						</c:forEach>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#bestSellersCarousel"
						data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#bestSellersCarousel"
						data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="visually-hidden">Next</span>
					</button>
					</div>
					</div>
				</section>

				<script>
					// Set background images for products
					$(".set-bg").each(function () {
						$(this).css('background-image', 'url(' + $(this).data('setbg') + ')');
					});
				</script>

				<!-- Product Section End -->
				<section class="product spad">
					<!-- IMG ẢNH  -->
					<section style="display: flex; padding: 100px 0px; background: #f5f5f5;">
						<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
							<div
								style="position: relative; overflow: hidden; border-radius: 10px; cursor: pointer; width: 300px; height: auto;">
								<img src="assets/img/slide/slide-1-trang-chu-slide-1.png" alt="ÁO THUN"
									style="width: 100%; height: auto; transition: transform 0.4s ease-in-out;">
								<div
									style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(255, 255, 255, 0); opacity: 0; transition: opacity 0.4s ease-in-out;">
								</div>
							</div>

							<div
								style="position: relative; overflow: hidden; border-radius: 10px; cursor: pointer; width: 45%; height: auto;">
								<img src="assets/img/slide/slide-2-trang-chu-slide-2.png" alt="SPRING COLLECTION 2025"
									style="width: 100%; height: auto; transition: transform 0.4s ease-in-out;">
								<div
									style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(255, 255, 255, 0); opacity: 0; transition: opacity 0.4s ease-in-out;">
								</div>

							</div>

							<div
								style="position: relative; overflow: hidden; border-radius: 10px; cursor: pointer; width: 300px; height: auto;">
								<img src="assets/img/slide/slide-4-trang-chu-slide-3.png" alt="SƠ MI"
									style="width: 100%; height: auto; transition: transform 0.4s ease-in-out;">
								<div
									style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(255, 255, 255, 0); opacity: 0; transition: opacity 0.4s ease-in-out;">
								</div>

							</div>
						</div>

					</section>
					<script>
						document.querySelectorAll("div[style*='overflow: hidden']").forEach(box => {
							let img = box.querySelector("img");
							let overlay = box.querySelector("div");
							box.addEventListener("mouseover", () => {
								img.style.transform = "scale(1.1)";
								overlay.style.opacity = "1";
							});
							box.addEventListener("mouseout", () => {
								img.style.transform = "scale(1)";
								overlay.style.opacity = "0";
							});
						});
					</script>

					<div class="container">

						<div class="row">
							<div class="col-lg-12">
								<ul class="filter__controls">
									<li class="active h2" data-filter="*" style="margin-top: 40px;">Sản
										phẩm mới</li>
								</ul>
							</div>
						</div>

						<!-- Product Carousel -->
						<div id="newProductsCarousel" class="carousel slide" data-bs-ride="carousel">
							<div class="carousel-inner">
								<c:set var="index" value="0" />
								<c:set var="totalNewProducts" value="0" />

								<!-- Tính tổng số sản phẩm mới -->
								<c:forEach items="${bestSellers}" var="item">
									<c:if test="${item.value[4] == false}">
										<c:set var="totalNewProducts" value="${totalNewProducts + 1}" />
									</c:if>
								</c:forEach>

								<!-- Hiển thị sản phẩm mới -->
								<c:forEach items="${bestSellers}" var="item">
									<c:if test="${item.value[4] == false}">
										<c:if test="${index % 4 == 0}">
											<div class="carousel-item ${index == 0 ? 'active' : ''}">
												<div class="row">
										</c:if>

										<div class="col-lg-3 col-md-6 col-sm-6">
											<div class="product__item p-2"
												style="border: 1px solid #ddd; border-radius: 8px; overflow: hidden; position: relative; transition: box-shadow 0.3s;">
												<div class="product__item__pic set-bg" onclick="detail(${item.key})"
													data-setbg="/assets/img/product/${item.value[3][0]}"
													style="height: 250px;">
													<span
														class="badge bg-danger position-absolute top-0 start-0">-30%</span>
													<span
														class="badge bg-warning text-dark position-absolute top-0 end-0">Mới</span>
													<ul class="product__hover"
														style="list-style: none; padding: 0; position: absolute; bottom: 10px; right: 10px;">
														<li><a href="#"
																class="d-flex align-items-center justify-content-center bg-white rounded-circle shadow">
																<i class="bi bi-heart-fill"
																	style="color: red; font-size: 20px;"></i>
															</a></li>
														<li><a href="#"
																class="d-flex align-items-center justify-content-center bg-white rounded-circle shadow">
																<i class="bi bi-share-fill text-primary fs-4"></i>
															</a></li>
													</ul>
												</div>
												<div class="product__item__text mt-2">
													<h6 class="text-truncate">${item.value[0]}</h6>
													<div class="d-flex justify-content-between align-items-center">
														<span class="text-muted text-decoration-line-through">
															<fmt:formatNumber value="${item.value[1] * 1.3}"
																pattern="#,###" /> &#8363;
														</span> <span class="text-danger fw-bold h5">
															<fmt:formatNumber value="${item.value[1]}"
																pattern="#,###" /> &#8363;
														</span>
													</div>
													<div class="rating text-warning mt-1">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star-half-o"></i> <span
															class="text-muted">(3.8k)</span>
													</div>
													<div class="d-flex justify-content-between mt-2">
														<button onclick="addToCartOne(${item.key})"
															class="btn btn-outline-danger btn-sm">
															<i class="bi bi-cart3" style="font-size: 20px;"></i> Giỏ
															hàng
														</button>
														<button class="btn btn-outline-dark btn-sm">Mua ngay</button>
													</div>
												</div>
											</div>
										</div>
										<c:set var="index" value="${index + 1}" />

										<c:if test="${index % 4 == 0 || index == totalNewProducts}">
							</div>
						</div>
						</c:if>
						</c:if>
						</c:forEach>
					</div>

					<!-- Nút chuyển slide -->
					<button class="carousel-control-prev" type="button" data-bs-target="#newProductsCarousel"
						data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#newProductsCarousel"
						data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="visually-hidden">Next</span>
					</button>
					</div>
					</div>
				</section>

				<!-- TEXT CONTENT -->
				<section>
					<div class="">
						<div class="row" style="padding: 100px 100px; background: #fafafa !important; width: 100%;">
							<div class="col-md-4">
								<div class="blog-card"
									style="background: white; padding: 20px; border-radius: 10px; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); transition: 0.3s;">
									<p class="blog-date" style="color: #777; font-size: 12px; margin-bottom: 5px;">June
										30, 2017</p>
									<h3 class="blog-title" style="font-size: 20px; color: #333; margin-bottom: 10px;">
										Unique
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
									<p class="blog-date" style="color: #777; font-size: 12px; margin-bottom: 5px;">June
										30, 2017</p>
									<h3 class="blog-title" style="font-size: 20px; color: #333; margin-bottom: 10px;">
										Something
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
									<p class="blog-date" style="color: #777; font-size: 12px; margin-bottom: 5px;">June
										30, 2017</p>
									<h3 class="blog-title" style="font-size: 20px; color: #333; margin-bottom: 10px;">
										Women
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
				<footer class="footer text-center text-md-start"
					style="background: linear-gradient(135deg, #D6D6D6, #8C8C8C); color: #535353; padding: 50px 0px;">
					<div class="container">
						<div class="row">
							<!-- Logo + Social Icons -->
							<div class="col-md-3">
								<div class="footer-logo" style="font-weight: bold; font-size: 2.25rem;">AZ</div>
								<p>&copy; Qode Interactive</p>
								<div class="social-icons mt-2" style="display: flex; gap: 15px;">
									<a href="#"><i style="color: gray;" class="fa-brands fa-vimeo"></i></a>
									<a href="#"><i style="color: gray;" class="fa-brands fa-instagram"></i></a> <a
										href="#"><i style="color: gray;" class="fa-brands fa-twitter"></i></a> <a
										href="#"><i style="color: gray;" class="fa-brands fa-facebook"></i></a> <a
										href="#"><i style="color: gray;" class="fa-brands fa-tumblr"></i></a>
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
									<li style="display: flex; align-items: center;"><i style="color: gray;"
											class="fa-solid fa-user"></i> <a href="#"
											style="text-decoration: none; color: #535353; margin-left: 10px;">My
											Account</a></li>
									<li style="display: flex; align-items: center;"><i style="color: gray;"
											class="fa-solid fa-search"></i> <a href="#"
											style="text-decoration: none; color: #535353; margin-left: 10px;">Checkout</a>
									</li>
									<li style="display: flex; align-items: center;"><i style="color: gray;"
											class="fa-solid fa-house"></i> <a href="#"
											style="text-decoration: none; color: #535353; margin-left: 10px;">Order
											Tracking</a></li>
									<li style="display: flex; align-items: center;"><i style="color: gray;"
											class="fa-solid fa-map-marker-alt"></i> <a href="#"
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
						<div style="width: 600px; height: 1px; background-color: #59554B; margin-bottom: 10px;"></div>
						<h1 style="color: #535353; font-weight: 400; font-size: 18px; margin-top: 20px;">©
							Copyright 2020 by AZ . All rights reserved.</h1>
					</div>


				</footer> <!-- Bootstrap 5 JS -->
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

				<!-- Search End -->
				<script type="text/javascript">
					function detail(id) {
						location.assign("http://localhost:8080/shop/detail/" + id);
					}
					async function addToCartOne(id) {
						await fetch("http://localhost:8080/shop/cart/add?id=" + id + "&qty=1");
						location.assign("http://localhost:8080/shop/cart");
					}
				</script>
				<!-- Js Plugins -->
				<script src="assets/js/jquery-3.3.1.min.js"></script>
				<script src="assets/js/bootstrap.min.js"></script>
				<script src="assets/js/jquery.nice-select.min.js"></script>
				<script src="assets/js/jquery.nicescroll.min.js"></script>
				<script src="assets/js/jquery.magnific-popup.min.js"></script>
				<script src="assets/js/jquery.countdown.min.js"></script>
				<script src="assets/js/jquery.slicknav.js"></script>
				<script src="assets/js/mixitup.min.js"></script>
				<script src="assets/js/owl.carousel.min.js"></script>
				<script src="assets/js/main.js"></script>
			</body>

			</html>