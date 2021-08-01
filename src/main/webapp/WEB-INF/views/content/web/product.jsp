<%@page import="com.learnspringmvc.model.ProductModel"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${product.getProductName() }</title>
<link rel="stylesheet" type="text/css"
	href="<s:url value='/assets/css/main_product.css'/>">
</head>
<body>
	<fmt:setLocale value="vi_VN" />
	<input id="id-product" type="number" value="${product.getId() }" hidden>
	<div class="app">
		<!-- Header layout -->
		<%@ include file="/WEB-INF/views/common/web/header.jsp"%>

		<!-- Body layout -->
		<div class="app__container">
			<div class="grid wide">
				<div class="row app__content no-gutters">
					<div class="col l-5 m-5 c-12">
						<div class="product-image">
							<img id="product-img"
								src="<s:url value='${product.getImage() }'></s:url>" alt="">
						</div>
					</div>
					<div class="col l-7 m-7 c-12">
						<div class="product__info">
							<h2 class="product-name" id="product-name">${product.getProductName() }</h2>
							<div class="product__action">
								<div class="product__rating">
									<span class="product__rating-point">5.0</span> <i
										class="product__rating-gold fas fa-star"></i> <i
										class="product__rating-gold fas fa-star"></i> <i
										class="product__rating-gold fas fa-star"></i> <i
										class="product__rating-gold fas fa-star"></i> <i
										class="product__rating-gold fas fa-star"></i>
								</div>
								<span class="product__rate">88 đánh giá</span> <span
									class="product__sold">${product.getQuantitySold() } đã
									bán</span>
							</div>
							<div class="product__price">
								<span class="product-price__price-old"> <fmt:formatNumber
										value="${product.getPrice() }" type="number" /> đ
								</span> <span class="product-price__price-current" id="product-price">
									<fmt:formatNumber
										value="${product.getPrice() - product.getPrice()*product.getSale()/100 }"
										type="number" maxFractionDigits="0" /> đ
								</span> <span class="product-price__price-self-off">${product.getSale() }%
									GIẢM</span>
							</div>
							<div class="product__ship">
								<span class="product-ship__title">Vận chuyển</span> <img
									src="https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg/assets/1cdd37339544d858f4d0ade5723cd477.png"
									alt="Free ship"> <span class="product-ship__text">Miễn
									phí vận chuyển</span>
							</div>
							<div class="product__quantity">
								<span class="product-quantity__title">Số lượng</span>
								<div class="product-quantity__quantity">
									<button class="quantity__down" id="quantity__down">-</button>
									<input class="quantity__value" id="quantity__value" type="text"
										value="1">
									<button class="quantity__up" id="quantity__up">+</button>
								</div>
							</div>
							<div class="product__description">
								<span class="product-description__title">Mô tả</span>
								<div class="product-description__content">${product.getShortDescription() }</div>
							</div>
							<div class="product__control">
								<form  id="post-form">
                                    <div class="btn-add" onclick="showSuccessToast(), addToCart()"><i
                                            class="fas fa-cart-plus"></i>Thêm vào giỏ hàng</div>
                                </form>
								<button class="btn-buy">Mua ngay</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer layout -->
		<%@ include file="/WEB-INF/views/common/web/footer.jsp"%>
	</div>

	<!-- Toast layout -->
	<%@ include file="/WEB-INF/views/common/web/toast.jsp"%>
	
	<c:if test="${product_carts != null }">
	<script type="text/javascript">
		function showSuccessToast() {
			toast({
		        title: 'Thành công!',
		        message: 'Thêm thành công sản phẩm ' + '${product.getProductName() }' + ' vào giỏ hàng! Bạn có thể vào giỏ hàng để kiểm tra.',
		        type: 'success',
		        duration: 5000
		    });
		}
		var carts = [];
		<% 
		List<ProductModel> product_carts = (List<ProductModel>) session.getAttribute("product_carts");
		for(ProductModel product : product_carts) {
			%>
			carts.push({
				id: <%=product.getId() %>,
		        name: '<%=product.getProductName() %>',
		        price: <%=product.getPrice() - product.getPrice()*product.getSale()/100  %>,
		        quantity: <%=product.getAmount() %>,
		        image: '<s:url value="<%=product.getImage() %>"/>'
		    });
			<%
		}
		%>
	</script>
	</c:if>
	<c:if test="${product_carts == null }">
	<script type="text/javascript">
		var carts = [];
	</script>
	</c:if>

	<script src='<s:url value="/assets/js/main_product.js"></s:url>'></script>
</body>
</html>