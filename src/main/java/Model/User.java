package Model;

public class User {
	private int id;
	private String username;	
	private String email;
	private String password;
	private int role_id;  // mặc định là 2: user
	private int status; // mặc định là 1;
	

	
	


	public User(int id, String username, String email, String password, int role_id, int status) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.role_id = role_id;
		this.status = status;
	}
	
	
	
	public User(int id, String username, String email, String password, int role_id) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.role_id = role_id;
		
	}
	
	

	public User( String username, String email, String password, int role_id, int status) {
		super();

		this.username = username;
		this.email = email;
		this.password = password;
		this.role_id = role_id;
		this.status = status;
	}
	
	public User( String username, String email, String password, int role_id) {
		super();

		this.username = username;
		this.email = email;
		this.password = password;
		this.role_id = role_id;
	
	}
	
	public User( String username, String email, String password) {
		super();

		this.username = username;
		this.email = email;
		this.password = password;

	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	

	

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRole_id() {
		return role_id;
	}

	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", email=" + email
				  + ", password=" + password + ", role_id="
				+ role_id + ", status=" + status + "]";
	}

	
	
	
	
	
}
