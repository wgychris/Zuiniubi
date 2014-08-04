//
//  SettingsViewController.h
//  TEAM1
//
//  Created by yuxin xie on 5/5/14.
//  Copyright (c) 2014 yuxin xie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    UIPickerView *myPickerView;
    NSArray *pickerArray;
    UITextField *myTextField;
}
- (IBAction)DoneButton:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *today;
@property (strong, nonatomic) IBOutlet UITextField *now;
@property (strong, nonatomic) IBOutlet UITextField *routeType;


@end
