class dog
{
	
	static void main(String args[])
	{
	 bark b1=new bark();
	 int i=3;
	 float j=3;
	 double k=3;
	 b1.bark(i);
	 b1.bark(j);
	 b1.bark(k);
	}
}	

class bark
{
	void bark(int i)
	{System.out.println("Baarking");}
	void bark(float i)
	{System.out.println("Howling");}
	void bark(double i)
	{System.out.println("Sleeping");}
}