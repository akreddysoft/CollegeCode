/*Problem definition : Write a program to perform quick sort using Multithreading 
 *
 *Name of Programmer : Madhur Ahuja
 *
 *version 			 : JDK 1.4.1_01
 *
 *Special Package    : Java.io.*
 *
 */


//importing the package
import java.io.*;

class qsort extends Thread
{
	int n;
	int list[]=new int[100];
	Thread mainthread;
	qsort(Thread m)
	{
		mainthread=m;
		
	}
	
	public void run()
	{
		Thread t=Thread.currentThread();
		System.out.println(t.toString());
	
		qsort(list,0,n-1);
		synchronized(mainthread)
		{
		
			mainthread.notify();
		}
	
	}

	int partition(int list[],int low,int high)
	{
		int a,down,temp,up,pivotloc;
		a=list[low];
		down=low;
		up=high;
	
		while(down<up)
		{
			
			while(list[down]<=a&&down<up)		
				down++;		
				
			while(list[up]>a)
				up--;
			if(down<up)
			{
				temp=list[down];
				list[down]=list[up];
				list[up]=temp;
			}
		
		}
	
		temp=list[low];
		list[low]=list[up];
	
		list[up]=temp;
		
		pivotloc=up;
		return pivotloc;
	}
	
	 void qsort(int list[],int low,int high)
	 {
    	int pivot=list[low];
		if(low<high)
		{
			pivot=partition(list,low,high);
			qsort(list,low,pivot-1);
			qsort(list,pivot+1,high);
		}
	
	}
	
	
	void input()
	{
		
		System.out.println("Enter the size of the list");
		n=numinput.getinput();
		
		for(int i=0;i<n;++i)
			list[i]=numinput.getinput();
	}
	
	void display()
	{
		for(int i=0;i<n;++i)		
			System.out.print(list[i] + " ");
	}
	
}


class qapp
{
	
	
	public synchronized static void main(String args[]) throws InterruptedException
	{
		Thread t=Thread.currentThread();
		qsort qr=new qsort(t);
		
		System.out.println(t.toString());
		qr.input();
		qr.start();
		synchronized(t) {
            
            t.wait();
        }
     
		System.out.println("\nThe sorted numbers are:");
		qr.display();

	}

}
	
	
final class numinput
{
	
	static int n;
	static String buf;
	
	static BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
	
	static int getinput()
	{
		try
		{
			buf=br.readLine();
			n=Integer.parseInt(buf);
		}
		catch(Exception NumberFormatException)
		{
			System.out.println("Enter a number");
			System.exit(0);
		}
		
		return n;
	}
	
}
	
	
	
	
