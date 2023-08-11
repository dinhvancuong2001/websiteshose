package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import Connection.ConnectionUtil;
import Model.Order;
import Model.Wishlist;

public class wishlistDao {
	  
	
	public List<Wishlist> getListWishlists() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM `wishlist`");
				ResultSet rs = st.executeQuery()) {
			List<Wishlist> result = new ArrayList<>();
			while (rs.next()) {
				int id = rs.getInt("id");
				int product_id = rs.getInt("product_id");
				int user_id = rs.getInt("user_id");
				
				Wishlist wishlist = new Wishlist(id,product_id,user_id);
				result.add(wishlist);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	
	public List<Wishlist> getListWishlistByUser(int user_id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM `wishlist` where user_id = ?");
				) {
			st.setInt(1, user_id);
			ResultSet rs = st.executeQuery();
			List<Wishlist> result = new ArrayList<>();
			while (rs.next()) {
				int id = rs.getInt("id");
				int product_id = rs.getInt("product_id");
				int userid = rs.getInt("user_id");
				
				Wishlist wishlist = new Wishlist(id,product_id,userid);
				result.add(wishlist);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	
	public Wishlist checkWishlist(Wishlist wishlist) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM `wishlist` where product_id = ? and user_id = ?");
				) {
			st.setInt(1, wishlist.getProduct_id());
			st.setInt(2, wishlist.getUser_id());
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				int product_id = rs.getInt("product_id");
				int user_id = rs.getInt("user_id");
				
				Wishlist w = new Wishlist(id,product_id,user_id);
				return w;
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public void addWishlist(Wishlist wishlist) {
		try (
			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement stt = conn.prepareStatement("insert into `wishlist`(product_id,user_id) values(?,?);");
		) {
			stt.setDouble(1,wishlist.getProduct_id());
			stt.setInt(2, wishlist.getUser_id());
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void removeWishlist(int prodduct_id,int user_id) {
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement("Delete from `wishlist` where product_id = ? and user_id = ?");) {
			stt.setInt(1, prodduct_id);
			stt.setInt(2, user_id);
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int countWishlist(int user_id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select count(id) from wishlist where user_id = ?;");
				) {
			st.setInt(1, user_id);
			
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int count = rs.getInt(1);
				return count;
			}
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
