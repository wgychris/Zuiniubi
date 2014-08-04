//
//  DetailRouteListViewController.m
//  TEAM1
//
//  Created by yuxin xie on 5/8/14.
//  Copyright (c) 2014 yuxin xie. All rights reserved.
//

#import "DetailRouteListViewController.h"

@interface DetailRouteListViewController ()
@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation DetailRouteListViewController
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
    [super viewDidLoad];
    self.dataArray = [NSArray arrayWithObjects:@"    East Busway / Penn Stataion C",
                      @"    Liberty Ave St", @"    Liberty Ave / 7th St",
                       @"    Harnis Ave / 9th St",
                       @"    Sandusky St / Isabella St",
                       @"    East Ohhio St / Cedar"
                       @"    East Ohhio St / Heinz", nil];

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
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"detailListCell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:0.40 green:0.77 blue:0.93 alpha:1.0];
    
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
   
    return cell;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"selectItineraryCell";
    SelectItineraryTableViewCell *cell ;//= [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:0.40 green:0.77 blue:0.93 alpha:1.0];
    cell.routeNumber.text = [routeNumbers objectAtIndex:indexPath.row];
    cell.duration.text = [durations objectAtIndex:indexPath.row];
    cell.cost.text = [costs objectAtIndex:indexPath.row];
 
    return cell;
}
*/


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
