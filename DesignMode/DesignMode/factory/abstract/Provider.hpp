//
//  Provider.hpp
//  DesignMode
//
//  Created by hbd on 16/6/16.
//  Copyright © 2016年 hbd. All rights reserved.
//

#ifndef Provider_hpp
#define Provider_hpp

#include <stdio.h>
#include <iostream>
#include <string>
#include "Product.hpp"

using namespace std;

class Provider {
    
public:
    Provider();
    virtual ~Provider();
    virtual Product *create() = 0;
};

class ProviderAK47 : public Provider{
    
public:
    ProviderAK47();
    virtual ~ProviderAK47();
    
    Product *create();
};

class ProviderCar : public Provider {
    
public:
    ProviderCar();
    virtual ~ProviderCar();
    
    Product *create();
};

#endif /* Provider_hpp */
