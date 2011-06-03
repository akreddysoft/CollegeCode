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
		width=3;
		breadth=4;
//		height=5;
		weight=10;
		System.out.println("inside acons");
		
	}
	
	void show()
	{
		System.out.println("acons show");
	}
};


class test
{
	public static void main(String args[])
	{
		cons a=new cons();		//prints inside cons constr....
		acons b=new acons();	//prints inside cons constr... 
								//prints inside acons....
		
	}
};


class test1
{
	public static void main(String args[])
	{
		acons b;
		acons a=new acons();
		
		cons c=new cons();
		cons d;
		
		d=a;

	//	b=c;		//this is not allowed
//		b.show();
	
		d.show();
		a.show();
		
	}
};
		
		
	
		
		
	