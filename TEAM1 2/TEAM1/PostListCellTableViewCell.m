//
//  PostListCellTableViewCell.m
//  TEAM1
//
//  Created by Guanying Wang on 14-8-3.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//

#import "PostListCellTableViewCell.h"

@implementation PostListCellTableViewCell
@synthesize from = _from;
@synthesize to = _to;
@synthesize status = _status;
@synthesize time = _time;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
