//
//  PasListViewController.h
//  TEAM1
//
//  Created by Guanying Wang on 14-8-4.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PasListViewController :  UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic)  NSArray *nameArr;
@property(nonatomic)  NSArray *licenseArr;
@property(nonatomic)  NSArray *waitArr;
@property(nonatomic) NSString *radius;
@property(nonatomic) NSString *lat;
@property(nonatomic) NSString *lon;


@end
