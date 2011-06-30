//ASSIGNMENT NO 2
//CONVERT FARHENEIT INTO CELSIUS
float tempe(float);
void main()
{
 float ctemp,ftemp;
 char choice;
 clrscr();
 do
 {
  printf("\n\nEnter the temp in farheneit:");
  scanf("%f",&ctemp);
  ftemp=tempe(ctemp);
  printf("Temp in celsius is:%.2f",ftemp);
  printf("\nDo you want to continue(y/n):");
  scanf("%c",&choice);
 }
 while(getch()=='y');
 }

float tempe(float ctemp)
{
 float temp1;
 temp1=(0.55*(ctemp-32));
 return temp1;
}
