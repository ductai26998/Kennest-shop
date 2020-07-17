package com.ductai.kennestshop.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ductai.kennestshop.utils.FileUpdateUtil;
import com.ductai.kennestshop.dao.ProductDAO;

/**
 * Servlet implementation class InsertProduct
 */
@WebServlet("/insertProduct")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 10,
		maxFileSize = 1024 * 1024 * 50,
		maxRequestSize = 1024 * 1024 * 100
		)
public class InsertProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/insertProduct.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String productName = request.getParameter("productName");
		float weight = Float.parseFloat(request.getParameter("weight"));
		int price = (int) Float.parseFloat(request.getParameter("price"));
		String description = request.getParameter("description");
		
		String imagePath = FileUpdateUtil.saveImage(request);
		
		// MODEL
		ProductDAO productDAO = new ProductDAO();
		
		//insert selected book
		productDAO.insertProduct(productName, weight, price, imagePath, description);
		
		//VIEW
		response.sendRedirect(request.getContextPath() + "/products");
	}

}
