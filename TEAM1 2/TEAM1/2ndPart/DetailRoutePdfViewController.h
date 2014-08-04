//
//  DetailRoutePdfViewController.h
//  task13
//
//  Created by Guanying Wang on 14-5-6.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface DetailRoutePdfViewController : UIViewController
//@property (strong, nonatomic) IBOutlet UIWebView *viewRoutePdfWeb;
@property (strong, nonatomic) IBOutlet UIWebView *viewRoutePdfWeb;


@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) NSString *sendLabel;

@end
