//
//  PostListViewController.m
//  TEAM1
//
//  Created by Guanying Wang on 14-8-3.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//

#import "PostListViewController.h"
#import "PostListCellTableViewCell.h"

@implementation PostListViewController
{
    NSMutableArray *from;
    NSMutableArray *to;
    NSMutableArray *time;
    NSMutableArray *status;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
      from = [[NSMutableArray alloc]initWithObjects:@"from1", @"from2", nil];
    to = [[NSMutableArray alloc]initWithObjects:@"to1", @"to2", nil];
    time= [[NSMutableArray alloc]initWithObjects:@"time1", @"time2", nil];
    status= [[NSMutableArray alloc]initWithObjects:@"accepted", @"declined", nil];
    // Initialize table data
    
}


/*
 “tableView:numberOfRowsInSection” and “tableView:cellForRowAtIndexPath”. These two methods are part of the UITableViewDataSource protocol. It’s mandatory to implement the methods when configuring a UITableView. The first method is used to inform the table view how many rows are in the section. So let’s add the below code. The “count” method simply returns the number of items in the “tableData” array.
 Select “dataSource” to make a connection between the Table View and its data source. Repeat the above steps and make a connection with the delegate.
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [from count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    PostListCellTableViewCell *cell = (PostListCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PostListCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.from.text = [from objectAtIndex:indexPath.row];
    cell.to.text = [to objectAtIndex:indexPath.row];
    cell.time.text = [time objectAtIndex:indexPath.row];
    cell.status.text = [status objectAtIndex:indexPath.row];
    
    
    return cell;
}

@end
