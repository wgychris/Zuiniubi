//
//  NearByTableViewCell.m
//  TEAM1
//
//  Created by yuxin xie on 5/4/14.
//  Copyright (c) 2014 yuxin xie. All rights reserved.
//

#import "NearByTableViewCell.h"

@implementation NearByTableViewCell

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
