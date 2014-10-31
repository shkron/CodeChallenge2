//
//  CityDetail.m
//  CodeChallenge2
//
//  Created by Alex on 10/30/14.
//  Copyright (c) 2014 Alexey Emelyanov. All rights reserved.
//

#import "CityDetail.h"

@implementation CityDetail


- (instancetype) initWithCityName:(NSString *)cityName withCityState:(NSString *)cityState withCityURL:(NSString *)cityURL
{
    self = [super init];
    self.cityName = cityName;
    self.cityState = cityState;
    self.cityURL = cityURL;
    return self;
}


@end
