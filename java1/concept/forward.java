
class SimpleJava
{
private int ii = giveMeJJ();
private int jj = 10;


private int giveMeJJ()
{
return jj;
}

SimpleJava()
{
	ii=33;
	jj=44;
	
}


public static void main(String args[])
{
System.out.println("SimpleJava ....");

SimpleJava sj = new SimpleJava();


System.out.println("ii = " + sj.ii);
System.out.println("jj = " + sj.jj);
}
}

