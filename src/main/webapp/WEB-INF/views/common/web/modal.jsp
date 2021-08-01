<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<div class="modal modal--register">
	<div class="modal__overlay"></div>

	<div class="model__close">
		<label for="auth"><i class="fas fa-times"></i></label>
	</div>
	<div class="modal__body">
		<input type="checkbox" name="" id="change" hidden>
		<div class="login">
			<div class="change-navbar">
				<label class="change-navbar-tab change-navbar-tab--active-login">Đăng
					nhập</label> <label for="change"
					class="change-navbar-tab change-navbar-tab-login">Đăng ký</label>
			</div>

			<h2 class="login-title">ĐĂNG NHẬP TÀI KHOẢN</h2>

			<form action='<s:url value="/check-login"></s:url>' method="POST" class="login-input">
				<div class="login-email">
					Email:<input type="text" name="email" id="email"
						placeholder="Nhập email của bạn...">
				</div>
				<div class="login-password">
					Password:<input type="password" name="password" id="password"
						placeholder="Nhập mật khẩu...">
				</div>
				<div class="login-btn">
					<input class="btn" type="submit" value="Đăng nhập">
					<button class="btn btn--simple">Quên mật khẩu?</button>
				</div>
			</form>
			<div class="auth-form__socials">
				<a href=""
					class="auth-form__socials-facebook btn btn--size-s btn--with-icon">
					<i class="auth-form__socials-icon fab fa-facebook-square"></i> <span
					class="auth-form__socials-title"> Kết nối với Facebook </span>
				</a> <a href=""
					class="auth-form__socials-google btn btn--size-s btn--with-icon">
					<i class="auth-form__socials-icon fab fa-google"></i> <span
					class="auth-form__socials-title"> Kết nối với Google </span>
				</a>
			</div>
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

			<form action="<s:url value="/register"></s:url>" method="POST" class="login-input">
				<div class="login-email">
					Email:<input type="text" name="email" id="email"
						placeholder="Nhập email của bạn..." required>
				</div>
				<div class="login-password">
					Password:<input type="password" name="password" id="password"
						placeholder="Nhập mật khẩu..." required>
				</div>
				<div class="login-password">
					Re-password:<input type="password" name="password2" id="password2"
						placeholder="Nhập lại mật khẩu..." required>
				</div>
				<div class="auth-form__aside">
					<p class="auth-form__policy-text">
						Bằng việc đăng ký, bạn đã đồng ý với chúng tôi về <a href=""
							class="auth-form__link">Điều khoản dịch vụ</a> & <a href=""
							class="auth-form__link">Chính sách bảo mật</a>
					</p>
				</div>
				<div class="login-btn">
					<input class="btn" type="submit" value="Đăng ký"> <label
						for="change" style="font-size: 1.4rem;" class="btn btn--simple">Bạn
						đã có tài khoản?</label>
				</div>
			</form>
		</div>
	</div>
</div>