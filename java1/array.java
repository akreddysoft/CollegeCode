class array
{
	public static void main(String args[])
	{
		int arr[];		//cannot specify number in between
		arr=new int[11];
		
/*		int arr1[];
		arr1=new char[12];	*/	//thisis not allowed
		
		for(int i=0;i<11;++i)
			arr[i]=i;
			
		for(int i=0;i<11;++i)
			System.out.println(arr[i]);
			
	}
	

}


