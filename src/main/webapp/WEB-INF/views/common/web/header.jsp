<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.learnspringmvc.model.CustomerModel"%>
<%
CustomerModel customer = (CustomerModel) session.getAttribute("customer");
%>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css"
	href="<s:url value='/assets/css/base.css'/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value='/assets/css/main_header.css'/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value='/assets/css/grid.css'/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value='/assets/css/responsive.css'/>">
<header class="header">
	<div class="grid wide">
		<nav class="navbar hide-on-mobile-tablet">
			<ul class="navbar__list">
				<li class="navbar__item navbar__item--has-qr navbar__item--separate">
					Vào cửa hàng trên ứng dụng Fullstack Phone Shop
					<div class="navbar__qr">
						<img src="<s:url value='/assets/images/web/QR-code.png'></s:url>"
							class="navbar__qr-img" alt="QR Code">
						<div class="navbar__qr-download">
							<a href="" class="navbar__download-link"> <img
								src="<s:url value='/assets/images/web/ch-play.png'></s:url>"
								alt="CH Play">
							</a> <a href="" class="navbar__download-link"> <img
								src="<s:url value='/assets/images/web/app-store.png'></s:url>"
								alt="App Store">
							</a>
						</div>
					</div>
				</li>
				<li class="navbar__item"><span
					class="navbar__title--no-pointer">Kết nối</span> <a
					href="https://www.facebook.com/QK.Kasi.me"
					class="navbar__item-link"> <i
						class="navbar__icon fab fa-facebook"></i>
				</a> <a href="https://www.instagram.com/kasisoiqk/"
					class="navbar__item-link"> <i
						class="navbar__icon fab fa-instagram"></i>
				</a></li>
			</ul>

			<ul class="navbar__list">
				<li class="navbar__item navbar__item-link--notify-appear"><a
					href="" class="navbar__item-link"> <i
						class="navbar__icon far fa-bell"></i> Thông báo
				</a>
					<div class="notify">
						<header class="header__notify">
							<h3>Thông báo mới nhận</h3>
						</header>
						<ul class="header__notify-list">
							<li class="header__notify-item header__notify-item--viewed">
								<a href="" class="header__notify-link"> <img
									src="<s:url value='/assets/images/web/notify-img.jpg'></s:url>"
									" alt="" class="header__notify-img">
									<div class="header__notify-info">
										<span class="header__notify-name">Xác thực chính hẵng
											nguồn gốc các sản phẩm Ohui</span> <span
											class="header__notify-descristion">HiddenTag là giải
											pháp xác thực hàng chính hãng bằng công nghệ tiên tiến nhất
											hiện nay</span>
									</div>
							</a>
							</li>
							<li class="header__notify-item"><a href=""
								class="header__notify-link"> <img
									src="<s:url value='/assets/images/web/notify-img2.jpg'></s:url>"
									" alt="" class="header__notify-img">
									<div class="header__notify-info">
										<span class="header__notify-name">Sale sốc bộ dưỡng
											Ohui The First Tái tạo trẻ hóa da SALE OFF 70%</span> <span
											class="header__notify-descristion">Giá chỉ còn 375.000
											(giá gốc 1.250.000)</span>
									</div>
							</a></li>
							<li class="header__notify-item"><a href=""
								class="header__notify-link"> <img
									src="<s:url value='/assets/images/web/notify-img3.jpg'></s:url>"
									" alt="" class="header__notify-img">
									<div class="header__notify-info">
										<span class="header__notify-name">Ohui chính thức ra
											mắt dòng son lì mới THE FIRST GENITURE LIPSTICK</span> <span
											class="header__notify-descristion">Một lần môi căng
											mềm quyến rũ với các màu nổi bật luôn là điều mà các quỹ có
											ao ước</span>
									</div>
							</a></li>
						</ul>
						<footer class="notity__footer">
							<a href="" class="notity__footer-btn">Xem tất cả</a>
						</footer>
					</div></li>
				<li class="navbar__item"><a href="" class="navbar__item-link">
						<i class="navbar__icon far fa-question-circle"></i> Trợ giúp
				</a></li>
				<!-- <li class="navbar__item navbar__item--strong navbar__item--separate">Đăng ký</li>
                        <li class="navbar__item navbar__item--strong">Đăng nhập</li> -->

				<li class="navbar__item navbar__item-user">
					<%
					if (customer == null) {
					%>
					<div class="navbar__item-user-img">
						<img
							src="<s:url value='/assets/images/user/unknown-person.jpg'></s:url>"
							alt="">
					</div> <span class="navbar__item-user-name">Chưa đăng nhập</span>
					<ul class="navbar__user-menu">
						<label for="auth" class="auth">
							<li class="navbar__user-item navbar__user-item-separate"><b>Đăng
									nhập</b></li>
						</label>
					</ul> <%
					 } else {
					 %>
					<div class="navbar__item-user-img">
						<img src="<s:url value='<%=customer.getAvatar()%>'></s:url>"
							alt="">
					</div> <span class="navbar__item-user-name"><%=customer.getFullName()%></span>
					<ul class="navbar__user-menu">
						<li class="navbar__user-item"><a href="">Tài khoản của
								tôi</a></li>
						<li class="navbar__user-item"><a href="">Địa chỉ của tôi</a>
						</li>
						<li class="navbar__user-item"><a href="">Đơn mua</a></li>
						<label for="auth">
							<li class="navbar__user-item navbar__user-item-separate"><a
								href='<s:url value="/logout"></s:url>'> <b>Đăng xuất</b></a></li>
						</label>

					</ul> <%
 }
 %>
				</li>
			</ul>
		</nav>

		<!-- Header with search -->
		<div class="header-with-search">
			<label for="mobile-search-checkbox" class="header__mobile-search">
				<i class="header__mobile-search-icon fas fa-search"></i>
			</label>
			<div class="header__logo hide-on-tablet">
				<a href='<s:url value="/home"></s:url>' class="header__logo-link">
					<img alt="Fullstack Phone Shop"
					src='<s:url value="/assets/images/web/phoneshop.png"/>'>
				</a>
			</div>

			<input type="checkbox" hidden id="mobile-search-checkbox"
				class="header__search-checkbox">

			<div class="header__search">
				<div class="header__search-input-wrap">
					<input type="text" class="header__search-input"
						placeholder="Nhập để tìm kiếm sản phẩm">

					<!-- Search history -->
					<div class="header__search-history">
						<h3 class="header__search-history-heading">Lịch sử tìm kiếm</h3>
						<ul class="header__search-history-list">
							<li class="header__search-history-item"><a href="">Kem
									dưỡng da</a></li>
							<li class="header__search-history-item"><a href="">Kem
									trị mụn</a></li>
						</ul>
					</div>
				</div>
				<div class="header__search-select">
					<span class="header__search-select-label">Trong shop</span> <i
						class="header__search-select-label-icon fas fa-angle-down"></i>

					<ul class="header__search-option">
						<li
							class="header__search-option-item header__search-option-item--active">
							<span>Trong shop</span> <i class="fas fa-check"></i>
						</li>
						<li class="header__search-option-item"><span>Ngoài
								shop</span> <i class="fas fa-check"></i></li>
					</ul>
				</div>
				<button class="header__search-btn">
					<i class="header__search-btn-icon fas fa-search"></i>
				</button>
			</div>

			<!-- Cart layout -->
			<div class="header__cart">
				<div class="header__cart-wrap">
					<i class="header__cart-icon fas fa-shopping-cart"></i>

					<c:choose>
						<c:when test="${product_carts == null}">

						</c:when>

						<c:otherwise>
							<span class="header__cart-notice" id="number-product">${product_carts.size() }</span>
						</c:otherwise>
					</c:choose>

					<!-- No cart: header__cart-list--no-cart -->
					<c:choose>
						<c:when test="${product_carts == null}">
							<div class="header__cart-list header__cart-list--no-cart">
								<img
									src="<s:url value='/assets/images/web/no-cart.png'></s:url>"
									alt="no cart" class="header__cart-list--no-cart-img"> <span
									class="header__cart-list--no-cart-msg">Vui lòng đăng
									nhập để xem giỏ hàng</span>
							</div>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${product_carts.size() == 0}">
									<div class="header__cart-list header__cart-list--no-cart">
										<img
											src="<s:url value='/assets/images/web/no-cart.png'></s:url>"
											alt="no cart" class="header__cart-list--no-cart-img"> <span
											class="header__cart-list--no-cart-msg">Chưa có sản
											phẩm</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="header__cart-list">
										<img
											src="<s:url value='/assets/images/web/no-cart.png'></s:url>"
											alt="no cart" class="header__cart-list--no-cart-img"> <span
											class="header__cart-list--no-cart-msg">Chưa có sản
											phẩm</span>

										<h4 class="header__cart-heading" id="cart-heading">Sản
											phẩm đã thêm</h4>
										<c:set var="i" value="1"></c:set>
										<ul class="header__cart-list-item" id="cart-list">
											<c:forEach var="product_cart" items="${product_carts }">
												<li class="header__cart-item"><img
													src='<s:url value="${product_cart.getImage()}"></s:url>'
													alt="anh tho" class="header__cart-img">
													<div class="header__cart-item-info">
														<div class="header__cart-item-head">
															<h5 class="header__cart-item-name">${product_cart.getProductName()}</h5>
															<div class="header__cart-item-price-wrap">
																<span class="header__cart-item-price">${product_cart.getPrice()}</span>
																<span class="header__cart-item-multiply">x</span> <span
																	class="header__cart-item-qnt">${product_cart.getAmount()}</span>
															</div>
														</div>
														<div class="header__cart-item-body">
															<span class="header__cart-item-description"> Phân
																loại: Bạc </span> <span class="header__cart-item-remove"
																onclick="remove(${i})">Xóa</span>
															<c:set var="i" value="${i+1 }"></c:set>
														</div>
													</div></li>
											</c:forEach>
										</ul>
										<a href="" class="header__cart-view-cart">Xem giỏ hàng</a>
									</div>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</div>
	</div>

	<!-- Header sort bar -->
	<ul class="header__sort-bar">
		<li class="header__sort-item header__sort-item--active"><a
			href="" class="header__sort-link">Liên quan</a></li>
		<li class="header__sort-item"><a href=""
			class="header__sort-link">Mới nhất</a></li>
		<li class="header__sort-item"><a href=""
			class="header__sort-link">Bán chạy</a></li>
		<li class="header__sort-item"><a href=""
			class="header__sort-link">Giá</a></li>
	</ul>
</header>