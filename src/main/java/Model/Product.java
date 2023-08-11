package Model;

import java.util.Date;

public class Product {
	
	private int id;
	private String name;
	private String short_description;
	private double price;
	private double discount; // giá bán tại thời điểm giảm giá
	private int quantity;
	private String thumbnail;
	private String description;
	private int is_featured;  //để xác định răng sản phẩm có được giảm giá, hay mới nhất...
	private int status;
	private int category_id;
	private Date create_at;
	private Date update_at;
	
	
	public Product(int id, String name, String short_description, double price, double discount, int quantity,
			String thumbnail, String description, int is_featured, int status, int category_id, Date create_at,
			Date update_at) {
		super();
		this.id = id;
		this.name = name;
		this.short_description = short_description;
		this.price = price;
		this.discount = discount;
		this.quantity = quantity;
		this.thumbnail = thumbnail;
		this.description = description;
		this.is_featured = is_featured;
		this.status = status;
		this.category_id = category_id;
		this.create_at = create_at;
		this.update_at = update_at;
	}
	
	
	public Product(int id, String name, String short_description, double price, double discount, int quantity,
			String thumbnail, String description, int is_featured, int category_id) {
		super();
		this.id = id;
		this.name = name;
		this.short_description = short_description;
		this.price = price;
		this.discount = discount;
		this.quantity = quantity;
		this.thumbnail = thumbnail;
		this.description = description;
		this.is_featured = is_featured;
		
		this.category_id = category_id;
		
	}
	
	public Product(int id, String name, String short_description, double price, double discount, int quantity,
			String thumbnail, String description, int category_id) {
		super();
		this.id = id;
		this.name = name;
		this.short_description = short_description;
		this.price = price;
		this.discount = discount;
		this.quantity = quantity;
		this.thumbnail = thumbnail;
		this.description = description;
	
		
		this.category_id = category_id;
		
	}
	
	public Product( String name, String short_description, double price, double discount, int quantity,
			String thumbnail, String description, int is_featured, int category_id) {
		super();
		
		this.name = name;
		this.short_description = short_description;
		this.price = price;
		this.discount = discount;
		this.quantity = quantity;
		this.thumbnail = thumbnail;
		this.description = description;
		this.is_featured = is_featured;
		
		this.category_id = category_id;
		
	}
	
	public Product( String name, String short_description, double price, double discount, int quantity,
			String thumbnail, String description, int category_id) {
		super();
		
		this.name = name;
		this.short_description = short_description;
		this.price = price;
		this.discount = discount;
		this.quantity = quantity;
		this.thumbnail = thumbnail;
		this.description = description;
	
		this.category_id = category_id;
		
	}
	public Product( String name, String short_description, double price, double discount, int quantity,
			String thumbnail, String description, int is_featured, int status, int category_id, Date create_at,
			Date update_at) {
		super();
	
		this.name = name;
		this.short_description = short_description;
		this.price = price;
		this.discount = discount;
		this.quantity = quantity;
		this.thumbnail = thumbnail;
		this.description = description;
		this.is_featured = is_featured;
		this.status = status;
		this.category_id = category_id;
		this.create_at = create_at;
		this.update_at = update_at;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShort_description() {
		return short_description;
	}

	public void setShort_description(String short_description) {
		this.short_description = short_description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getIs_featured() {
		return is_featured;
	}

	public void setIs_featured(int is_featured) {
		this.is_featured = is_featured;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public Date getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}

	public Date getUpdate_at() {
		return update_at;
	}

	public void setUpdate_at(Date update_at) {
		this.update_at = update_at;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", short_description=" + short_description + ", price=" + price
				+ ", discount=" + discount + ", quantity=" + quantity + ", thumbnail=" + thumbnail + ", description="
				+ description + ", is_featured=" + is_featured + ", status=" + status + ", category_id=" + category_id
				+ ", create_at=" + create_at + ", update_at=" + update_at + "]";
	}
	
	
	
	
}
