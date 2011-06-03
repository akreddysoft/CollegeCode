
public class CDummy
{
public static void main(String args[])
{
System.out.println("CDummy.");

for(int ii=10; ii>=0; ii--)
{
String tmp = Integer.toString(ii);
System.out.println(tmp);
}

System.out.println("END");
}
}

/*
When the program reached the line that prints "END", how many 'tmp'
string objects are elligible for
garbage collection ?

Valid answers:
1
10
11
20
none


I have answered "C". Since a reference to the Float object is kept in
the array the object cannot be garbage-collected. If the function that
calls m() chooses to scrap the received reference (in the form of
oa[0]) then the object can be garbage collected, but not before. Where
is the truth ?

Since this line:

> 15. return oa [0];

returns a reference to the created object to the caller, so

> C. Never in this method.

is the right answer.

*/