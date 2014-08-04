//
//  SecondViewController.m
//  TEAM1
//
//  Created by yuxin xie on 5/4/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "SecondViewController.h"
#import "SettingsViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize currentTextField;
@synthesize DestinationTextField;
@synthesize map;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor :[UIColor colorWithRed:0.40 green:0.77 blue:0.93 alpha:1.0]];
    self.map.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)TEXTFIELD {
    [TEXTFIELD resignFirstResponder];
    return YES;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.map setRegion:[self.map regionThatFits:region] animated:YES];
}


@end
