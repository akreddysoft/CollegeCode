class StringTest
{
	
	static String name="madhur";
	static String cast="ahuja";
	static String marks="30";
	public static void main(String args[])
	{
		String df[]=getString();
		
		setString(new String[]{"30","ahuja","madhur"});
		System.out.println(getString()[0]);
		
		
	}
	
	
	static void setString(String df[])
	{
		name=df[0];
		cast=df[1];
		marks=df[2];
	}
	static String[] getString()
	{
		//String names[]={name,cast,marks};
		//return names;
		return new String[]{name,cast,marks};
	}
	
	
	
}