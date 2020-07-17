package com.ductai.kennestshop.modal;

public class OrderView {
	private int id;
	private String product;
	private String user;
	private String email;
	private String phone;
	private String address;
	private String time;
	private String payment;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
//	
//	public void insertOrderView(String product, String user, String email, String phone, String address, String time, String payment) {
//		Connection connection = null;
//		PreparedStatement preparedStatement = null;
//		try {
//			connection = ConnectionFactory.getConnection();
//			String sql = "INSERT INTO orderview_list (product, user, email, phone, address, time, payment) VALUES (?,?,?,?,?,?,?)";
//			preparedStatement = connection.prepareStatement(sql);
//			preparedStatement.setString(1, product);
//			preparedStatement.setString(2, user);
//			preparedStatement.setString(3, email);
//			preparedStatement.setString(4, phone);
//			preparedStatement.setString(5, address);
//			preparedStatement.setString(6, time);
//			preparedStatement.setString(7, payment);
//			preparedStatement.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} 
//	}
//	
//	public static OrderView convertToOrderView(ResultSet rs) throws SQLException {
//		OrderView orderView = new OrderView();
//		UserDAO userDAO = new UserDAO();
//		User user = userDAO.findById(orderView.getId());
//
//		orderView.setId(rs.getInt(1));
//		orderView.setProduct(rs.getString(2));
//		orderView.setUser(rs.getString(3));
//		orderView.setEmail(rs.getString(4));
//		orderView.setPhone(rs.getString(5));
//		orderView.setAddress(rs.getString(6));
//		orderView.setTime(rs.getString(7));
//		orderView.setPayment(rs.getString(8));
//		return orderView;
//	}
//	
}
