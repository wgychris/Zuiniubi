//
//  SecondViewController.h
//  TEAM1
//
//  Created by yuxin xie on 5/4/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DriverPostViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *toTextField;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *licenseTextField;

@property (strong, nonatomic) IBOutlet UITextField *radiusTextField;
@property (strong, nonatomic) IBOutlet UITextField *maxNumberTextField;
@property (strong, nonatomic) IBOutlet UITextField *maxTimeTextField;

- (IBAction)postButton:(id)sender;
- (IBAction)viewButton:(id)sender;

@end
