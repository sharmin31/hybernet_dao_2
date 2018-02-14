package entity;
// Generated Feb 8, 2018 10:09:05 AM by Hibernate Tools 4.3.1



/**
 * Product generated by hbm2java
 */
public class Product  implements java.io.Serializable {


     private Integer pid;
     private String pname;
     private int price;
     private int qty;

    public Product() {
    }

   

    public Product(String pname, int price, int qty) {
       this.pname = pname;
       this.price = price;
       this.qty = qty;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

   
   
    public String getPname() {
        return this.pname;
    }
    
    public void setPname(String pname) {
        this.pname = pname;
    }
    public int getPrice() {
        return this.price;
    }
    
    public void setPrice(int price) {
        this.price = price;
    }
    public int getQty() {
        return this.qty;
    }
    
    public void setQty(int qty) {
        this.qty = qty;
    }

    @Override
    public String toString() {
        return "Product{" + "pid=" + pid + ", pname=" + pname + ", price=" + price + ", qty=" + qty + '}';
    }

    



}


