function toast({
    title = '',
    message = '',
    type = 'info',
    duration = 3000
}) {
    const main = document.getElementById('toast');
    if (main) {
        const toast = document.createElement('div');

        // Auto remove when time out
        const autoRemoveId = setTimeout(function() {
            main.removeChild(toast);
        }, duration + 1000);

        // Remove toast when click close
        toast.onclick = function(e) {
            if(e.target.closest('.toast__close')) {
                main.removeChild(toast);
                clearTimeout(autoRemoveId);
            }
        }

        const icons = {
            success: 'fas fa-check-circle',
            error: 'fas fa-exclamation-triangle',
            info: 'fas fa-exclamation-circle'
        };

        const icon = icons[type];
        const delay = (duration / 1000).toFixed(2);

        toast.classList.add('toast', `toast--${type}`);
        toast.style.animation = `slideInLeft ease 0.5s , fadeOut linear 1s ${delay}s forwards`;

        toast.innerHTML = `
            <div class="toast__icon">
                <i class="${icon}"></i>
            </div>
            <div class="toast__body">
                <h3 class="toast__title">${title}</h3>
                <p class="toast__mgs">${message}</p>
            </div>
            <div class="toast__close">
                <i class="fas fa-times"></i>
            </div>
        `
        main.appendChild(toast);
    }
}

function showSuccessToast() {
    toast({
        title: 'Thành công!',
        message: 'Đăng nhập thành công. Bây giờ bạn có thể thực hiện các thao tác.',
        type: 'success',
        duration: 5000
    });
}

function showErrorToast() {
    toast({
        title: 'Thất bại!',
        message: 'Đăng nhập thất bại, yêu cầu kiểm tra lại.',
        type: 'error',
        duration: 5000
    });
}

function showInfoToast() {
    toast({
        title: 'Thông báo!',
        message: 'Đăng nhập thất bại, yêu cầu kiểm tra lại.',
        type: 'info',
        duration: 5000
    });
}