//
//  PostListViewController.m
//  TEAM1
//
//  Created by Guanying Wang on 14-8-3.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//

#import "PostListViewController.h"
#import "PostListCellTableViewCell.h"
#import "HttpConnection.h"

@implementation PostListViewController
{
    NSArray *nameArr;

    NSArray *phoneArr;
    NSArray *desArr;
}
@synthesize driverName;

- (void)viewDidLoad
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh_List)];
    
    [super viewDidLoad];
     NSLog(@"Name Passed in List View:%@",driverName );
    [self requestData];
    
   // nameArr = [[NSMutableArray alloc]initWithObjects:@"name1", @"name2", nil];
    //phoneArr = [[NSMutableArray alloc]initWithObjects:@"123", @"456", nil];
    //desArr= [[NSMutableArray alloc]initWithObjects:@"des1", @"des2", nil];
    // Initialize table data
    
}
-(void)refresh_List {
    [self requestData];
}

- (void)requestData
{
    NSLog(@"start send data!");
    HttpConnection *connection = [[HttpConnection alloc] init];
    NSDictionary *dict = @{@"driver":driverName};
    NSString * url =[connection getConfirmedPassengersURL:dict];
    NSLog(@"url:%@",url);
    NSDictionary *passengers = [connection sendHTTPRequest:url];
    NSLog(@"In Post List Response: %@",passengers);
    //NSLog(@"%@",[passengers objectForKey:@"Passenger"]);
    
    NSArray *allPassenger = passengers[@"Passenger"];
    
    NSUInteger count = [allPassenger count];;
   NSLog(@"Number ########3 %d", [allPassenger count]);
    if(count >= 2) {
        allPassenger = [allPassenger subarrayWithRange:NSMakeRange(0, count - 1)];
    }
    
    NSLog(@"allpassenger?????? %@", allPassenger);
    nameArr = [allPassenger valueForKeyPath:@"name"];
    phoneArr = [allPassenger valueForKeyPath:@"phone"];
    desArr= [allPassenger valueForKeyPath:@"description"];

    
   
    NSLog(@"!!!Name Arr in Post List!!!!%@",nameArr);
    
    NSLog(@"!!!Phone Arr in Post List!!!!%@",phoneArr);
    
    NSLog(@"!!!Des Arr in Post List!!!!%@",desArr);
    
   /* for ( NSDictionary *passenger in allPassenger )
    {
        NSLog(@"----");
        NSLog(@"description: %@", passenger[@"description"] );
        NSLog(@"latitude: %@", passenger[@"latitude"] );
        NSLog(@"longitude: %@", passenger[@"longitude"] );
        NSLog(@"name: %@", passenger[@"name"] );
        NSLog(@"phone: %@", passenger[@"phone"] );
        NSLog(@"----");
    }
    */
    
}

/*
 “tableView:numberOfRowsInSection” and “tableView:cellForRowAtIndexPath”. These two methods are part of the UITableViewDataSource protocol. It’s mandatory to implement the methods when configuring a UITableView. The first method is used to inform the table view how many rows are in the section. So let’s add the below code. The “count” method simply returns the number of items in the “tableData” array.
 Select “dataSource” to make a connection between the Table View and its data source. Repeat the above steps and make a connection with the delegate.
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [nameArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"PostListItem";
    
    PostListCellTableViewCell *cell = (PostListCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
   if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PostListCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
   
    
    cell.name.text = [nameArr objectAtIndex:indexPath.row];
    cell.phone.text = [phoneArr objectAtIndex:indexPath.row];
    cell.des.text = [desArr objectAtIndex:indexPath.row];

    return cell;
}

@end
