<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fullstack ShopPhone</title>
<link rel="stylesheet" type="text/css"
	href="<s:url value='/assets/css/main_home.css'/>">
</head>
<body>
	<fmt:setLocale value="vi_VN" />
	<div class="app">
		<!-- Header layout -->
		<%@ include file="/WEB-INF/views/common/web/header.jsp"%>

		<!-- Body layout -->
		<div class="app__container">
			<div class="grid wide">
				<div class="row app__content">
					<div class="col l-2 m-0 c-0">
						<nav class="category">
							<h3 class="category__heading">
								<i class="category__heading-icon far fa-list-alt"></i> Danh mục
							</h3>

							<ul class="category-list">
								<li class="category-item category-item--active"><a href=""
									class="category-item__link">Tất cả</a></li>
								<li class="category-item"><a href=""
									class="category-item__link">Điện thoại xiaomi</a></li>
								<li class="category-item"><a href=""
									class="category-item__link">Điện thoại iphone</a></li>
								<li class="category-item"><a href=""
									class="category-item__link">Điện thoại samsung</a></li>
								<li class="category-item"><a href=""
									class="category-item__link">Điện thoại cũ</a></li>
							</ul>
						</nav>
					</div>

					<div class="col l-10 m-12 c-12">
						<div class="home-filter hide-on-mobile-tablet">
							<span class="home-filter__label">Sắp xếp theo</span>
							<button class="home-filter__btn btn">Phổ biến</button>
							<button class="home-filter__btn btn btn--primary">Mới
								nhất</button>
							<button class="home-filter__btn btn">Bán chạy</button>

							<div class="select-input">
								<span class="select-input__label">Giá</span> <i
									class="select-input__icon fas fa-angle-down"></i>
								<!-- List option -->
								<ul class="select-input__list">
									<li class="select-input__item"><a href=""
										class="select-input__link">Giá thấp đến cao</a></li>
									<li class="select-input__item"><a href=""
										class="select-input__link">Giá cao đến thấp</a></li>
								</ul>
							</div>

							<div class="home-filter__page">
								<span class="home-filter__page-num"> <span
									class="home-filter__page-current">1</span>/14
								</span>

								<div class="home-filter__page-control">
									<a href=""
										class="home-filter__page-btn home-filter__page-btn--disabled">
										<i class="home-filter__page-icon fas fa-angle-left"></i>
									</a> <a href="" class="home-filter__page-btn"> <i
										class="home-filter__page-icon fas fa-angle-right"></i>
									</a>
								</div>
							</div>
						</div>

						<div class="home-product">
							<div class="row">
								<!-- Product item -->
								<c:forEach var="product" items="${products }">
									<div class="col l-2-4 m-4 c-6">
										<a href="product-info/${product.getId() }"
											class="home-product-item">
											<div class="home-product-item__img"
												style="background-image: url(
                                            <s:url value='${product.getImage() }'></s:url>"></div>
											<h4 class="home-product-item__name">${product.getProductName() }</h4>
											<div class="home-product-item__price">
												<span class="home-product-item__price-old"> <fmt:formatNumber
														value="${product.getPrice() }" type="number" /> đ
												</span> <span class="home-product-item__price-current"> <fmt:formatNumber
														value="${product.getPrice() - product.getPrice()*product.getSale()/100 }"
														type="number" maxFractionDigits="0" /> đ
												</span>
											</div>
											<div class="home-product-item__action">
												<span
													class="home-product-item__like home-product-item__like--liked">
													<i class="home-product-item__like-icon-empty far fa-heart"></i>
													<i class="home-product-item__like-icon-fill fas fa-heart"></i>
												</span>
												<div class="home-product-item__rating">
													<i class="home-product-item__star-gold fas fa-star"></i> <i
														class="home-product-item__star-gold fas fa-star"></i> <i
														class="home-product-item__star-gold fas fa-star"></i> <i
														class="home-product-item__star-gold fas fa-star"></i> <i
														class="home-product-item__star-gold fas fa-star"></i>
												</div>
												<span class="home-product-item__sold">88 đánh giá</span>
											</div>
											<div class="home-product-item__origin">
												<span class="home-product-item__brand">${product.getBrand() }</span>
												<span class="home-product-item__origin-name">${product.getAddress	() }</span>
											</div>
											<div class="home-product-item__favourite">
												<i class="fas fa-check"></i> <span>Yêu thích</span>
											</div>
											<div class="home-product-item__sale-off">
												<span class="home-product-item__sale-off-percent">${product.getSale() }</span>
												<span class="home-product-item__sale-off-label">Giảm</span>
											</div>
										</a>
									</div>
								</c:forEach>
							</div>

							<ul class="pagination home-product__pagination">
								<li class="pagination-item"><a href=""
									class="pagination-item__link"> <i
										class="pagination-item__icon fas fa-angle-left"></i>
								</a></li>
								<li class="pagination-item pagination-item--active"><a
									href="" class="pagination-item__link">1</a></li>
								<li class="pagination-item"><a href=""
									class="pagination-item__link">2</a></li>
								<li class="pagination-item"><a href=""
									class="pagination-item__link">3</a></li>
								<li class="pagination-item"><a href=""
									class="pagination-item__link">4</a></li>
								<li class="pagination-item"><a href=""
									class="pagination-item__link">5</a></li>
								<li class="pagination-item"><a href=""
									class="pagination-item__link">...</a></li>
								<li class="pagination-item"><a href=""
									class="pagination-item__link">14</a></li>
								<li class="pagination-item"><a href=""
									class="pagination-item__link"> <i
										class="pagination-item__icon fas fa-angle-right"></i>
								</a></li>
							</ul>

						</div>
					</div>
				</div>

			</div>

			<!-- Footer layout -->
			<%@ include file="/WEB-INF/views/common/web/footer.jsp"%>
		</div>

		<input type="checkbox" name="" id="auth" checked hidden>
		<!-- Modal layout -->
		<%@ include file="/WEB-INF/views/common/web/modal.jsp"%>

		<!-- Toast layout -->
		<%@ include file="/WEB-INF/views/common/web/toast.jsp"%>

		<script>
    <%String type = (String) request.getAttribute("type");
	String message = (String) request.getAttribute("message");
	if (type != null && message != null) {
	
		String title = (type.equals("success")) ? "Thành công!" : "Thất bại!";
		if (type != null) {%>
			function showToast() {
	    	    toast({
	    	        title: '<%=title%>',
	    	        message: '<%=message%>',
	    	        type: '<%=type%>',
					duration : 4000
				});
			}
			showToast();
		<%}
	}%>
		
	</script>
</body>
</html>