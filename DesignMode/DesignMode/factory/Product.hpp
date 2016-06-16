//
//  Product.hpp
//  DesignMode
//
//  Created by hbd on 16/6/16.
//  Copyright © 2016年 hbd. All rights reserved.
//

#ifndef Product_hpp
#define Product_hpp

#include <stdio.h>
#include <string>
#include <iostream>

using namespace std;

class Product {
    
public:
    Product();
    virtual ~Product();
    
    string ProductName()
    {
        return m_productName;
    }
    
protected:
    string m_productName;
};


class ProductCar : public Product {
    
public:
    ProductCar();
    virtual ~ProductCar();
};



class ProductAK47 : public Product {
    
public:
    ProductAK47();
    virtual ~ProductAK47();
};


#endif /* Product_hpp */
