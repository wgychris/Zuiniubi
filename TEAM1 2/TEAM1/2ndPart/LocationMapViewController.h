//
//  LocationMapViewController.h
//  task13
//
//  Created by Guanying Wang on 14-5-5.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapPoint.h"

#define kGOOGLE_API_KEY @"AIzaSyD4hrmB9RDxz_cWDTCx7TfiDxjsegaKCQk"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
CLLocationCoordinate2D currentCentre;
int currenDist;

@interface LocationMapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@end