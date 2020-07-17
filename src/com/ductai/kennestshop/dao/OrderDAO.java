package com.ductai.kennestshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ductai.kennestshop.bo.Order;
import com.ductai.kennestshop.bo.Product;
import com.ductai.kennestshop.bo.User;
import com.ductai.kennestshop.dbconnection.ConnectionFactory;
import com.ductai.kennestshop.modal.OrderView;

public class OrderDAO {
	public ArrayList<OrderView> getAllOrderView() {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		ArrayList<OrderView> orderViewList = new ArrayList<OrderView>();

		try {
			connection = ConnectionFactory.getConnection();
			String sql = "SELECT * FROM order_list";
			statement = connection.createStatement();

			resultSet = statement.executeQuery(sql);

			//todo
			while (resultSet.next()) {
				orderViewList.add(convertToOrderView(resultSet));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orderViewList;
	}

	private static OrderView convertToOrderView(ResultSet rs) throws SQLException {
		ProductDAO productDAO = new ProductDAO();
		UserDAO userDAO = new UserDAO();
		OrderView orderView = new OrderView();
		
		Product product = productDAO.findById(rs.getInt(2));
		User user = userDAO.findById(rs.getInt(3));
		
		orderView = setOrderView(rs.getInt(1), product.getProductName(), user.getName(), user.getEmail(), user.getPhone(), user.getAddress(), rs.getString(4), rs.getString(5));
		return orderView;
	}
	
	private static Order convertToOrder(ResultSet rs) throws SQLException {
		Order order = new Order();

		order.setId(rs.getInt(1));
		order.setProductId(rs.getInt(2));
		order.setUserId(rs.getInt(3));
		order.setTime(rs.getString(4));
		order.setPayment(rs.getString(5));
		return order;
	}
	
	public void insertOrder(int productId, int userId, String time, String payment) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {	
			connection = ConnectionFactory.getConnection();
			String sql = "INSERT INTO order_list (product_id, user_id, time, payment) VALUES (?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, productId);
			preparedStatement.setInt(2, userId);
			preparedStatement.setString(3, time);
			preparedStatement.setString(4, payment);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	public Order findById(int id) {

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		Order order = new Order();

		try {
			connection = ConnectionFactory.getConnection();
			String sql = "SELECT * FROM order_list WHERE id =" + id;
			statement = connection.createStatement();

			resultSet = statement.executeQuery(sql);
			//todo
			while (resultSet.next()) {
				order = convertToOrder(resultSet);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return order;
	}
	
	public static OrderView setOrderView(int id, String product, String user, String email, String phone, String address, String time, String payment) {
		OrderView orderView = new OrderView();
		orderView.setId(id);
		orderView.setProduct(product);
		orderView.setUser(user);
		orderView.setEmail(email);
		orderView.setPhone(phone);
		orderView.setAddress(address);
		orderView.setTime(time);
		orderView.setPayment(payment);
		
		return orderView;
	}
}
