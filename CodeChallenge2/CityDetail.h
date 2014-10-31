//
//  CityDetail.h
//  CodeChallenge2
//
//  Created by Alex on 10/30/14.
//  Copyright (c) 2014 Alexey Emelyanov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CityDetail : NSObject

@property NSString *cityName;
@property NSString *cityState;
@property NSString *cityURL;
@property NSData *cityImage;
//@property NSURL *URL;

- (instancetype) initWithCityName:(NSString *)cityName withCityState:(NSString *)cityState withCityURL:(NSString *)cityURL;



@end
