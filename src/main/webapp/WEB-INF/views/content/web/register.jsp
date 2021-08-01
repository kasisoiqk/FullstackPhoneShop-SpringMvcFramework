<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Resgister - Fullstack Phone Shop</title>
<link rel="stylesheet" type="text/css"
	href="<s:url value='/assets/css/main_register.css'/>">
</head>
<body>
	<div class="app">
		<!-- Header layout -->
		<%@ include file="/WEB-INF/views/common/web/header.jsp"%>
	
		<!-- Body layout -->
		<div class="app__content">
			<div class="grid wide">
				<h4>
					Chào mừng bạn đến với Fullstack Phone Shop! Để có thể thực hiện trọn vẹn được các dịch vụ mà Fullstack Phone Shop đem lại vui lòng bạn
					điền đầy đủ thông tin cá nhân vào các ô dưới đây. Trân trọng cảm ơn bạn đã đến với dịch vụ của chúng tôi!
					<br><br>
					Nếu có bất cứ thắc mắc gì trong quá trình trải nghiệm bạn có thể liên hệ cho chúng tôi qua các phương tiện sau:....
					<br><br>
				</h4>
				<form class="user-info" action='<s:url value="/save-user-info"></s:url>' method="POST" enctype="multipart/form-data">
					<div class="user-info__input">
						<input type="number" name="id-account" value="${account.getId() }" hidden>
						<div class="user-info__image">
							<label for="" class="user-info-item__label">Chọn ảnh làm avatar của bạn:</label>
							<input class="user-info-item__input" type="file" name="user-image" required>
						</div>
						<div class="user-info__text">
							<div class="user-info__item">
								<label class="user-info-item__label" for="">Tên đầy đủ của bạn:</label>
								<input type="text" name="full-name" required>
							</div>
							<div class="user-info__item">
								<label class="user-info-item__label" for="">Địa chỉ nhận hàng của bạn<br />(bạn có thể
									thay đổi sau này):</label>
								<input type="text" name="address" required>
							</div>
							<div class="user-info__item no-flex">
								<label class="user-info-item__label" for="">Giới tính:</label>
								<div class="user-info__item-gender">
									<div class="gender-item">
										<label for="male">Nam</label>
										<input type="radio" id="male" name="gender" value="Nam" checked>
									</div>
									<div class="gender-item">
										<label for="female">Nữ</label>
										<input type="radio" id="female" name="gender" value="Nữ">
									</div>
								</div>
							</div>
						</div>
					</div>
					<input type="submit" class="btn btn-submit" value="Xác nhận">
				</form>
			</div>
		</div>
		
		<!-- Footer layout -->
		<%@ include file="/WEB-INF/views/common/web/footer.jsp"%>
	</div>
	
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