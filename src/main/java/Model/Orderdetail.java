package Model;

public class Orderdetail {
	private int id;
	private double price;
	private int quantity;
	private double total_money; // tổng tiền của 1 sản phẩm
	private int product_id;
	private int order_id;
	private int status;
	
	
	public Orderdetail(int id, double price, int quantity, double total_money, int product_id, int order_id,
			int status) {
		super();
		this.id = id;
		this.price = price;
		this.quantity = quantity;
		this.total_money = total_money;
		this.product_id = product_id;
		this.order_id = order_id;
		this.status = status;
	}

	public Orderdetail(int id, double price, int quantity, double total_money, int product_id, int order_id) {
		super();
		this.id = id;
		this.price = price;
		this.quantity = quantity;
		this.total_money = total_money;
		this.product_id = product_id;
		this.order_id = order_id;
	}
	
	public Orderdetail( double price, int quantity, double total_money, int product_id, int order_id,int status) {
		super();
		
		this.price = price;
		this.quantity = quantity;
		this.total_money = total_money;
		this.product_id = product_id;
		this.order_id = order_id;
		this.status = status;
	}
	
	public Orderdetail( double price, int quantity, double total_money, int product_id, int order_id) {
		super();
		
		this.price = price;
		this.quantity = quantity;
		this.total_money = total_money;
		this.product_id = product_id;
		this.order_id = order_id;
	}
	
	public Orderdetail( double price, int quantity, int product_id, int order_id) {
		super();
		
		this.price = price;
		this.quantity = quantity;
		
		this.product_id = product_id;
		this.order_id = order_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotal_money() {
		return total_money;
	}

	public void setTotal_money(double total_money) {
		this.total_money = total_money;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Orderdetail [id=" + id + ", price=" + price + ", quantity=" + quantity + ", total_money=" + total_money
				+ ", product_id=" + product_id + ", order_id=" + order_id + ", status=" + status + "]";
	}

	
	
	
	
}
