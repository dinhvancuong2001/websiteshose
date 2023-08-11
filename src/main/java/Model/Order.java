package Model;

import java.util.Date;

public class Order {
	private int id;
	private String fullname;
	private String email;
	private String phonenumber;
	private String address;
	private String note;
	private Date order_date;
	private double total_money;  // tổng tiền của cả hóa đơn
	private int user_id;
	private int status;
	
	public Order(int id, String fullname, String email, String phonenumber, String address,
			String note, Date order_date, double total_money, int user_id, int status) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.email = email;
		this.phonenumber = phonenumber;
		this.address = address;
		this.note = note;
		this.order_date = order_date;
		this.total_money = total_money;
		this.user_id = user_id;
		this.status = status;
	}
	
	public Order(int id, String fullname, String email, String phonenumber, String address,
			String note, int status) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.email = email;
		this.phonenumber = phonenumber;
		this.address = address;
		this.note = note;
		this.status = status;
	}
	
	public Order( String fullname, String email, String phonenumber, String address,
			String note, Date order_date, double total_money, int user_id, int status) {
		super();
		
		this.fullname = fullname;
		this.email = email;
		this.phonenumber = phonenumber;
		this.address = address;
		this.note = note;
		this.order_date = order_date;
		this.total_money = total_money;
		this.user_id = user_id;
		this.status = status;
	}
	
	public Order( String fullname, String email, String phonenumber, String address,
			String note, double total_money, int user_id) {
		super();
		
		this.fullname = fullname;
		this.email = email;
		this.phonenumber = phonenumber;
		this.address = address;
		this.note = note;
	
		this.total_money = total_money;
		this.user_id = user_id;
		
	}
	
	public Order(int id, String fullname, String email, String phonenumber, String address,
			String note,double total) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.email = email;
		this.phonenumber = phonenumber;
		this.address = address;
		this.note = note;
		this.total_money =  total;
	}
	
	public Order(int id, double total_money, int user_id) {
		super();
		
		this.id = id;
		this.total_money = total_money;
		this.user_id = user_id;
		
	}
	
	
	
	public Order( double total_money, int user_id) {
		super();
		
	
		this.total_money = total_money;
		this.user_id = user_id;
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public double getTotal_money() {
		return total_money;
	}

	public void setTotal_money(double total_money) {
		this.total_money = total_money;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", fullname=" + fullname + ", email=" + email + ", phonenumber=" + phonenumber
				+ ", address=" + address + ", note=" + note + ", order_date=" + order_date + ", total_money="
				+ total_money + ", user_id=" + user_id + ", status=" + status + "]";
	}

	
	
	
	
	
	
}
