package Model;

import java.util.Date;

public class Feedback {

	private int id;
	private String name;
	private String email;
	private String subject;
	private String message;
	private Date create_at;
	private int status;
	private int user_id;
	
	public Feedback(int id, String name, String email, String subject, String message, Date create_at,
			int status,int user_id) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.subject = subject;
		this.message = message;
		this.create_at = create_at;
	
		this.status = status;
		this.user_id = user_id;
	}
	
	public Feedback( String name, String email, String subject, String message, Date create_at, 
			int status,int user_id) {
		super();
		this.name = name;
		this.email = email;
		this.subject = subject;
		this.message = message;
		this.create_at = create_at;
		
		this.status = status;
		this.user_id = user_id;
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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}



	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	
	
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "feedback [id=" + id + ", name=" + name + ", email=" + email + ", subject=" + subject + ", message="
				+ message + ", create_at=" + create_at  + ", status=" + status + "]";
	}
	
	
}
