
class CDummy
{
static int toto = 7;
int a=7;
CDummy getDummy()
 {
return null; // pay attention here !
}

public static void main(String args[])
{
System.out.println("CDummy.");

CDummy dmy = new CDummy();
System.out.println(dmy.getDummy().toto);
dmy.getDummy().a++;
}
}


class CDummy1
{
static {
jj = 5;
// System.out.println("jj=" + jj);
}

public static void main(String args[])
{
System.out.println("CDummy.");

System.out.println("jj = " + jj);
}

static int jj = 6;
}

