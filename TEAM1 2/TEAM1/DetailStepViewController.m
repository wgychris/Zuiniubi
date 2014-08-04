//
//  DetailStepViewController.m
//  TEAM1
//
//  Created by Guanying Wang on 14-5-7.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//

#import "DetailStepViewController.h"
#import "DetailStepTableViewCell.h"

@interface DetailStepViewController ()

@end

@implementation DetailStepViewController {
    NSMutableArray *_time;
    NSMutableArray *_way;
    NSMutableArray *_destination;
    NSMutableArray *_detailStop;
}
@synthesize tableView;

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
    
    [[self view] setBackgroundColor :[UIColor colorWithRed:0.40 green:0.77 blue:0.93 alpha:1.0]];
    _time = [[NSMutableArray alloc]initWithObjects:@"2 mins", @"15 mins", @"3 mins", nil];
    _way =[[NSMutableArray alloc]initWithObjects:@"running.png",@"car.png", @"running.png", nil];
    _destination =[[NSMutableArray alloc]initWithObjects:@"to 61A",@"to Forbes and Murray ",@"to Cold Stone", nil];
    _detailStop =[[NSMutableArray alloc]initWithObjects:@"Morewood Ave",@" ",@" ", nil];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    return [_time count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"detailStepCell";
    DetailStepTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:0.40 green:0.77 blue:0.93 alpha:1.0];
    cell.time.text = [_time objectAtIndex:indexPath.row];
    cell.way.image = [UIImage imageNamed:[_way objectAtIndex:indexPath.row]];
    cell.destination.text = [_destination objectAtIndex:indexPath.row];
    cell.detailStop.text = [_detailStop objectAtIndex:indexPath.row];
    cell.contentView.backgroundColor = [UIColor colorWithRed:0.40 green:0.77 blue:0.93 alpha:1.0];
    
    return cell;
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
