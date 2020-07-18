package com.ductai.kennestshop.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ductai.kennestshop.bo.Product;
import com.ductai.kennestshop.dao.ProductDAO;
import com.ductai.kennestshop.utils.FileUpdateUtil;
import javax.servlet.annotation.MultipartConfig;

/**
 * Servlet implementation class UpdateProduct
 */
@WebServlet("/updateProduct")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 10,
		maxFileSize = 1024 * 1024 * 50,
		maxRequestSize = 1024 * 1024 * 100
		)
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String productId = request.getParameter("id");
		int id = Integer.parseInt(productId);
		ProductDAO productDAO = new ProductDAO();
		Product product = productDAO.findById(id);
		request.setAttribute("product", product);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/updateProduct.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");

		String productId = (String) request.getParameter("id");
		int id = Integer.parseInt(productId);
		String productName = (String) request.getParameter("productName");
		String weightStr = (String) request.getParameter("weight");
		float weight = Float.parseFloat(weightStr);
		String priceStr = (String) request.getParameter("price");
		int price = Integer.parseInt(priceStr);
//		String statusStr = request.getParameter("status");
//		boolean status = Boolean.parseBoolean(statusStr);
		String imagePath = FileUpdateUtil.saveImage(request);
		String description = (String) request.getParameter("description");
		
		ProductDAO productDAO = new ProductDAO();
		productDAO.updateProduct(id, productName, weight, price, imagePath, description);
		response.sendRedirect(request.getContextPath() + "/products");
	}

}
