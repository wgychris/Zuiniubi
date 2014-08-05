//
//  PassengerPostViewController.h
//  TEAM1
//
//  Created by Guanying Wang on 14-8-3.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PassengerPostViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *radiusTextField;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
@property(nonatomic) NSString *lat;
@property(nonatomic) NSString *lon;
- (IBAction)postButton:(id)sender;

@end
