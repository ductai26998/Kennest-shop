package com.ductai.kennestshop.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ductai.kennestshop.bo.Product;
import com.ductai.kennestshop.dao.OrderDAO;
import com.ductai.kennestshop.dao.ProductDAO;
import com.ductai.kennestshop.dao.UserDAO;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Payment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpServletRequest httpReq = (HttpServletRequest) request;
		HttpSession session = httpReq.getSession(false);
		
		UserDAO userDAO = new UserDAO(); 
		int userId = (int) session.getAttribute("userId");
		request.setAttribute("user", userDAO.findById(userId));
		
		String productId = request.getParameter("id");
		int id = Integer.parseInt(productId);
		
		ProductDAO productDAO = new ProductDAO();
		Product product = productDAO.findById(id);
		
		request.setAttribute("product", product);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/payment.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpServletRequest httpReq = (HttpServletRequest) request;
		HttpSession session = httpReq.getSession(false);
		
		request.setCharacterEncoding("utf-8");
		String productIdStr = request.getParameter("productId");
		int productId = Integer.parseInt(productIdStr);
		int userId = (int) session.getAttribute("userId");
		LocalDateTime currentDateTime = LocalDateTime.now();
		DateTimeFormatter myFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String time = currentDateTime.format(myFormat);
		String payment = request.getParameter("payment");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		ArrayList<String> errors = new ArrayList<String>();
		
		if (name == "") {
			errors.add("Họ tên không được bỏ trống !");
		}
		if (email == "") {
			errors.add("Email không được bỏ trống !");
		}
		if (phone == "") {
			errors.add("Số điện thoại không được bỏ trống !");
		}
		if (address == "") {
			errors.add("Địa chỉ không được bỏ trống !");
		}
		if (payment == null) {
			errors.add("Vui lòng chọn hình thức giao hàng!");
		}
		
		if (errors.size() > 0) {
			request.setAttribute("errors", errors);
			request.setAttribute("errorsLength", errors.size());
			
			UserDAO userDAO = new UserDAO();
			request.setAttribute("user", userDAO.findById(userId));
			
			ProductDAO productDAO = new ProductDAO();
			Product product = productDAO.findById(productId);
			request.setAttribute("product", product);
			
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/payment.jsp");       
			dispatcher.forward(request, response);
		} else {
			OrderDAO orderDAO = new OrderDAO();
			orderDAO.insertOrder(productId, userId, time, payment);
			
			response.sendRedirect(request.getContextPath() + "/products");
		}
		
	}

}
