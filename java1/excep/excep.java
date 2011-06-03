package excep;
import java.util.Random;
class excep
{
	int n;
	Random r=new Random();
	excep(int i)
	{
		n=i;
		r=new Random();
	}
	excep(){}
	
	
	void test()
	{
		for(int i=100;i>0;--i)
		{
			n=r.nextInt(100);
			System.out.println(i+" "+n);
			//try						//this is the exceptin code
			{
				int d=i/n;
			}
			
			/*catch(ArithmeticException e)
			{
				System.out.println("exception found :, continuing" + e);
			}*/
		}
	}
}


class extest
{
	public static void main(String args[])
	{
		excep ex=new excep();
		ex.test();
	}
}