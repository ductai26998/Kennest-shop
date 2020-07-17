package com.ductai.kennestshop.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ductai.kennestshop.dao.UserDAO;

/**
 * Servlet implementation class Register
 */
@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/register.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		String name = (String) request.getParameter("name");
		String email = (String) request.getParameter("email");
		String phone = (String) request.getParameter("phone");
		String address = (String) request.getParameter("address");
		String username = (String) request.getParameter("username");
		String password = (String) request.getParameter("password");
		String rePassword = (String) request.getParameter("rePassword");
		
		UserDAO userDAO = new UserDAO();
		boolean isUsernameExists  = userDAO.isUsernameExists(username);
		
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
		if (username == "") {
			errors.add("Tên đăng nhập không được bỏ trống !");
		}
		if (password == "") {
			errors.add("Mật khẩu không được bỏ trống !");
		}
		System.out.println(password);
		System.out.println(rePassword);
//		if (password != rePassword) {
//			errors.add("Mật khẩu không trùng khớp !");
//		}
		if (isUsernameExists) {
			errors.add("Tên đăng nhập đã tồn tại");
		}
		if (errors.size() > 0) {
			request.setAttribute("errors", errors);
			request.setAttribute("errorsLength", errors.size());
//			request.setAttribute("values", request.getAttributeNames());
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/register.jsp");       
			dispatcher.forward(request, response);
		} else {
//			int passwordHashed = password.hashCode();
			userDAO.insertUser(name, username, password, email, phone, address);
			response.sendRedirect(request.getContextPath() + "/login");
		}
		
	}

}
