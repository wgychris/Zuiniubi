//
//  MapPoint.h
//  task13
//
//  Created by Guanying Wang on 14-5-6.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapPoint : NSObject <MKAnnotation>
{
    
    NSString *_name;
    //NSString *_address;
    CLLocationCoordinate2D _coordinate;
    
}

@property (copy) NSString *name;
//@property (copy) NSString *address;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;


- (id)initWithName:(NSString*)name coordinate:(CLLocationCoordinate2D)coordinate;

@end