package Model;

public class SalesStatistics {

	
	private int year;
	private int month;
	private int countproduct;
   
    
	public SalesStatistics(int year, int month, int countproduct) {
		super();
		this.year = year;
		this.month = month;
		this.countproduct = countproduct;
		
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getCountproduct() {
		return countproduct;
	}

	public void setCountproduct(int countproduct) {
		this.countproduct = countproduct;
	}

	@Override
	public String toString() {
		return "SalesStatistics [year=" + year + ", month=" + month + ", countproduct=" + countproduct + "]";
	}
    
    
    
    
    
    
}
