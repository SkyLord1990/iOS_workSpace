//
//  main.cpp
//  DesignMode
//
//  Created by hbd on 16/6/16.
//  Copyright © 2016年 hbd. All rights reserved.
//

#include <iostream>
#include <stdlib.h>
#include <string>

#include "Creator.hpp"
#include "Product.hpp"

#include "Provider.hpp"

using namespace std;


int main(int argc, const char * argv[]) {
    /**
     * 普通工厂模式，就是建立一个工厂类，对实现了同一接口或继承自同一类的一些类进行实例的创建
     */
    {
        Creator *creator = new Creator();
        Product *pd = creator->FactoryMethod("ak47");
        printf("%s",pd->ProductName().c_str());
        
        delete pd;
        
        
        printf("\n");
        
        pd = creator->FactoryMethod("car");
        printf("%s",pd->ProductName().c_str());
        
        delete pd;
        delete creator;
    }
    
    /**
     * 工厂方法模式有一个问题就是，类的创建依赖工厂类，也就是说，如果想要拓展程序，必须对工厂类进行修改，这违背了闭包原则，
     * 所以，从设计角度考虑，有一定的问题，如何解决？就用到抽象工厂模式，创建多个工厂类，这样一旦需要增加新的功能，
     * 直接增加新的工厂类就可以了，不需要修改之前的代码。
     * 有个专门生产Car的工厂，还有个专门生产AK47的工厂
     * 这两个工厂都知道自己的产品是什么，不用在他们生产产品时告诉他们产品的名称
     */
    {
        Provider *pv = new ProviderAK47();
        Product *pd = pv->create();
        printf("%s",pd->ProductName().c_str());
        delete pv;
        delete pd;
        
        printf("\n");
        
        pv = new ProviderCar();
        pd = pv->create();
        printf("%s",pd->ProductName().c_str());
        delete pv;
        delete pd;
    }
    
    
    
    
    return 0;
}
