package domain;


public class User  {
    private String username;
    private String password;
    private int id;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getId(){
		return id;
	}
	public void setId(int id){
		this.id = id;
	}
  
}

