package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Item;
import utils.DBUtil;

public class ItemDAO {
	private Connection conn;

	public ItemDAO() {
		try {
			this.conn = DBUtil.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
			// エラー処理
		}
	}

	//データベースから商品情報を取得するメソッド
	public List<Item> getAllItems() throws SQLException {
		List<Item> items = new ArrayList<>();
		String sql = "SELECT * FROM items";

		try (PreparedStatement statement = conn.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {
			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String name = resultSet.getString("name");
				int price = resultSet.getInt("price");
				int is_coffee = resultSet.getInt("is_coffee");
				items.add(new Item(id, name, price, is_coffee));
			}
		}
		return items;
	}

	// 商品を登録するメソッド（インサート）
	public void addItem(Item item) throws SQLException {
		String sql = "INSERT INTO items (name, price, is_coffee) VALUES (?, ?, ?)";
		try (PreparedStatement statement = conn.prepareStatement(sql)) {
			statement.setString(1, item.getName());
			statement.setInt(2, item.getPrice());
			statement.setInt(3, item.getIs_coffee());
			statement.executeUpdate();
		}
	}


	// 商品を編集するメソッド（アップデート）
	public void editItem(Item item) throws SQLException {
		String sql = "UPDATE items SET name = ?, price = ?, is_coffee = ? WHERE id = ?";
		try (PreparedStatement statement = conn.prepareStatement(sql)) {
			statement.setString(1, item.getName());
			statement.setInt(2, item.getPrice());
			statement.setInt(3, item.getIs_coffee());
			statement.setInt(4, item.getId());
			statement.executeUpdate();
		}
	}


	// 商品を削除するメソッド（デリート）
	public void deleteItem(int id) throws SQLException {
		String sql = "DELETE FROM items WHERE id = ?";
		try (PreparedStatement statement = conn.prepareStatement(sql)) {
			statement.setInt(1, id);
			statement.executeUpdate();
		}
	}

	public List<Item> findAll() {
		// TODO 自動生成されたメソッド・スタブ
		return null;
	}

	public List<Item> getAllItem() {
		// TODO 自動生成されたメソッド・スタブ
		return null;
	}

	
	

	
	










}