//RLE ENCODER AND DECODER
//MADHUR AHUJA

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int encode();
int decode();
float getsize();
int main(int argc,char **argv)
{
	char filename[255];	
	int retval;

	if(argc==1)
	{
		printf("\nRLE Encoder and decoder");
		printf("\nrle -e <input file> <output file> : Encode");
		printf("\nrle -d <input file> <output file> : Decode");
		return EXIT_SUCCESS;
	}
	else if(argc>=3)
		strcpy(filename,argv[2]);
	else
	{
		fprintf(stderr,"\nNot enough arguments");
		return EXIT_SUCCESS;
	}

	retval=strcmp(argv[1],"-e");
	if(retval==0)
	{
		if(argc==2)
			encode(filename,"encoded.txt");
		else
			encode(filename,argv[3]);

		return EXIT_SUCCESS;
	}
	retval=strcmp(argv[1],"-d");
	if(retval==0)
	{
		if(argc==2)
			decode(filename,"decoded.txt");
		else
			decode(filename,argv[3]);

		return EXIT_SUCCESS;

	}
	else
	{
		fprintf(stderr,"\nUnknown option");
		return EXIT_SUCCESS;
	}

}

int encode(const char* filename,const char* outfile)
{
	FILE *fl=fopen(filename,"rb");
	//if binary not given, 10 will be translated to 10,13
	FILE * fo=fopen(outfile,"wb");
	char byte,temp[255],ch=1;

	int retval,i,flag=0;
	float size1,size2;

	if(fl==NULL)
	{
		fprintf(stderr,"\nUnable to open file");
		exit(EXIT_FAILURE);
	}

	retval=fread(&byte,1,1,fl);

	while(1)
	{
		if(retval==0) break;
		i=0;
		while(1)
		{
			retval=fread(temp+i,1,1,fl);
			flag=1;
			if((temp[i]!=byte&&flag!=0)||retval==0||i==255)	//cant allow greater than ff since count=1byte
			{
				int temp1=i+1;;
				fwrite(&byte,1,1,fo);
				if(i==255)
					fwrite(&i,1,1,fo);
				else if(i==0)
					fwrite(&ch,1,1,fo);
				else
					fwrite(&temp1,1,1,fo);
				byte=temp[i];
				break;
			}
			++i;
		}

	}

	fclose(fl);
	fclose(fo);

	size1=getsize(filename);
	size2=getsize(outfile);
	printf("\nOriginal file size: %.0f",size1);
	printf("\nEncoded file size: %.0f",size2);
	printf("\n\nFile Encoded with %.2f%% compression",100-size2/size1*100);

	return 1;
}


int decode(const char* filename,const char* outfile)
{
	FILE *fl=fopen(filename,"rb");
	FILE *fo=fopen(outfile,"wb");
	char ch;
	unsigned char count;

	int retval,cnt;

	if(fl==NULL)
	{
		fprintf(stderr,"\nUnable to open file");
		exit(EXIT_FAILURE);
	}

	while(1)
	{
		fread(&ch,1,1,fl);
		retval=fread(&count,1,1,fl);
		cnt=(int)count;

		if(retval==0) break;
		if(cnt==255) cnt=cnt+1;

		for(int i=0;i<cnt;++i)   //c99
			retval=fwrite(&ch,1,1,fo);

	}

	fclose(fl);
	fclose(fo);
	printf("\nFile succesfully decoded");
	return 1;
}


float getsize(const char *filename)
{
	FILE *fl=fopen(filename,"rb");
	fseek(fl,0,2);
	return ftell(fl);
}



/*   

C:\>rle -e s2.bmp s3.bin

Original file size: 777834
Encoded file size: 32596

File Encoded with 95.81% compression

C:\>rle -d s3.bin s4.bmp

File succesfully decoded

C:\>


*/