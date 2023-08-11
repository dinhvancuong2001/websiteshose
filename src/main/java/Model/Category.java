package Model;

public class Category {
	private int id;
	private String name;
	private  int shoetype_id;
	
	public Category(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	public Category( String name) {
		super();
		this.name = name;
	}
	
	

	public Category(int id, String name, int shoetype_id) {
		super();
		this.id = id;
		this.name = name;
		this.shoetype_id = shoetype_id;
	}
	
	public Category(String name, int shoetype_id) {
		super();
		
		this.name = name;
		this.shoetype_id = shoetype_id;
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
	
	

	public int getShoetype_id() {
		return shoetype_id;
	}

	public void setShoetype_id(int shoetype_id) {
		this.shoetype_id = shoetype_id;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", shoetype_id=" + shoetype_id + "]";
	}


	
	
}
