//
//  DetailRouteViewController.m
//  task13
//
//  Created by Guanying Wang on 14-5-4.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//

#import "DetailRoutePdfViewController.h"

@interface DetailRoutePdfViewController ()

@end

@implementation DetailRoutePdfViewController

@synthesize label;

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
	
    //self.label.text = [NSString stringWithFormat:@"%@", self.sendLabel];
    [self loadRemotePdf];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadRemotePdf
{
    NSString *fullURL = @"http://www.portauthority.org/rt/1.pdf";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_viewRoutePdfWeb loadRequest:requestObj];
    
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
