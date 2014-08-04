//
//  FirstViewController.m
//  TEAM1
//
//  Created by yuxin xie on 5/4/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "FirstViewController.h"
#import "NearByTableViewCell.h"

@interface FirstViewController ()

@end

@implementation FirstViewController {
    NSMutableArray *test;
    NSMutableArray *time;
}
@synthesize tableView;
@synthesize searchBar;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor :[UIColor colorWithRed:0.40 green:0.77 blue:0.93 alpha:1.0]];
    test = [[NSMutableArray alloc]initWithObjects:@"61A", @"61B", @"61D", nil];
    time =[[NSMutableArray alloc]initWithObjects:@"20 min",@"12min", @"3 min", nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return [test count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"nearByCell";
    NearByTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:0.40 green:0.77 blue:0.93 alpha:1.0];
    cell.routeName.text = [test objectAtIndex:indexPath.row];
    cell.routeName.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:30.0];
    cell.outBound.text = [time objectAtIndex:indexPath.row];
    cell.outBound.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:20.0];
    cell.outBoundDisplay.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:15.0];
    
    

    return cell;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.searchBar isFirstResponder] && [touch view] != searchBar) {
        [self.searchBar resignFirstResponder];
        
        [super touchesBegan:touches withEvent:event];
        
    }
}

@end
