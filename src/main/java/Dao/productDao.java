package Dao;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import Connection.ConnectionUtil;
import Model.Category;

import Model.Product;
import Model.User;

public class productDao {

	
	
	
	public String getNameShoetype(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT name FROM shoetype where id = ?");
				) {
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				
			   return name;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Category> getListCategorys() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM category");
				ResultSet rs = st.executeQuery()) {
			List<Category> result = new ArrayList<>();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int shoetype_id = rs.getInt("shoetype_id");
				Category category = new Category(id,name,shoetype_id);
				result.add(category);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	public List<String> getListDistinctCategory() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select distinct name from category;");
				ResultSet rs = st.executeQuery()) {
			List<String> result = new ArrayList<>();
			while (rs.next()) {
				String name = rs.getString("name");
				
				
				result.add(name);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	public List<Category> getListCategorysArtifical() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select * from category where shoetype_id = 1;");
				ResultSet rs = st.executeQuery()) {
			List<Category> result = new ArrayList<>();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				
				Category category = new Category(id,name);
				result.add(category);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	public List<Category> getListCategorysFutsal() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select * from category where shoetype_id = 2;");
				ResultSet rs = st.executeQuery()) {
			List<Category> result = new ArrayList<>();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				
				Category category = new Category(id,name);
				result.add(category);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	public List<Category> getListCategorysByAdmin(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM category where id != ?");
				) {
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			List<Category> result = new ArrayList<>();
			while (rs.next()) {
				int i = rs.getInt("id");
				String name = rs.getString("name");
				int shoetype_id = rs.getInt("shoetype_id");
				Category category = new Category(i,name,shoetype_id);
				result.add(category);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	public String getNameCategory(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT name FROM category where id = ?");
				) {
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				
			   return name;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Category getCategoryById(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM category where id = ?");
				) {
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int i = rs.getInt("id"); 
				String name = rs.getString("name");
				int shoetype_id = rs.getInt("shoetype_id");
			   return new Category(i, name,shoetype_id);
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Category getCategoryByNameAndShoe(String name,int shoety_id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM category where name = ? and shoetype_id = ?");
				) {
			st.setString(1, name);
			st.setInt(2, shoety_id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int i = rs.getInt("id"); 
				String n = rs.getString("name");
				int shoetype_id = rs.getInt("shoetype_id");
				
				
			   return new Category(i, name,shoety_id);
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public void addCategory(String name,int shoetype_id) {
		try (
			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement stt = conn.prepareStatement("INSERT INTO `category` ( `name`,`shoetype_id`) VALUES (?,?)");
		){
			
			stt.setString(1, name);
			stt.setInt(2, shoetype_id);
			stt.executeUpdate();
		} catch (Exception e) {
				e.printStackTrace();
		}
		}
	
	public void updateCategory(int id,String name,int shoe_id) {
		try (
			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement stt = conn.prepareStatement("update `category` set name = ?,shoetype_id = ? where id = ?");
		){
			
			stt.setString(1, name);
			stt.setInt(2, shoe_id);
			stt.setInt(3, id);
			stt.executeUpdate();
		} catch (Exception e) {
				e.printStackTrace();
		}
		}
	
	public int getCountProduct() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select count(*) from product;");
				) {
			
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int c = rs.getInt(1);
				
			   return c;
			}
			return 0;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public int getOuOfStockProduct() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select count(*) from product where quantity < 5 ;");
				) {
			
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int c = rs.getInt(1);
				
			   return c;
			}
			return 0;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public int getCategoryProduct(int product_id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select category_id from product where id = ? ;");
				) {
			st.setInt(1, product_id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int c = rs.getInt(1);
				
			   return c;
			}
			return 0;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public String getNameProduct(int product_id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select name from product where id = ? ;");
				) {
			st.setInt(1, product_id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String c = rs.getString(1);
				
			   return c;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	
	// lấy sản phẩm mới nhất cách 2 ngày so với ngày hiện tại
	
	
	public List<Product> getListProducts() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT *FROM product where status = 0 and quantity > 0;");
				ResultSet rs = st.executeQuery()) {
			List<Product> result = new ArrayList<>();
			while (rs.next()) {
				
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(id,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				result.add(product);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	public List<Product> getListProductsArtifical() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select * from product p inner join category c where p.category_id = c.id and c.shoetype_id = 1;");
				ResultSet rs = st.executeQuery()) {
			List<Product> result = new ArrayList<>();
			while (rs.next()) {
				
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(id,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				result.add(product);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	public List<Product> getListProductsFutsal() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select * from product p inner join category c where p.category_id = c.id and c.shoetype_id = 2;");
				ResultSet rs = st.executeQuery()) {
			List<Product> result = new ArrayList<>();
			while (rs.next()) {
				
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(id,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				result.add(product);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	
	
	public List<Product> getListProductByAdmin() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT *FROM product where status = 0 order by id desc;");
				ResultSet rs = st.executeQuery()) {
			List<Product> result = new ArrayList<>();
			while (rs.next()) {
				
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(id,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				result.add(product);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	
	public List<Product> getListProductsSort(String[] checkboxValues,String pricemin,String pricemax) {
		 // Xây dựng câu truy vấn SQL bằng cách kết hợp các điều kiện tìm kiếm
	    StringBuilder sqlQuery = new StringBuilder();
	    sqlQuery.append("SELECT * FROM product WHERE status = 0 and  quantity > 0 and ");

	    // Thêm điều kiện cho giá sản phẩm nằm trong khoảng min và max
	    sqlQuery.append("discount BETWEEN ").append(pricemin).append(" AND ").append(pricemax);

	    // Thêm điều kiện cho các sản phẩm đã chọn từ checkbox
	    if (checkboxValues != null && checkboxValues.length > 0) {
	        sqlQuery.append(" AND (");
	        for (int i = 0; i < checkboxValues.length; i++) {
	            sqlQuery.append("category_id = ").append(checkboxValues[i]);
	            if (i < checkboxValues.length - 1) {
	                sqlQuery.append(" OR ");
	            }
	        }
	        sqlQuery.append(")");
	    }

	    List<Product> result = new ArrayList<>();
	    // Tiến hành thực hiện truy vấn SQL và xử lý kết quả tìm kiếm
	    try (Connection connection = ConnectionUtil.getConnection();
	         PreparedStatement statement = connection.prepareStatement(sqlQuery.toString());
	         ResultSet rs = statement.executeQuery()) {
	    	
	        // Xử lý kết quả tìm kiếm
	        while (rs.next()) {
	        	int id = rs.getInt("id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(id,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				result.add(product);
	        }
	        return result;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	public List<Product> getSerachProductByName(String[] checkboxValues,String pricemin,String pricemax) {
		 // Xây dựng câu truy vấn SQL bằng cách kết hợp các điều kiện tìm kiếm
	    StringBuilder sqlQuery = new StringBuilder();
	    sqlQuery.append("SELECT * FROM product WHERE status = 0 and  quantity > 0 and ");

	    // Thêm điều kiện cho giá sản phẩm nằm trong khoảng min và max
	    sqlQuery.append("discount BETWEEN ").append(pricemin).append(" AND ").append(pricemax);

	    // Thêm điều kiện cho các sản phẩm đã chọn từ checkbox
	    if (checkboxValues != null && checkboxValues.length > 0) {
	        sqlQuery.append(" AND (");
	        for (int i = 0; i < checkboxValues.length; i++) {
	            sqlQuery.append("name like ").append("'%"+checkboxValues[i]+"%'");
	            if (i < checkboxValues.length - 1) {
	                sqlQuery.append(" OR ");
	            }
	        }
	        sqlQuery.append(")");
	    }
	   
	    List<Product> result = new ArrayList<>();
	    // Tiến hành thực hiện truy vấn SQL và xử lý kết quả tìm kiếm
	    try (Connection connection = ConnectionUtil.getConnection();
	         PreparedStatement statement = connection.prepareStatement(sqlQuery.toString());
	         ResultSet rs = statement.executeQuery()) {
	    	
	        // Xử lý kết quả tìm kiếm
	        while (rs.next()) {
	        	int id = rs.getInt("id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(id,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				result.add(product);
	        }
	        return result;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	
	public List<Product> getProductByPage(List<Product> list, int start,int end){
		List<Product> arr = new ArrayList();
		for (int i = start; i < end; i++) {
			arr.add(list.get(i));
		}
		return arr;
	}
	
	
	public List<Product> getListProductNew() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM product WHERE status = 0 and quantity > 0 and create_at >= DATE_SUB(CURDATE(), INTERVAL 2 DAY);");
				ResultSet rs = st.executeQuery()) {
			List<Product> result = new ArrayList<>();
			while (rs.next()) {
				
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(id,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				result.add(product);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	
	public int getCountProductNew() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT count(*) FROM product WHERE status = 0 and quantity > 0 and create_at >= DATE_SUB(CURDATE(), INTERVAL 2 DAY);");
				ResultSet rs = st.executeQuery()) {
			
			while (rs.next()) {
				
				int c = rs.getInt(1);
				
				
				return c;
			}
			return 0;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	// lấy 10 sản phẩm được thêm gần nhất
	public List<Product> getListProductNearest() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT *FROM product where status = 0 and quantity > 0 Order by id DESC limit 10;");
				ResultSet rs = st.executeQuery()) {
			List<Product> result = new ArrayList<>();
			while (rs.next()) {
				
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(id,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				result.add(product);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	// top 10 sản phẩm được quan tâm nhất
	public List<Product> getListTopProduct() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT od.product_id, p.*, SUM(od.quantity) AS total_sold FROM orderdetail od JOIN product p ON od.product_id = p.id  where p.quantity > 0 GROUP BY od.product_id, p.name ORDER BY total_sold DESC limit 10;");
				ResultSet rs = st.executeQuery()) {
			List<Product> result = new ArrayList<>();
			while (rs.next()) {
				
				int id = rs.getInt("product_id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("total_sold");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(id,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				result.add(product);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	
	public List<Product> getListProductByCategory(int category_id,int product_id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select * from product where category_id =? and id != ? and quantity > 0 and status = 0;");
				) {
			st.setInt(1, category_id);
			st.setInt(2, product_id);
			ResultSet rs = st.executeQuery();
			List<Product> result = new ArrayList<>();
			while (rs.next()) {
				
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int categoryid = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(id,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, categoryid, create_at, update_at);
				
				result.add(product);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	
	public Product getProductById(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM product WHERE id = ? and quantity > 0 and status = 0;");
				) {
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				
				int idp = rs.getInt("id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(idp,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				return product;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Product getProductWishlist(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM product WHERE id = ?;");
				) {
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				
				int idp = rs.getInt("id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(idp,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				return product;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public Product getOrderById(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM product WHERE id = ? and status = 0;");
				) {
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				
				int idp = rs.getInt("id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(idp,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				return product;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public List<Product> getProductOutofStock() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select * from product where quantity = 0;");
				) {
			
			ResultSet rs = st.executeQuery();
			List<Product> products = new ArrayList<>();
			while (rs.next()) {
				
				int idp = rs.getInt("id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(idp,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				products.add(product);
			}
			return products;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	
	
	public int getCountProduct(int cate_id) {
	    try (Connection connection = ConnectionUtil.getConnection();
	         PreparedStatement st = connection.prepareStatement("select count(*) from product where category_id = ?;");
	    ) {
	        st.setInt(1, cate_id);
	        ResultSet rs = st.executeQuery();
            int c = -1;
	        while(rs.next()) {
	             c = rs.getInt(1);
	            
	        }
	      
	        return c;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1;
	    }
	}

	public List<Product> serachProduct(int cate_id,String name) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM product WHERE status = 0 and quantity > 0 and category_id = ? and name like ?;");
				) {
			
		    st.setInt(1, cate_id);
		    st.setString(2,"%"+name+"%");
			ResultSet rs = st.executeQuery();
					
			List<Product> result = new ArrayList<>();
			while (rs.next()) {
				
				int id = rs.getInt("id");
				String na = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(id,na,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				result.add(product);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	public List<Product> serachProductByName(String name) {
		 try (Connection connection = ConnectionUtil.getConnection();
		            PreparedStatement st = connection.prepareStatement("SELECT * FROM product WHERE status = 0 and quantity >0 and name like ?;");) {
			
		   
		    st.setString(1,"%"+ name +"%");
		
			ResultSet rs = st.executeQuery();
		   
			List<Product> result = new ArrayList<>();
			while (rs.next()) {
				
				int id = rs.getInt("id");
				String na = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(id,na,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				result.add(product);
			}
			
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	public void updateQuantity(int productid,int quantity) {
	    try (Connection connection = ConnectionUtil.getConnection();
	         PreparedStatement st = connection.prepareStatement("update product set quantity = quantity - ? where id = ?;");
	    ) {
	    	st.setInt(1, quantity);
	        st.setInt(2, productid);
	        st.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	       
	    }
	}
	
	public void removeProduct(int productid) {
	    try (Connection connection = ConnectionUtil.getConnection();
	         PreparedStatement st = connection.prepareStatement("update product set status = 1 where id = ?;");
	    ) {
	    	
	        st.setInt(1, productid);
	        st.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	       
	    }
	}
	
	public void addsanpham(Product product) {
		try (
			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement stt = conn.prepareStatement("INSERT INTO `product` ( `name`,`short_description`, `price`,`discount`,  `quantity`, `thumbnail`, `description`, `category_id`, `create_at`, `update_at`) VALUES (?,?,?,?,?,?,?,?,now(),now())");
		){
			
			stt.setString(1, product.getName());
			stt.setString(2, product.getShort_description());
			stt.setDouble(3, product.getPrice());
			stt.setDouble(4, product.getDiscount());
			stt.setInt(5, product.getQuantity());
			stt.setString(6, product.getThumbnail());
			stt.setString(7, product.getDescription());
			stt.setInt(8, product.getCategory_id());
			
			stt.executeUpdate();
		} catch (Exception e) {
				e.printStackTrace();
		}
		}
	
	public void editsanpham (Product product) {
		try (Connection conn = ConnectionUtil.getConnection();
		PreparedStatement stt = conn.prepareStatement(
				"UPDATE `product` SET `name` = ?, `short_description` = ?, `price` = ?, `discount` = ?, `quantity` = ?, `thumbnail` = ?, `description` = ?, `category_id` = ?,update_at = Now() WHERE (`id` = ?);"
				))
			{	
			stt.setString(1, product.getName());
			stt.setString(2, product.getShort_description());
			stt.setDouble(3, product.getPrice());
			stt.setDouble(4, product.getDiscount());
			stt.setInt(5, product.getQuantity());
			stt.setString(6, product.getThumbnail());
			stt.setString(7, product.getDescription());
			stt.setInt(8, product.getCategory_id());
			
			stt.setInt(9, product.getId());
			
			stt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}
	
	

	

}
