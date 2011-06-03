import java.io.*;

class matrix
{
	int mat[][]=new int[3][3];
	
	void getinput() throws IOException
	{
		String buf;
		int n;
		
		BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
		for(int i=0;i<3;++i)
		{
			for(int j=0;j<3;++j)
			{
				try
				{	
					buf=br.readLine();
					n=Integer.parseInt(buf);
					mat[i][j]=n;
					
				}
				catch(Exception NumberFormatException)
				{
					System.out.println("Not a number,Enter a number");
					--j;
				}
				
		
			}
		}
		
	}
	
	static matrix add(matrix m1,matrix m2)
	{
		matrix temp=new matrix();
		for(int i=0;i<3;++i)
		{
			for(int j=0;j<3;++j)
				temp.mat[i][j]=m1.mat[i][j]+m2.mat[i][j];
		}
		return temp;
	}
	
	static matrix sub(matrix m1,matrix m2)
	{
		matrix temp=new matrix();
		for(int i=0;i<3;++i)
		{
			for(int j=0;j<3;++j)
				temp.mat[i][j]=m1.mat[i][j]-m2.mat[i][j];
		}
		return temp;
	}
	
	static matrix mul(matrix m1,matrix m2)
	{
		matrix temp=new matrix();
		for(int i=0;i<3;++i)
		{
			for(int j=0;j<3;++j)
				temp.mat[i][j]=m1.mat[i][j]+m2.mat[i][j];
		}
		return temp;
	}
	
	matrix transpose()
	{
		matrix temp=new matrix();
		for(int i=0;i<3;++i)
		{
			for(int j=0;j<3;++j)
				temp.mat[i][j]=mat[i][j];
		}
		return temp;
	}
	
	void show()
	{
		for(int i=0;i<3;++i)
		{
			for(int j=0;j<3;++j)
				System.out.print(mat[i][j]+ "   ");
			System.out.println(" ");
		}
	}
	
}


class matest
{
	public static void main(String args[]) throws IOException
	{
		matrix m1=new matrix();
		matrix m2=new matrix();
		matrix res=new matrix();
		
		System.out.println("Enter the first matrix:");
		m1.getinput();
		System.out.println("Enter the second matrix:");
		m2.getinput();
		
		System.out.println("The addition of matrix is:");
		res=matrix.add(m1,m2);
		res.show();
		
		System.out.println("The subtraction of matrix is:");
		res=matrix.sub(m1,m2);
		res.show();
		
		System.out.println("The multiplicatin of matrix is:");
		res=matrix.mul(m1,m2);
		res.show();
		
		System.out.println("The transpose of first matrix is:");
		res=m1.transpose();
		res.show();	
	}
}