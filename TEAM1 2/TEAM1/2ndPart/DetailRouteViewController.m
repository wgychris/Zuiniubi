//
//  DetailRouteViewController.m
//  task13
//
//  Created by Guanying Wang on 14-5-4.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//

#import "DetailRouteViewController.h"

#import "DetailRoutePdfViewController.h"

@interface DetailRouteViewController ()

@end

@implementation DetailRouteViewController

//@synthesize label;

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

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    // Change the height dynamically of the UIWebView to match the html content
    CGRect webViewFrame = _viewRoutePdfWeb.frame;
    webViewFrame.size.height = webViewFrame.size.height + 30;
    webView.frame = webViewFrame;
    CGSize fittingSize = [webView sizeThatFits:CGSizeZero];
    webViewFrame.size = fittingSize;
    // webViewFrame.size.width = 276; Making sure that the webView doesn't get wider than 276 px
    _viewRoutePdfWeb.frame = webViewFrame;
    
    //float webViewHeight = webView.frame.size.height;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadRemotePdf
{
    NSString *fullURL = @"http://74.116.73.3/bustime/map/displaymap.jsp";//http://www.portauthority.org/rt/1.pdf";
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
