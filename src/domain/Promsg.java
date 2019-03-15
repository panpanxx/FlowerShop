package domain;


//商品类
public class Promsg{
	private String prodid;
    private String pname;
    private int price;
    private int stock;
    private int id;
    private String image="";
    private String sort;
    private String pnamezhu;
//保留不带参数的构造方法
    public Promsg(){
    	
    }
    public Promsg(String prodid,String pname,int price, int stock,int id,String image,String sort,String pnamezhu)
    {
    	this.prodid = prodid;
    	this.pname = pname;
    	this.price = price;
    	this.stock = stock;
    	this.id = id;
    	this.image = image;
    	this.sort = sort;
    	this.pnamezhu = pnamezhu;           
    }
	
	public String getProdid() {
		return prodid;
	}
	public void setProdid(String prodid) {
		this.prodid = prodid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getId(){
		return id;
	}
	public void setId(int id){
		this.id = id;
	}
	public String getImage(){
		return image;
	}
	public void setImage(String image){
		this.image = image;
	}
	public String getSort(){
		return sort;
	}
	public void setSort(String sort){
		this.sort = sort;
	}
	public String getPnamezhu(){
		return pnamezhu;
	}
	public void setPnamezhu(String pnamezhu){
		this.pnamezhu = pnamezhu;
	}
	
	 @Override
     public int hashCode() {
             // TODO Auto-generated method stub
             return this.getId()+this.getSort().hashCode();
     }

     @Override
     public boolean equals(Object obj) {
             // TODO Auto-generated method stub
             if(this==obj)
             {
                     return true;
             }
             if(obj instanceof Promsg)
             {
            	 Promsg i = (Promsg)obj;
                     if(this.getId()==i.getId()&&this.getSort().equals(i.getSort()))
                     {
                             return true;
                     }
                     else
                     {
                             return false;
                     }
             }
             else
             {
                     return false;
             }
     }

   /*  public String toString()
     {
             return "商品编号："+this.getId()+",商品名称："+this.getSort();
     }
*/
}


