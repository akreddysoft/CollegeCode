//*********************8
//bit numbers at 0x417
//7-insert
//6-caps
//5-numlock
//4-scroll
//3-alt press
//2-ctrl
//1-lsfhift
//0-rshigft
//**********************

void main()
{
 char far  *kb;
 kb=0x417;
	*kb=01000000;
}