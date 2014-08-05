//
//  PasListViewController.m
//  TEAM1
//
//  Created by Guanying Wang on 14-8-4.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//

#import "PasListViewController.h"
#import "PostListCellTableViewCell.h"
#import "HttpConnection.h"


@interface PasListViewController ()

@end

@implementation PasListViewController
@synthesize nameArr, licenseArr,waitArr;
@synthesize lat,lon,radius;

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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh_List)];
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    //nameArr = [[NSMutableArray alloc]initWithObjects:@"name1", @"name2", nil];
    //licenseArr = [[NSMutableArray alloc]initWithObjects:@"111", @"456", nil];
    //waitArr= [[NSMutableArray alloc]initWithObjects:@"waittime1", @"waittime2", nil];
}

-(void)refresh_List {
    [self requestData];
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


-(void) requestData {
    HttpConnection *connection = [[HttpConnection alloc] init];
    
    NSArray *keys = [NSArray arrayWithObjects:@"distance", @"longitude",
                     @"latitude",nil];
    
    NSArray *objects = [NSArray arrayWithObjects:radius
                        ,@"111",
                        @"222",nil];
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:objects
                                                     forKeys:keys];
    
   // NSLog(@"radius is!!:%@",radius);
    //NSDictionary *dict = @{@"driver":@"david"};
    NSString * url =[connection getAvailableDriverURL:dict];
    NSDictionary *drivers = [connection sendHTTPRequest:url];

    
    
    NSArray *allDrivers = drivers[@"Driver"];
    
    NSUInteger count = [allDrivers count];;
    NSLog(@"Number ########3 %d", [allDrivers count]);
    if(count >= 2) {
        allDrivers = [allDrivers subarrayWithRange:NSMakeRange(0, count - 1)];
    }
    
    NSLog(@"allpassenger?????? %@", allDrivers);
    nameArr = [allDrivers valueForKeyPath:@"driver"];
    licenseArr = [allDrivers valueForKeyPath:@"licenceNumber"];
    waitArr= [allDrivers valueForKeyPath:@"waitTime"];
    
    
    
    /*  NSLog(@"!!!Name Arr in Post List!!!!%@",nameArr);
     
     NSLog(@"!!!Phone Arr in Post List!!!!%@",licenseArr);
     
     NSLog(@"!!!Des Arr in Post List!!!!%@",waitArr);
     */
    
    
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
    
    NSLog(@"???????Name Arr in Post List!!!!%@",nameArr);
    
    NSLog(@"???????Phone Arr in Post List!!!!%@",licenseArr);
    
    NSLog(@"???????Des Arr in Post List!!!!%@",waitArr);
    
    cell.name.text = [nameArr objectAtIndex:indexPath.row];
    cell.phone.text = [licenseArr objectAtIndex:indexPath.row];
    cell.des.text = [waitArr objectAtIndex:indexPath.row];
    
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
