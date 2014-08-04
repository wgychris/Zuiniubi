//
//  DismissSeque.m
//  TEAM1
//
//  Created by yuxin xie on 5/5/14.
//  Copyright (c) 2014 yuxin xie. All rights reserved.
//

#import "DismissSeque.h"

@implementation DismissSeque



- (void)perform {
    UIViewController *sourceViewController = self.sourceViewController;
    [sourceViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end