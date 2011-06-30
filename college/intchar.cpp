#include<iostream.h>
void main()
{

int number = 123;
std::ostringstream oss;
oss << std::setw(3) << number;
std::string buffer = oss.str();
}
