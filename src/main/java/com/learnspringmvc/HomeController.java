package com.learnspringmvc;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.learnspringmvc.model.AccountModel;
import com.learnspringmvc.model.CartModel;
import com.learnspringmvc.model.CustomerModel;
import com.learnspringmvc.model.ProductModel;
import com.learnspringmvc.service.impl.AccountService;
import com.learnspringmvc.service.impl.CartService;
import com.learnspringmvc.service.impl.CustomerService;
import com.learnspringmvc.service.impl.ProductService;

@Controller
public class HomeController {

	private AccountService accountService = new AccountService();
	private CustomerService customerService = new CustomerService();
	private ProductService productService = new ProductService();
	private CartService cartService = new CartService();
	
	private List<ProductModel> loadCartsList(Long idCustomer) {
		List<ProductModel> product_carts = productService.findAllProductInCartByIdCustomer(idCustomer);
		List<CartModel> carts = cartService.findByIdCustomer(idCustomer);
		for(int i = 0; i < product_carts.size(); i++) {
			for(CartModel cart : carts) {
				if(product_carts.get(i).getId() == cart.getIdProduct()) {
					product_carts.get(i).setAmount(cart.getQuantity());
				}
			}
		}
		return product_carts;
	}
	
	@RequestMapping(value = {"/"}, method = RequestMethod.GET)
	public String loadPageHome(Model model, HttpSession session) {
		
		AccountModel account = (AccountModel) session.getAttribute("account");
		if(account != null) {
			model.addAttribute("account", account);
		}
		
		model.addAttribute("products", productService.findAll());
		
		return "content/web/home";
	}
	
	@PostMapping("/check-login")
	public ModelAndView login(Model model, HttpSession session,
			@RequestParam(name = "email", required = true) String email,
			@RequestParam(name = "password", required = true) String password) throws IOException {
		
		AccountModel account = accountService.findOneByEmail(email);

		ModelAndView modelAndView = null;
		if (account != null && account.getPassword().equals(password)) {
			CustomerModel customer = customerService.findOneByAccountId(account.getId());
			
			if(customer != null) {
				Long idCustomer = customer.getId();
				List<ProductModel> product_carts = loadCartsList(idCustomer);
				
				session.setAttribute("product_carts", product_carts);
				session.setAttribute("customer", customer);
				
				modelAndView = new ModelAndView("redirect:/home");
			}
			else {
				
				session.setAttribute("account", account);
				
				customer = new CustomerModel();
				customer.setFullName("Người dùng " + email);
				customer.setAvatar("/assets/images/user/unknown-person.jpg");
				session.setAttribute("customer", customer);
				
				model.addAttribute("type", "success");
				model.addAttribute("message", "Chào mừng " + email + " đến với Fullstack Phone Shop! Bạn vui lòng điền thông tin cá nhân vào dưới đây nhé!");

				modelAndView = new ModelAndView("content/web/register");
			}
		} else {
			model.addAttribute("products", productService.findAll());
			model.addAttribute("type", "error");
			model.addAttribute("message", "Bạn nhập sai tên tài khoản hoặc mật khẩu, vui lòng nhập lại");
			modelAndView = new ModelAndView("content/web/home");
		}

		return modelAndView;
	}
	
	@RequestMapping(value = {"/logout"}, method = RequestMethod.GET)
	public ModelAndView logout(Model model, HttpSession session) throws IOException {
		
		session.removeAttribute("customer");
		session.removeAttribute("product_carts");

		return new ModelAndView("redirect:/home");
	}
	
	@PostMapping("/register")
	public ModelAndView register(HttpSession session,
			@RequestParam(name = "email", required = true) String email,
			@RequestParam(name = "password", required = true) String password,
			@RequestParam(name = "password2", required = true) String password2) {
		
		ModelAndView model = null;
		
		AccountModel account = accountService.findOneByEmail(email);
		if(account != null) {
			model = new ModelAndView("content/web/home");
			model.addObject("type", "error");
			model.addObject("message", "Email bạn đăng ký đã được sử dụng. Vui lòng sử dụng một email khác!");
			model.addObject("products", productService.findAll());
			return model;
		}
		else {
			if(!password.equals(password2)) {
				model = new ModelAndView("content/web/home");
				model.addObject("type", "error");
				model.addObject("message", "Nhập lại mật khẩu khác với mật khẩu trước đó. Vui lòng nhập lại!");
				model.addObject("products", productService.findAll());
				return model;
			}
			else {
				model = new ModelAndView("content/web/register");
				account = new AccountModel();
				account.setEmail(email);
				account.setPassword(password);
				account.setPermission(1);
				
				accountService.save(account);
				
				session.setAttribute("account", accountService.findOneByEmail(email));
				
				CustomerModel customer = new CustomerModel();
				customer.setFullName("Người dùng " + email);
				customer.setAvatar("/assets/images/user/unknown-person.jpg");
				session.setAttribute("customer", customer);
				
				model.addObject("type", "success");
				model.addObject("message", "Đăng ký thành công! Bạn vui lòng điền thông tin vào dưới đây.");
				
				return model;
			}
		}
	}
	
	@PostMapping("/save-user-info")
	public ModelAndView saveUserInfo(HttpSession session,
			@RequestParam(name = "id-account") int idAccount,
			@RequestParam(name = "user-image") CommonsMultipartFile file,
			@RequestParam(name = "full-name") String fullName,
			@RequestParam(name = "address") String address,
			@RequestParam(name = "gender") String male) throws IOException {
		
		// Init user info
		CustomerModel customer = new CustomerModel();
		customer.setIdAccount(idAccount);
		customer.setFullName(fullName);
		customer.setAddress(address);
		customer.setGender((male.equals("Nam")) ? 1 : 0);
		
		// Save image
		ServletContext context = session.getServletContext();  
	    String path = context.getRealPath("/WEB-INF/views/assets/images/user/");  
	    String filename = file.getOriginalFilename();  
	  
	    System.out.println(path + filename);        
	  
	    byte[] bytes = file.getBytes();  
	    BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(  
	         new File(path + File.separator + filename)));  
	    stream.write(bytes);  
	    stream.flush();  
	    stream.close();  

		customer.setAvatar("/assets/images/user/" + filename);
		
		Long idCustomer = customerService.save(customer);
		customer = customerService.findOneByAccountId((long)idAccount);
		idCustomer = customer.getId();
		List<ProductModel> product_carts = loadCartsList(idCustomer);
		
		session.setAttribute("product_carts", product_carts);
		session.setAttribute("customer", customer);
		
		return new ModelAndView("redirect:/home");
	}
	
	@RequestMapping(value = {"/home"}, method = RequestMethod.GET)
	public String loadPageHomeUser(Model model, HttpSession session) {
		
		model.addAttribute("products", productService.findAll());
		
		CustomerModel customer = (CustomerModel) session.getAttribute("customer");
		if(customer != null) {
			model.addAttribute("type", "success");
			model.addAttribute("message", "Chào mừng " + customer.getFullName() + " đến với Fullstack Phone Shop!");
		}
		
		return "content/web/home";
	}
	
	@RequestMapping(value = {"/product-info/{id}"}, method = RequestMethod.GET)
	public String loadPageHomeUser(Model model, @PathVariable(name = "id") Long id, HttpSession session) {
		ProductModel product = productService.findOne(id);
		if(product != null) {
			model.addAttribute("product", product);
			
			return "content/web/product";
		}
		else {
			model.addAttribute("type", "error");
			model.addAttribute("message", "Sự cố sảy ra, bạn vui lòng xem sản phẩm khác!");
			return "content/web/home";
		}
		
	}
	
	@RequestMapping(value = {"/add-to-cart"}, method = RequestMethod.POST)
	public void addToCart(HttpServletRequest request, HttpSession session) {
		Long idProduct = Long.parseLong(request.getHeader("idProduct"));
		int quantity = Integer.parseInt(request.getHeader("quantity"));
		Long idCustomer = ((CustomerModel) session.getAttribute("customer")).getId();
		
		CartModel cart = new CartModel();
		cart.setIdProduct(idProduct);
		cart.setIdCustomer(idCustomer);
		cart.setQuantity(quantity);
		
		System.out.println(idProduct + " - " + idCustomer + " - " +quantity);
		
		cartService.save(cart);
		
		List<ProductModel> product_carts = loadCartsList(idCustomer);
		session.setAttribute("product_carts", product_carts);
	}
	
	@RequestMapping(value = {"/remove-from-cart"}, method = RequestMethod.POST)
	public void removeFromCart(HttpServletRequest request, HttpSession session) {
		Long idProduct = Long.parseLong(request.getHeader("idProduct"));
		Long idCustomer = ((CustomerModel) session.getAttribute("customer")).getId();
		
		System.out.println(idProduct + " - " + idCustomer);
		
		cartService.delete(idCustomer, idProduct);
		List<ProductModel> product_carts = loadCartsList(idCustomer);
		session.setAttribute("product_carts", product_carts);
	}
}
