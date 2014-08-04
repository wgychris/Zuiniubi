//
//  LocationMapViewController.m
//  task13
//
//  Created by Guanying Wang on 14-5-5.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//

#import "LocationMapViewController.h"

@interface LocationMapViewController ()

@end

@implementation LocationMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //Make this controller the delegate for the map view.
    self.mapView.delegate = self;
    
    // Ensure that you can view your own location in the map view.
    [self.mapView setShowsUserLocation:YES];
    
    //firstLaunch=YES;
    //Instantiate a location object.
    locationManager = [[CLLocationManager alloc] init];
    
    //Make this controller the delegate for the location manager.
    [locationManager setDelegate:self];
    
    //Set some parameters for the location object.
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager startUpdatingLocation]; // access location information about your user
    [self queryGooglePlaces];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views {
    MKCoordinateRegion region;
    region = MKCoordinateRegionMakeWithDistance(locationManager.location.coordinate,1000,1000);
    
    
    [mv setRegion:region animated:YES];
}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    //Get the east and west points on the map so you can calculate the distance (zoom level) of the current map view.
    MKMapRect mRect = self.mapView.visibleMapRect;
    MKMapPoint eastMapPoint = MKMapPointMake(MKMapRectGetMinX(mRect), MKMapRectGetMidY(mRect));
    MKMapPoint westMapPoint = MKMapPointMake(MKMapRectGetMaxX(mRect), MKMapRectGetMidY(mRect));
    
    //Set your current distance instance variable.
    currenDist = MKMetersBetweenMapPoints(eastMapPoint, westMapPoint);
    
    //Set your current center point on the map instance variable.
    currentCentre = self.mapView.centerCoordinate;
}


-(void) queryGooglePlaces{
    // Build the url string to send to Google. NOTE: The kGOOGLE_API_KEY is a constant that should contain your own API key that you obtain from Google. See this link for more info:
    // https://developers.google.com/maps/documentation/places/#Authentication
    
    NSString *url = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=%f,%f&radius=%@&types=%@&sensor=true&key=%@", currentCentre.latitude, currentCentre.longitude, [NSString stringWithFormat:@"%i", currenDist], @"bus_station", kGOOGLE_API_KEY];
    
    
    // NSString *url = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&radius=%@&types=%@&sensor=true&key=%@", currentCentre.latitude, currentCentre.longitude, [NSString stringWithFormat:@"%i", currenDist], @"bar", kGOOGLE_API_KEY];
    
    //Formulate the string as a URL object.
    NSURL *googleRequestURL=[NSURL URLWithString:url];
    
    // Retrieve the results of the URL.
    dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL: googleRequestURL];
        NSLog(@"Google Data: %@", data);
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
    });
}

-(void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          
                          options:kNilOptions
                          error:&error];
    NSLog(@"Google json: %@", json);
    //The results from Google will be an array obtained from the NSDictionary object with the key "results".
    NSArray* places = [json objectForKey:@"results"];
    
    //Write out the data to the console.
    NSLog(@"Google Data: %@", places);
    
    // Plot Blue Pinpoints according to google data
    [self plotPositions:places];
}

-(void)plotPositions:(NSArray *)data {
    // 1 - Remove any existing custom annotations but not the user location blue dot.
    for (id<MKAnnotation> annotation in _mapView.annotations) {
        if ([annotation isKindOfClass:[MapPoint class]]) {
            [_mapView removeAnnotation:annotation];
        }
    }
    // 2 - Loop through the array of places returned from the Google API.
    for (int i=0; i<[data count]; i++) {
        //Retrieve the NSDictionary object in each index of the array.
        NSDictionary* place = [data objectAtIndex:i];
        // 3 - There is a specific NSDictionary object that gives us the location info.
        NSDictionary *geo = [place objectForKey:@"geometry"];
        // Get the lat and long for the location.
        NSDictionary *loc = [geo objectForKey:@"location"];
        // 4 - Get your name and address info for adding to a pin.
        NSString *name=[place objectForKey:@"name"];
        NSString *vicinity=[place objectForKey:@"vicinity"];
        // Create a special variable to hold this coordinate info.
        CLLocationCoordinate2D placeCoord;
        // Set the lat and long.
        placeCoord.latitude=[[loc objectForKey:@"lat"] doubleValue];
        placeCoord.longitude=[[loc objectForKey:@"lng"] doubleValue];
        // 5 - Create a new annotation.
        MapPoint *placeObject = [[MapPoint alloc] initWithName:name coordinate:placeCoord];
        [_mapView addAnnotation:placeObject];
    }

    NSString *name=@"Hamberg 28x 58 61A 61B 61C";
    CLLocationCoordinate2D placeCoord;
    placeCoord.latitude = 40.444679;// * 0.00001;
    placeCoord.longitude = -79.945954;//* 0.00002;
    MapPoint *placeObject = [[MapPoint alloc] initWithName:name coordinate:placeCoord];
    [_mapView addAnnotation:placeObject];
    
    name=@"Dithridge 28x 54 58 61A 61B";
    placeCoord.latitude = 40.444646;// * 0.00001;
    placeCoord.longitude = -79.950116;//* 0.00002;
    placeObject = [[MapPoint alloc] initWithName:name coordinate:placeCoord];
    [_mapView addAnnotation:placeObject];

    name=@"5th Ave 58 71B 71C";
    placeCoord.latitude = 40.447928;// * 0.00001;
    placeCoord.longitude = -79.942413;//* 0.00002;
    placeObject = [[MapPoint alloc] initWithName:name coordinate:placeCoord];
    [_mapView addAnnotation:placeObject];
    
    name=@"Beller 61A 61B 61C";
    placeCoord.latitude = 40.444336;// * 0.00001;
    placeCoord.longitude = -79.938572;//* 0.00002;
    placeObject = [[MapPoint alloc] initWithName:name coordinate:placeCoord];
    [_mapView addAnnotation:placeObject];
    
    name=@"Morewood 61A 61C 67 69";
    placeCoord.latitude = 40.445087;// * 0.00001;
    placeCoord.longitude = -79.942671;//* 0.00002;
    placeObject = [[MapPoint alloc] initWithName:name coordinate:placeCoord];
    [_mapView addAnnotation:placeObject];
    
}

//another MapKit delegate method that will take your annotations as you add them using [mapView addAnnotation:placeObject], and draw them on the map.
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    // Define your reuse identifier.
    static NSString *identifier = @"MapPoint";
    
    if ([annotation isKindOfClass:[MapPoint class]]) {
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.animatesDrop = YES;
        return annotationView;
    }
    return nil;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end