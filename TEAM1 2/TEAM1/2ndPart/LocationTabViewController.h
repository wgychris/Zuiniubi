//
//  LocationTabViewController.h
//  task13
//
//  Created by Guanying Wang on 14-5-5.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationTabViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
