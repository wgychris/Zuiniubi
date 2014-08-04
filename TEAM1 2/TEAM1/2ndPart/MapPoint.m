//
//  MapPoint.m
//  task13
//
//  Created by Guanying Wang on 14-5-6.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint
@synthesize name = _name;
//@synthesize address = _address;
@synthesize coordinate = _coordinate;

-(id)initWithName:(NSString*)name  coordinate:(CLLocationCoordinate2D)coordinate  {
    if ((self = [super init])) {
        _name = [name copy];
        // _address = [address copy];
        _coordinate = coordinate;
        
    }
    return self;
}

-(NSString *)title {
    if ([_name isKindOfClass:[NSNull class]])
        return @"Unknown charge";
    else
        return _name;
}


@end