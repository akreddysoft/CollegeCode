interface callback
{
	void callback(int p);
}


class client implements callback
{
	public void callback(int p)		//must be public
	{
		System.out.println("hello "+p);
	}
};

class test
{
	public static void main(String args[])
	{
		client t=new client();
		t.callback(2);
	}
};
