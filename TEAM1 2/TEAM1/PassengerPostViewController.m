//
//  PassengerPostViewController.m
//  TEAM1
//
//  Created by Guanying Wang on 14-8-3.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//

#import "PassengerPostViewController.h"
#import "HttpConnection.h"
#import "PasListViewController.h"
@interface PassengerPostViewController ()

@end

@implementation PassengerPostViewController
{
    NSArray *nameArr;
    NSArray *licenseArr;
    NSArray *waitArr;
}

@synthesize nameTextField,phoneTextField,radiusTextField,lat,lon;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) requestData {
    HttpConnection *connection = [[HttpConnection alloc] init];

    NSArray *keys = [NSArray arrayWithObjects:@"distance", @"longitude",
                     @"latitude",nil];
    NSString *radius = radiusTextField.text;
    
    NSArray *objects = [NSArray arrayWithObjects:radius
                        ,@"111",
                        @"222",nil];
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:objects
                                                     forKeys:keys];
    
    NSLog(@"radius is!!:%@",radius);
    //NSDictionary *dict = @{@"driver":@"david"};
    NSString * url =[connection getAvailableDriverURL:dict];
    NSLog(@"url:%@",url);
    NSLog(@"!!!!!");
    NSDictionary *drivers = [connection sendHTTPRequest:url];
    NSLog(@"Response%@",drivers);
    NSLog(@"%@",[drivers objectForKey:@"Driver"]);
    
    
    NSArray *allDrivers = drivers[@"Driver"];
    
    NSUInteger count = [allDrivers count];;
    NSLog(@"Number ########3 %d", [allDrivers count]);
    if(count >= 2) {
        allDrivers = [allDrivers subarrayWithRange:NSMakeRange(0, count - 1)];
    }
    
    NSLog(@"allpassenger?????? %@", allDrivers);
    nameArr = [allDrivers valueForKeyPath:@"driver"];
    licenseArr = [allDrivers valueForKeyPath:@"licenceNumber"];
    waitArr= [allDrivers valueForKeyPath:@"waitTime"];
    
    
    
  /*  NSLog(@"!!!Name Arr in Post List!!!!%@",nameArr);
    
    NSLog(@"!!!Phone Arr in Post List!!!!%@",licenseArr);
    
    NSLog(@"!!!Des Arr in Post List!!!!%@",waitArr);
   */

    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  
    if([segue.identifier isEqualToString:@"pasShowList"]){
        [self requestData];
        PasListViewController *controller = (PasListViewController *)segue.destinationViewController;
        controller.nameArr = nameArr;
        controller.waitArr = waitArr;
        controller.licenseArr = licenseArr;
        controller.lat = lat;
        controller.lon = lon;
        controller.radius = radiusTextField.text;
        NSLog(@"Segur!!!");
    }
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

- (IBAction)postButton:(id)sender {
    
}
@end
