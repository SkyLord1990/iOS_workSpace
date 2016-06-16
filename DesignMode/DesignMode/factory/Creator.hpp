//
//  Creator.hpp
//  DesignMode
//
//  Created by hbd on 16/6/16.
//  Copyright © 2016年 hbd. All rights reserved.
//

#ifndef Creator_hpp
#define Creator_hpp

#include <stdio.h>
#include <iostream>
#include <string>

class Product;

using namespace std;

class Creator {
    
public:
    Creator();
    virtual ~Creator();
    
    Product *FactoryMethod(const string &type);
    
    
};



#endif /* Creator_hpp */
