import java.util.*;
class Product
{
	private int id,qty,price;
	private String name;
	public void setId(int id)
	{
		this.id=id;
	}
	public int getId()
	{
		return id;
	}
	public void setname(String name)
	{
		this.name=name;
	}
	public String getname()
	{
		return name;
	}
	public void setprice(int price)
	{	
		this.price=price;
	}
	public int getprice()
	{
		return price;
	}
	public void setqty(int qty)
	{	
		this.qty=qty;
	}
	public int getqty()
	{
		return qty;
	}
}
class Bill
{
	void calbill(Product ...p)
	{
		int total,i;
		int gtotal=0;
		System.out.printf("Id\tName\tPrice\tQuantity\tTotal\n");
		for(i=0;i<p.length;i++)
		{
			 total=p[i].getqty()*p[i].getprice();
			gtotal=gtotal+total;
			System.out.printf(p[i].getId()+"\t"+p[i].getname()+"\t"+p[i].getprice()+"\t"+p[i].getqty()+"\t\t"+total);
			System.out.println("");
		}
		System.out.println("Grand total is "+gtotal);
	}
}
public class Productbill	
{
	public static void main(String x[])
	{
		Scanner sc=new Scanner(System.in);
		int id,price,qty,i,n;
		String name;
		System.out.println("Enter the number of product");
		n=sc.nextInt();
		Product p[]=new Product[n];
		Bill b=new Bill();
                            for(i=0;i<n;i++)
		{
			p[i]=new Product();
			System.out.println("Enter the id, name, price and quantity of product");

			id=sc.nextInt();
			sc.nextLine();
			name=sc.nextLine();
			price=sc.nextInt();
			qty=sc.nextInt();
			//p[i].setvalue(id=sc.nextInt(),name=sc.nextLine(),price=sc.nextInt(),qty=sc.nextInt());
		
			p[i].setId(id);
			p[i].setname(name);
			p[i].setprice(price);
			p[i].setqty(qty);
		}
		b.calbill(p);
		
		
	}
}


