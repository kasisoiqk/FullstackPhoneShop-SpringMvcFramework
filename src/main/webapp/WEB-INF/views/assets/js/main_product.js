var down = document.getElementById('quantity__down');
var up = document.getElementById('quantity__up');
var value = document.getElementById('quantity__value');

down.addEventListener('click', function () {
    var quantity = value.getAttribute('value');
    value.setAttribute('value', --quantity);
});

up.addEventListener('click', function () {
    var quantity = value.getAttribute('value');
    value.setAttribute('value', ++quantity);
});

// Restricts input for the given textbox to the given inputFilter.
function setInputFilter(textbox, inputFilter) {
    ["input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop"].forEach(function (event) {
        textbox.addEventListener(event, function () {
            if (inputFilter(this.value)) {
                this.oldValue = this.value;
                this.oldSelectionStart = this.selectionStart;
                this.oldSelectionEnd = this.selectionEnd;
            } else if (this.hasOwnProperty("oldValue")) {
                this.value = this.oldValue;
                this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
            }
        });
    });
}

// Restrict input to digits and '.' by using a regular expression filter.
setInputFilter(value, function (val) {
    value.setAttribute('value', val);
    return /^\d*\.?\d*$/.test(val);
});

// cart
loadCart = function () {
    var cart_list = document.getElementById('cart-list');
    if(carts.length != 0) {
     	while (cart_list.hasChildNodes()) {
        	cart_list.removeChild(cart_list.firstChild);
    	}
    }
    if (cart_list) {

        if(carts.length > 0) {
            cart_list.parentElement.classList.remove('header__cart-list--no-cart');
            document.getElementById('cart-heading').style.display = 'block';
        }
        else {
            cart_list.parentElement.classList.add('header__cart-list--no-cart');
            document.getElementById('cart-heading').style.display = 'none';
        }


        carts.forEach(function (value, index) {

            const item = document.createElement('li');
            item.classList.add('header__cart-item');

            item.innerHTML = `
                <img src="${value.image}" alt=""
                    class="header__cart-img">
                <div class="header__cart-item-info">
                    <div class="header__cart-item-head">
                        <h5 class="header__cart-item-name">${value.name}</h5>
                        <div class="header__cart-item-price-wrap">
                            <span class="header__cart-item-price">${value.price}</span>
                            <span class="header__cart-item-multiply">x</span>
                            <span class="header__cart-item-qnt">${value.quantity}</span>
                        </div>
                    </div>
                    <div class="header__cart-item-body">
                        <span class="header__cart-item-description">
                            Phân loại: Bạc
                        </span>
                        <form id="post-remove-form">
                        <span class="header__cart-item-remove" onclick="remove(${index})">Xóa</span>
                        </form>
                    </div>
                </div>
            `;
            cart_list.append(item);
        });
    }
    document.getElementById('number-product').innerText = carts.length;
}

loadCart();

function addToCart() {
        // Add to DB
        const URL = "http://localhost:8080/Fullstack_PhoneShop/add-to-cart";

        var formData = new FormData(document.getElementById('post-form'));
        var token = btoa('123456789:012345');

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if(this.readyState == 4 && this.status == 200) {
                console.log(this.responseText);
                console.log(token);
            }
        }

        xhttp.open('POST', URL, false);
        xhttp.setRequestHeader('idProduct', document.getElementById('id-product').value);
        xhttp.setRequestHeader('quantity', value.getAttribute('value'));
        xhttp.send(formData);

        // Add to Font
    carts.push({
    	id: document.getElementById('id-product').value,
        name: document.getElementById('product-name').innerText,
        price: document.getElementById('product-price').innerText.replace(' ', ''),
        quantity: value.getAttribute('value'),
        image: document.getElementById('product-img').getAttribute('src')
    });
    loadCart();
}

function remove(index) {
	// Remove from DB
    const URL = "http://localhost:8080/Fullstack_PhoneShop/remove-from-cart";

    var formData = new FormData(document.getElementById('post-remove-form'));
    var token = btoa('123456789:012345');

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if(this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
            console.log(token);
        }
    }

    xhttp.open('POST', URL, false);
    xhttp.setRequestHeader('idProduct', carts[index].id);
    xhttp.send(formData);

	// Remove from carts
    carts.splice(index, 1);
    var cart_list = document.getElementById('cart-list');
    cart_list.removeChild(cart_list.firstChild);
    loadCart();
}