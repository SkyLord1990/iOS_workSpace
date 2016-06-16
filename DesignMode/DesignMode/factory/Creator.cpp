//
//  Creator.cpp
//  DesignMode
//
//  Created by hbd on 16/6/16.
//  Copyright © 2016年 hbd. All rights reserved.
//

#include "Creator.hpp"
#include "Product.hpp"

Creator::Creator(){}

Creator::~Creator(){}

Product * Creator::FactoryMethod(const string &type)
{
    if (!type.compare("car")) {
        return new ProductCar();
    }else if (!type.compare("ak47")){
        return new ProductAK47();
    }
    return nullptr;
}


Product * Creator::car_FactoryMethod()
{
    return new ProductCar();
}
Product * Creator::AK_FactoryMethod()
{
    return new ProductAK47();
}



