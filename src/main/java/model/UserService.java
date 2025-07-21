package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBUtil;

public class UserService {

	public static boolean register(String username, String password) {
		try (Connection conn = DBUtil.getConnection()) {
			String checkSql = "SELECT * FROM users WHERE username=?";
			PreparedStatement checkStmt = conn.prepareStatement(checkSql);
			checkStmt.setString(1, username);
			ResultSet rs = checkStmt.executeQuery();

			if (rs.next()) {
				return false; // user already exists
			}

			String insertSql = "INSERT INTO users (username, password) VALUES (?, ?)";
			PreparedStatement insertStmt = conn.prepareStatement(insertSql);
			insertStmt.setString(1, username);
			insertStmt.setString(2, password);
			insertStmt.executeUpdate();
			return true;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean userExists(String username) {
		try (Connection conn = DBUtil.getConnection()) {
			String sql = "SELECT * FROM users WHERE username=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean login(String username, String password) {
		try (Connection conn = DBUtil.getConnection()) {
			String sql = "SELECT * FROM users WHERE username=? AND password=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();

			return rs.next();

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	public static boolean isValidUser(String username, String password) {
		try (Connection conn = DBUtil.getConnection()) {
			String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean isAdmin(String username) {
		try (Connection conn = DBUtil.getConnection()) {
			String sql = "SELECT role FROM users WHERE username = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return "admin".equalsIgnoreCase(rs.getString("role"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
