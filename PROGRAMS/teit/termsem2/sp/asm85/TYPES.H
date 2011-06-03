#include<stdio.h>
#include<conio.h>
#include<dos.h>
#include<string.h>
#include<malloc.h>
#include<stdlib.h>
#include<ctype.h>

struct mot
{
	char mnem[5];
	char opcode[3];
	char op1[5];
	char op2[5];
	short int length;
	short int type;
};

struct POT
{
	char psop[6];
	long address;
};

struct ST
{
	char name[8];
	int value;
	char val[8];
	int address;
	int length;
};


//FUNCTION DECLARATIONS

int getmottable();
int symtable();
int getlinetext();
int getmotindex();
int resolvesym();
int testnumber();
int fillzero();

///////////////////////



