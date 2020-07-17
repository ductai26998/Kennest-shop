package com.ductai.kennestshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ductai.kennestshop.bo.Product;
import com.ductai.kennestshop.dbconnection.ConnectionFactory;

public class ProductDAO {
	public ArrayList<Product> getAllProduct() {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		ArrayList<Product> products = new ArrayList<Product>();

		try {
			connection = ConnectionFactory.getConnection();
			String sql = "SELECT * FROM products";
			statement = connection.createStatement();

			resultSet = statement.executeQuery(sql);

			//todo
			while (resultSet.next()) {
				products.add(convertToProduct(resultSet));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return products;
	}

	private static Product convertToProduct(ResultSet rs) throws SQLException {
		Product product = new Product();

		product.setId(rs.getInt(1));
		product.setProductName(rs.getString(2));
		product.setWeight(rs.getFloat(3));
		product.setPrice(rs.getInt(4));
		product.setStatus(rs.getBoolean(5));
		product.setOrderedQuantity(rs.getInt(6));
		product.setImage(rs.getString(7));
		product.setDescription(rs.getString(8));
		return product;
	}

	public void insertProduct(String productName,
			float weight,
			int price,
			String image,
			String description) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = ConnectionFactory.getConnection();
			String insertSQL = "INSERT INTO products (product_name, weight, price, image, description)"
					+ "VALUES (?, ?, ?, ?, ?, ?)";
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, productName);
			preparedStatement.setFloat(2, weight);
			preparedStatement.setInt(3, price);
			preparedStatement.setString(4, image);
			preparedStatement.setString(5, description);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Product findById(int id) {

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		Product product = new Product();

		try {
			connection = ConnectionFactory.getConnection();
			String sql = "SELECT * FROM products WHERE id =" + id;
			statement = connection.createStatement();

			resultSet = statement.executeQuery(sql);
			//todo
			while (resultSet.next()) {
				product = convertToProduct(resultSet);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return product;
	}

	public void updateProduct(
			int id,
			String productName,
			float weight,
			int price,
			boolean status,
			String image,
			String description) {
		Connection connection = null;
		Statement statement = null;

		try {
			connection = ConnectionFactory.getConnection();
			String sql = "UPDATE products SET "
					+ "product_name = '" + productName
					+ "', weight = '" + weight
					+ "', price = '" + price
					+ "', status = '" + status
					+ "', image = '" + image
					+ "', description = '" + description
					+ "'WHERE id =" + id
					+ ";";
			statement = connection.createStatement();
			statement.executeUpdate(sql);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void deleteProduct(int id) {
		Connection connection = null;
		Statement statement = null;

		try {
			connection = ConnectionFactory.getConnection();
			String sql = "DELETE FROM products WHERE id=" + id;
			statement = connection.createStatement();
			statement.executeUpdate(sql);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	public ArrayList<Product> searchByName(String textSearch) {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		ArrayList<Product> products = new ArrayList<Product>();

		try {
			connection = ConnectionFactory.getConnection();
			String sql = "SELECT * FROM products WHERE product_name LIKE '%" + textSearch + "%'";
			statement = connection.createStatement();

			resultSet = statement.executeQuery(sql);

			//todo
			while (resultSet.next()) {
				products.add(convertToProduct(resultSet));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return products;
	}

	
}
