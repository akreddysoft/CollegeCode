#include "types.h"

extern char filename[255];
extern int symindex;
extern char oper1[100][100],oper2[100][100],lbl[100][100];
extern char opc[100][100];
extern int motcount;
extern char machine[100][10];
extern char *regs[];

extern struct mot mottable[500];
extern struct ST sym[100];

int pass2()
{
	int j=0;
	int mindex=0;
	
	resolvesym(filename);
	
	for(j=0;j<lines;++j)		//repair here
	{
		int motindex=getmotindex(opc[j],oper1[j],oper2[j]);
		int res,res1,type,res2;
		char opcode[5];

		strcpy(opcode,opc[j]);
		res=strcmp(opcode,"");
		if(res==0)
			continue;

		type=mottable[motindex].type;

		switch(type)
		{
			case 1://all 3 to be matched -1 byte
			res2=strcmp(opcode,mottable[motindex].mnem);
			res=strcmp(oper1[j],mottable[motindex].op1);
			res1=strcmp(oper2[j],mottable[motindex].op2);

			if(res==0&&res1==0&&res2==0)
			{
				strcpy(machine[mindex],mottable[motindex].opcode);
				mindex++;
				//lc=lc+mottable[j].length;
			}
			break;

			case 2: //first 2 to be matched - 1 byte
			res1=strcmp(opcode,mottable[motindex].mnem);

			res=strcmp(oper1[j],mottable[motindex].op1);
			if(res==0&&res1==0)
			{

				strcpy(machine[mindex],mottable[motindex].opcode);
				mindex++;
				//lc=lc+mottable[motindex].length;

			}
			break;

			case 3://first to be matched - 1 byte
			res2=strcmp(opcode,mottable[motindex].mnem);
			if(res2==0)
			{

				strcpy(machine[mindex],mottable[motindex].opcode);
				mindex++;
				//lc=lc+mottable[motindex].length;

			}
			break;

			case 4: //first 2 to be matched, 2nd operand-byte
			res1=strcmp(opcode,mottable[motindex].mnem);
			res=strcmp(oper1[j],mottable[motindex].op1);
			if(res==0&&res1==0)
			{

				strcpy(machine[mindex],mottable[motindex].opcode);
				mindex++;
				strcpy(machine[mindex],oper2[j]);
				mindex++;
			}

			break;

			case 5://first to be matched,1 byte operand -2 bytes
			res2=strcmp(opcode,mottable[motindex].mnem);
			if(res2==0)
			{

				strcpy(machine[mindex],mottable[motindex].opcode);
				mindex++;
				strcpy(machine[mindex],oper1[j]);
				mindex++;
				//lc=lc+mottable[j].length;
			}
			break;

			case 6: //first to be matched,2byte operand -3
			res2=strcmp(opcode,mottable[motindex].mnem);
			if(res2==0)
			{
				strcpy(machine[mindex],mottable[motindex].opcode);
				mindex++;
			   //	strcpy(machine[mindex],oper1[j]);
				machine[mindex][0]=oper1[j][0];
				machine[mindex][1]=oper1[j][1];
				machine[mindex][2]=0;
				mindex++;
				machine[mindex][0]=oper1[j][2];
				machine[mindex][1]=oper1[j][3];
				machine[mindex][2]=0;
				mindex++;
				//lc=lc+mottable[j].length;


			}
			break;

			case 7: //first 2 matched-2ndoperand-2 bytes

			res1=strcmp(opcode,mottable[motindex].mnem);
			res=strcmp(oper1[j],mottable[motindex].op1);
			if(res==0&&res1==0)
			{
				strcpy(machine[mindex],mottable[motindex].opcode);
				mindex++;
				strcpy(machine[mindex],oper2[j]);
				mindex++;
				//lc=lc+mottable[j].length;
			}

			break;
		}

	}
	return 0;
}



int resolvesym(char *filename)
{
	int i=0,j=0;
	int flag=0;
	int lines=getlines(filename);
	char sval[5]={"0000"};

	for(i=0;i<lines;++i)
	{
		int test=testnumber(oper1[i]);
		if(test)
			continue;

		for(j=0;j<11;++j)
		{
			int res=strcmp(oper1[i],"");
			if(res==0)
				continue;	//ignore the no operand case
			res=strcmp(oper1[i],regs[j]);
			if(res!=0)
			{
				flag=1;   //operand possibly contains a symbol
			}
			else
			{
				flag=0; //the operand is a regular  register
				break;
			}
		}

		if(flag)	//resolve the symbol
		{
			int index=i;
			int i;
			for(i=0;i<=symindex;++i)
			{
				int res=strcmp(oper1[index],sym[i].name);
				if(res==0)
				{

					sprintf(sval,"%x",sym[i].value);
					fillzero(sval);
					oper1[index][0]=sval[2];
					oper1[index][1]=sval[3];
					oper1[index][2]=sval[0];
					oper1[index][3]=sval[1];
					//strcpy(oper1[index],sval);
				}
			}
		}

	}

	return 0;
}

int testnumber(char oper1[100])	//checks whether operand is number or a symbol
{
	//a label cannot start with number
	int i=0;
	if(oper1[i]>='0'&& oper1[i]<='9')
		return 1;
	else
		return 0;
}


int fillzero(char sval[5])
{
	int i=0;
	while(sval[i])
		++i;
		sval[i]='0';
	return 0;
}



int getmotindex(char *opcode,char *oper1,char *oper2)
{
	int i;
	int res1,res2;

	for(i=0;i<motcount;++i)
	{
		int res=strcmp(opcode,mottable[i].mnem);
		if(res==0)
		{
			int type=mottable[i].type;
			switch(type)
			{
				case 1://all 3 to be matched -1 byte
				res2=strcmp(opcode,mottable[i].mnem);
				res=strcmp(oper1,mottable[i].op1);
				res1=strcmp(oper2,mottable[i].op2);

				if(res==0&&res1==0&&res2==0)
					return i;
				break;

				case 2: //first 2 to be matched - 1 byte
				res1=strcmp(opcode,mottable[i].mnem);

				res=strcmp(oper1,mottable[i].op1);
				if(res==0&&res1==0)
					return i;
				break;

				case 3://first to be matched - 1 byte
				res2=strcmp(opcode,mottable[i].mnem);
				if(res2==0)
					return i;
				break;

				case 4: //first 2 to be matched, 2nd operand-byte
				res1=strcmp(opcode,mottable[i].mnem);
				res=strcmp(oper1,mottable[i].op1);
				if(res==0&&res1==0)
					return i;
				break;

				case 5://first to be matchked,1 byte operand -2 bytes

				res2=strcmp(opcode,mottable[i].mnem);
				if(res2==0)
					return i;
				break;

				case 6: //first to be matched,2byte operand -3
				res2=strcmp(opcode,mottable[i].mnem);
				if(res2==0)
					return i;
				break;

				case 7: //first 2 matched-2ndoperand-2 bytes

				res1=strcmp(opcode,mottable[i].mnem);
				res=strcmp(oper1,mottable[i].op1);
				if(res==0&&res1==0)
					return i;

				break;
			}
		}
	}

	return 0;
}

