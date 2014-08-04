//
//  DetailStepTableViewCell.h
//  TEAM1
//
//  Created by Guanying Wang on 14-5-7.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailStepTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) IBOutlet UIImageView *way;
@property (strong, nonatomic) IBOutlet UILabel *destination;
@property (strong, nonatomic) IBOutlet UILabel *detailStop;

@end
