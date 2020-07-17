package com.ductai.kennestshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ductai.kennestshop.bo.User;
import com.ductai.kennestshop.dbconnection.ConnectionFactory;

public class UserDAO {
	public ArrayList<User> getAllUser() {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		ArrayList<User> users = new ArrayList<User>();

		try {
			connection = ConnectionFactory.getConnection();
			String sql = "SELECT * FROM users";
			statement = connection.createStatement();

			resultSet = statement.executeQuery(sql);

			//todo
			while (resultSet.next()) {
				users.add(convertToUser(resultSet));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return users;
	}

	private static User convertToUser(ResultSet rs) throws SQLException {
		User user = new User();

		user.setId(rs.getInt(1));
		user.setName(rs.getString(2));
		user.setUsername(rs.getString(3));
		user.setPassword(rs.getString(4));
		user.setEmail(rs.getString(5));
		user.setPhone(rs.getString(6));
		user.setAddress(rs.getString(7));
		user.setRole(rs.getString(8));
		return user;
	}
	
	public void insertUser(String name, String username, String password, String email, String phone, String address) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {	
			connection = ConnectionFactory.getConnection();
			String sql = "INSERT INTO users (name, username, password, email, phone, address) VALUES (?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, username);
			preparedStatement.setString(3, password);
			preparedStatement.setString(4, email);
			preparedStatement.setString(5, phone);
			preparedStatement.setString(6, address);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	public boolean isUsernameExists(String username) {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			connection = ConnectionFactory.getConnection();
			String sql = "SELECT * FROM users WHERE username = '"
					+ username + "'";
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				return true;
			}
		} catch (SQLException e) {
			//Handle errors for JDBC
			e.printStackTrace();
		} 
		return false;
	}

	
	public User findByUsernameAndPassword(String username, String password) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = ConnectionFactory.getConnection();
			String sql = "SELECT * FROM users WHERE username = ? and password = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			resultSet = preparedStatement.executeQuery();
			//todo
			while (resultSet.next()) {
				User user = convertToUser(resultSet);
				System.out.println(user.getRole());
				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public User findById(int id) {

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		User user = new User();

		try {
			connection = ConnectionFactory.getConnection();
			String sql = "SELECT * FROM users WHERE id =" + id;
			statement = connection.createStatement();

			resultSet = statement.executeQuery(sql);
			//todo
			while (resultSet.next()) {
				user = convertToUser(resultSet);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}
}
