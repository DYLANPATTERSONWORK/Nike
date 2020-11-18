package com.tedu.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tedu.model.Address;
import com.tedu.model.Cart;
import com.tedu.model.Order;
import com.tedu.model.OrderProduct;
import com.tedu.model.Product;
import com.tedu.model.User;
import com.tedu.service.IAddressService;
import com.tedu.service.ICartService;
import com.tedu.service.IOrderProductService;
import com.tedu.service.IOrderService;
import com.tedu.service.IProductService;
import com.tedu.service.IUserService;
import com.tedu.service.impl.AddressService;
import com.tedu.service.impl.CartService;
import com.tedu.service.impl.OrderProductService;
import com.tedu.service.impl.OrderService;
import com.tedu.service.impl.ProductService;
import com.tedu.service.impl.UserService;
import com.tedu.util.CodeUtil;

/**
 * Servlet implementation class OrderServlet
 */
public class OrderServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private static IAddressService addressService = new AddressService();
	private static IOrderService orderService = new OrderService();
	private static ICartService cartService = new CartService();
	private static IOrderProductService orderProductService = new OrderProductService();
	private static IProductService productService = new ProductService();
	private static IUserService userService = new UserService();
	//创建订单
	public String createOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("loginUser");
		String base = req.getParameter("base");
		String place = req.getParameter("place");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		double price = Double.parseDouble(req.getParameter("price"));
		String cids = req.getParameter("cids");//获取提交的购物车记录id
		Address address = null;
		//判断是不是新添加的地址
		if(base != null && place != null && name != null && phone != null) {
			//是新地址
			address = new Address();
			address.setAddress(base + " " + place);
			address.setName(name);
			address.setPhone(phone);
			address.setUser(user);
			int id = addressService.add(address);
			address.setId(id);
		}
		else {
			//不是新地址
			int aid = Integer.parseInt(req.getParameter("aid"));
			address = addressService.load(aid);
		}
		Order order = new Order();
		order.setPrice(price);
		order.setStatus(1);//新创建的订单是未付款状态
		order.setIsdel(1);//新创建的订单是未删除状态
		order.setUser(user);
		order.setAddress(address);
		int id = orderService.add(order);//保存订单
		order.setId(id);
		
		List<OrderProduct> orderProducts = new ArrayList<>();
		String cartids[] = cids.split(",");
		for(int i = 1; i < cartids.length; i++) {
			int cid = Integer.parseInt(cartids[i]);
			Cart cart = cartService.load(cid);
			OrderProduct orderProduct = new OrderProduct();
			orderProduct.setBuynum(cart.getQuantity());
			orderProduct.setOrder(order);
			orderProduct.setProduct(cart.getProduct());
			int opid = orderProductService.add(orderProduct);//保存订单与商品的关系
			orderProduct.setId(opid);
			orderProducts.add(orderProduct);
			order.setOrderProducts(orderProducts);//把订单与商品的关系加入到订单中
			//删除购物车记录
			cartService.delete(cid);
		}
		
		//更新session中的购物车记录数
		int cartSize = cartService.count(user.getId());
		session.setAttribute("cartSize", cartSize);
		req.setAttribute("order", order);
		return "user/pay";
	}
	//付款
	public String payment(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int oid = Integer.parseInt(req.getParameter("oid"));
		String password = req.getParameter("password");
		Order order = orderService.load(oid);
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("loginUser");
		if(!user.getPassword().equals(CodeUtil.getMD5Encoding(password))) {
			req.setAttribute("errormsg", "密码错误,请重新输入");
			return "user/pay";
		}
		//修改订单状态为已付款
		orderService.updateStatus(oid, 2);
		//修改商品的销量和库存
		List<OrderProduct> orderProducts = order.getOrderProducts();
		for(OrderProduct orderProduct:orderProducts) {
			Product product = orderProduct.getProduct();
			product.setSales(product.getSales() + orderProduct.getBuynum());
			product.setInventory(product.getInventory() - orderProduct.getBuynum());
			productService.update(product);
		}
		//修改用户账户余额
		user.setBalance(user.getBalance() - order.getPrice());
		user.setPassword(password);
		userService.update(user);
		
		req.setAttribute("order", order);
		return "user/pay_success";
	}
}
