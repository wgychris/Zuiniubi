//
//  SecondViewController.m
//  TEAM1
//
//  Created by yuxin xie on 5/4/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "DriverPostViewController.h"
#import "SettingsViewController.h"
#import "HttpConnection.h"
#import "PostListViewController.h"

@interface DriverPostViewController ()

@end

@implementation DriverPostViewController
@synthesize toTextField,nameTextField,licenseTextField,radiusTextField,maxNumberTextField,maxTimeTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)TEXTFIELD {
    [TEXTFIELD resignFirstResponder];
    return YES;
}


//driver=david&licenceNumber=213&radius=1000&waitTime=123&description=123123&longitude=54253.00&latitude=500359.00&maxPassenger=5

//getAvailableDriver?distance=1000&latitude=583838&longitude=0030412
- (IBAction)postButton:(id)sender {
        NSLog(@"Post send data!");
        HttpConnection *connection = [[HttpConnection alloc] init];
    
    NSArray *keys = [NSArray arrayWithObjects:@"driver", @"licenceNumber",
                      @"radius", @"waitTime", @"description", @"longitude",
                      @"latitude", @"maxPassenger",nil];
    NSString *name = nameTextField.text;
    NSString *license = licenseTextField.text;
      NSString *radius = radiusTextField.text;
    
    NSString *maxTime = maxTimeTextField.text;
    NSString *maxNum = maxNumberTextField.text;
    
    NSArray *objects = [NSArray arrayWithObjects:name, license, radius
                        , maxTime, @"description", @"111",
                        @"222", maxNum,nil];
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:objects
                                                     forKeys:keys];
    
      NSLog(@"name:%@",name);
   //NSDictionary *dict = @{@"driver":@"david"};
        NSString * url =[connection getPostDriverURL:dict];
        NSLog(@"url:%@",url);
    NSLog(@"!!!!!");
        NSDictionary *passengers = [connection sendHTTPRequest:url];
        NSLog(@"Response%@",passengers);
        NSLog(@"%@",[passengers objectForKey:@"Passenger"]);
       /*
        NSArray *allPassenger = passengers[@"Passenger"];
        for ( NSDictionary *passenger in allPassenger )
        {
            NSLog(@"----");
            NSLog(@"description: %@", passenger[@"description"] );
            NSLog(@"latitude: %@", passenger[@"latitude"] );
            NSLog(@"longitude: %@", passenger[@"longitude"] );
            NSLog(@"name: %@", passenger[@"name"] );
            NSLog(@"phone: %@", passenger[@"phone"] );
            NSLog(@"----");
        }
        */
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Confirmation"
                                                     message:@"Send Post"
                                                    delegate:self
                                           cancelButtonTitle:@"Cancel"
                                           otherButtonTitles: nil];
    [alert addButtonWithTitle:@"Confirm"];
    [alert show];
    

}

- (IBAction)viewButton:(id)sender {
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showPasRequests"]){
        PostListViewController *controller = (PostListViewController *)segue.destinationViewController;
        controller.driverName = nameTextField.text;
        // NSLog(@"pass:%@",controller.driverName );
    }
}

//showPasRequests


@end
