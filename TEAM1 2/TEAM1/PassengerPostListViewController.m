//
//  PassengerPostListViewController.m
//  TEAM1
//
//  Created by Guanying Wang on 14-8-3.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//

#import "PassengerPostListViewController.h"

@interface PassengerPostListViewController ()

@end

@implementation PassengerPostListViewController
{
    NSMutableArray *nameArr;
    
    NSMutableArray *licenseArr;
    NSMutableArray *waitArr;
}

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
    nameArr = [[NSMutableArray alloc]initWithObjects:@"name1", @"name2", nil];
    licenseArr = [[NSMutableArray alloc]initWithObjects:@"111", @"456", nil];
    waitArr= [[NSMutableArray alloc]initWithObjects:@"waittime1", @"waittime2", nil];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [nameArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"PassengerListCell";
    
     PassengerListCell *cell = (PassengerListCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PassengerListCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }

    cell.nameLabel.text = [nameArr objectAtIndex:indexPath.row];
    cell.licenseLabel.text = [licenseArr objectAtIndex:indexPath.row];
    cell.waitTimeLabel.text = [waitArr objectAtIndex:indexPath.row];
    
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
