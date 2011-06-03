

class CDummy {

static int x;

static { // the first static block
x = 7;
}

// some code: function definitions, attributes etc

static { // the second static block
x = 9;
}
}

/*
The second static block will always execute AFTER the first static
block ? Is this guaranteed, or it can be the other way around ?



What about this:

*/

public class CDummy implements IDummy
{
static { // the only static block
xx = 9;
}

public static void main(String args[])
{
System.out.println("CDummy.");

System.out.println("xx = " + xx);
}

static int xx = 7;
}

/*
The program will print 7 NOT 9. If in the static block the variable
xx is not defined the compiler should complain. OTOH if the variable
xx is defined inside the static block, then the variable xx should be
overwritten with the value 9 but this is not happening. The program
prints 7. Any logical explanation ?


Regards,
Razvan
*/