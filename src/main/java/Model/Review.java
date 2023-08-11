package Model;

import java.util.Date;

public class Review {
	private int id;
	private String name;
	private String email;
	private String content;
	private int rating;
	private int product_id;
	private Date create_at;
	
	public Review(int id, String name, String email, String content, int rating, int product_id,Date create_at) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.content = content;
		this.rating = rating;
		this.create_at = create_at;
		this.product_id = product_id;
	}
	
	public Review( String name, String email, String content, int rating,int product_id) {
		super();
		this.name = name;
		this.email = email;
		this.content = content;
		this.rating = rating;
		this.create_at = create_at;
		this.product_id = product_id;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public Date getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	@Override
	public String toString() {
		return "Review [id=" + id + ", name=" + name + ", email=" + email + ", content=" + content + ", rating="
				+ rating + ", create_at=" + create_at + ", product_id=" + product_id + "]";
	}
	
	
}
