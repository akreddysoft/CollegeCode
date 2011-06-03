class Box
{
	int height;
	int width;
	int length;
	protected int vol()
	{
		return height*width*length;
	}
};


class test
{
	public static void main(String args[])
	{
		Box df=new Box();
		df.height=5;
		df.width=10;
		df.length=15;
		
		System.out.println(df.vol());
	}
};


		
		