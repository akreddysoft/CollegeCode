
#include <iostream>
#include <conio>
//using namespace std;

                class A {
public:
A() {
                                this->Foo();
                        }
virtual void Foo() {
                                cout << "A::Foo()" << endl;
                        }
};



class B : public A {
public:
B() {
                                this->Foo();
                        }
virtual void Foo() {
                                cout << "B::Foo()" << endl;
                        }
};






int main(int, char**)
{
B objectB;
getch();
return 0;
}


