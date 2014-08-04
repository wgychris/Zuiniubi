//
//  PostListCellTableViewCell.h
//  TEAM1
//
//  Created by Guanying Wang on 14-8-3.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostListCellTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *from;
@property (nonatomic, weak) IBOutlet UILabel *to;
@property (nonatomic, weak) IBOutlet UILabel *status;
@property (nonatomic, weak) IBOutlet UILabel *time;

@end
