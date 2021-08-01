<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Fullstack ShopPhone</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,300;1,400&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<s:url value='/assets/css/main.css'/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value='/assets/css/base.css'/>">
<%-- <style type="text/css">
<%@include file="assets/css/main.css" %>
<%@include file="assets/css/base.css"%>
</style> --%>
</head>
<body>
	<div class="container">
		<input type="checkbox" name="" id="change" hidden>
		<div class="login">
			<div class="change-navbar">
				<label class="change-navbar-tab change-navbar-tab--active-login">Đăng
					nhập</label> <label for="change"
					class="change-navbar-tab change-navbar-tab-login">Đăng ký</label>
			</div>

			<h2 class="login-title">ĐĂNG NHẬP TÀI KHOẢN</h2>

			<form action="login" method="POST" class="login-input">
				<div class="login-email">
					Email:<input type="text" name="email" id="" required="required"
						placeholder="Nhập email của bạn...">
				</div>
				<div class="login-password">
					Password:<input type="password" name="password" id=""
						required="required" placeholder="Nhập mật khẩu...">
				</div>
				<div class="login-btn">
					<input class="btn" type="submit" value="Đăng nhập">
					<button class="btn btn--simple">Quên mật khẩu?</button>
				</div>
			</form>
		</div>
		<div class="register">
			<div class="change-navbar">
				<label for="change"
					class="change-navbar-tab change-navbar-tab-register">Đăng
					nhập</label> <label
					class="change-navbar-tab change-navbar-tab--active-register">Đăng
					ký</label>
			</div>

			<h2 class="login-title">ĐĂNG KÝ TÀI KHOẢN</h2>

			<form action="sign-up" method="POST" class="login-input">
				<div class="login-email">
					Email:<input type="text" name="email" id="" required="required"
						placeholder="Nhập email của bạn...">
				</div>
				<div class="login-password">
					Password:<input type="password" name="password" id=""
						required="required" placeholder="Nhập mật khẩu...">
				</div>
				<div class="login-password">
					Re-password:<input type="password" name="password2" id=""
						required="required" placeholder="Nhập lại mật khẩu...">
				</div>
				<div class="login-btn">
					<input class="btn" type="submit" value="Đăng ký"> <label
						for="change" style="font-size: 1.4rem;" class="btn btn--simple">Bạn
						đã có tài khoản?</label>
				</div>
			</form>
		</div>
	</div>

	<div id="toast"></div>

	<button onclick="showSuccessToast()">SHOW</button>
	<button onclick="showErrorToast()">SHOW</button>
	<button onclick="showInfoToast()">SHOW</button>

	<script type="text/javascript"
		src="<s:url value='/assets/js/main.js'/>">
    	<%-- <%@include file="assets/js/main.js" %> --%>
    </script>
	<script>
    	<% 
			String type = (String) request.getAttribute("type");
			String message = (String) request.getAttribute("message");
    		if(type != null && message != null) {
    			
			String title = (type.equals("success")) ? "Thành công!" : "Thất bại!";
			if(type != null) {%>
				function showToast() {
		    	    toast({
		    	        title: '<%=title %>',
		    	        message: '<%=message %>',
		    	        type: '<%=type %>',
		    	        duration: 5000
		    	    });
		    	}
		    	showToast();
				<%
			}
    		}
		%>
    </script>

</body>
</html>