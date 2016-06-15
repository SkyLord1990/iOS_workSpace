//
//  main.cpp
//  C++Test
//
//  Created by hbd on 16/5/17.
//  Copyright © 2016年 hbd. All rights reserved.
//

#include <iostream>
using namespace std;

struct A{
    int age;
    char* name;
    
    //1,C++ struct能包含成员函数
    A(){
        cout<<"构造函数A()"<<endl;
    }
    
    //3,C++ struct能实现多态
    A(int age){
        cout<<"age = "<<age<< endl;
    }
    
    A(int age,char* name){
        cout<<"age = "<<age<<"  name = "<<name << endl;
    }
};

//2,C++ struct能继承
struct B : A {
    int height;
    B(int age,char* name,int height){
        cout<<"age = "<<age<<"  name = "<<name << "  height = "<< height << endl;
    }
};

class ClassA {
    int age; //默认为私有的
};

int main(int argc, const char * argv[]) {
    
    //C struct 与 C++ struct的区别
    A a1(10); //输出:age = 10
    char aName[] = {"father"};
    A a2(10,aName); //输出:age = 10  name = father
    
    
    char bName[] = {"son"};
    B b1(20,bName,178); //输出:构造函数A() \n age = 20  name = son  height = 178
    
#pragma mark C++ struct 与 class 的区别
    //1,关键字class的区别在于struct中成员变量和函数的默认访问权限为_public_，而class的为_private_。
    
    printf("%d",a1.age); // //访问public成员，合法
    
    ClassA claA;
//    printf("%d",claA.age); //访问private成员，不合法
    
}
