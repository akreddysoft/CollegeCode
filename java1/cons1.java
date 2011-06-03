//concept of constructors//

class cons
{
 	private int height;
 	protected int width;
 	int breadth;
 	
 	
 	cons()
 	{
 		height=2;
 		width=3;
 		breadth=4;
 		System.out.println("inside cons constructor");
 	}
 	void show()
 	{
 		System.out.println("cons show");
 	}
 	
};


class acons extends cons
{
	
	int weight;
	acons()
	{
		super();	
		weight=10;
		System.out.println("inside acons");
		
	}
	
	void show()
	{

		System.out.println(width + breadth+weight);
	}
};


class test
{
	public static void main(String args[])
	{
		acons b=new acons();	//prints inside cons constr... 
		b.show();						//prints inside acons....
		
	}
};


		
	
		
		
	