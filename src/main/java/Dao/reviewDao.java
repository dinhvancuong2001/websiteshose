package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import Connection.ConnectionUtil;
import Model.Order;
import Model.Product;
import Model.Review;

public class reviewDao {

	
	public List<Review> getListReviews(int product_id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select * from review where product_id = ? order by created_at desc;");
				) {
			st.setInt(1, product_id);
			ResultSet rs = st.executeQuery();
			List<Review> result = new ArrayList<>();
			while (rs.next()) {
				
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String content = rs.getString("content");
				
				int rating = rs.getInt("rating");
				int producid = rs.getInt("product_id");
				
				Date create_at = rs.getDate("created_at");
				
				
				Review review = new Review(id,name,email, content, rating, product_id,create_at);
				
				result.add(review);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	
	public List<Review> getReviewByPage(List<Review> list, int start,int end){
		List<Review> arr = new ArrayList();
		for (int i = start; i < end; i++) {
			arr.add(list.get(i));
		}
		return arr;
	}
	
	
	public void addReview(Review review) {
		try (
			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement stt = conn.prepareStatement("insert into `review`(name,email,content,rating,product_id,created_at) values(?,?,?,?,?,NOW());");
		) {
			stt.setString(1, review.getName());
			stt.setString(2, review.getEmail());
			stt.setString(3, review.getContent());
			stt.setInt(4, review.getRating());
			stt.setInt(5, review.getProduct_id());
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public float getAVGReview(int product_id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select avg(rating) from review where product_id =? ;");
				) {
			st.setInt(1, product_id);
			ResultSet rs = st.executeQuery();
			List<Review> result = new ArrayList<>();
			while (rs.next()) {
				
				float avg = rs.getFloat(1);
				return avg;
			}
			return -1;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
	}
}
	
	public int getCountReview(int product_id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select count(*) from review where product_id =? ;");
				) {
			st.setInt(1, product_id);
			ResultSet rs = st.executeQuery();
			List<Review> result = new ArrayList<>();
			while (rs.next()) {
				
				int count = rs.getInt(1);
				return count;
			}
			return -1;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
	}
}
	
	public int getCountReviewRating(int product_id,int rating) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select count(rating) from review where product_id =? and rating =? ;");
				) {
			st.setInt(1, product_id);
			st.setInt(2, rating);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				
				int count = rs.getInt(1);
				return count;
			}
			return -1;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
	}
}
}
