//
//  Provider.cpp
//  DesignMode
//
//  Created by hbd on 16/6/16.
//  Copyright © 2016年 hbd. All rights reserved.
//

#include "Provider.hpp"

Provider::Provider(){}

Provider::~Provider(){}



ProviderAK47::ProviderAK47(){}

ProviderAK47::~ProviderAK47(){}

Product * ProviderAK47::create()
{
    return new ProductAK47;
}



ProviderCar::ProviderCar(){}

ProviderCar::~ProviderCar(){}

Product * ProviderCar::create()
{
    return new ProductCar;
}
