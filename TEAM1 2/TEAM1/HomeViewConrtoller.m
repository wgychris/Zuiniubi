//
//  HomeViewConrtoller.m
//  TEAM1
//
//  Created by Guanying Wang on 14-7-27.
//  Copyright (c) 2014年 Guanying Wang. All rights reserved.
//

#import "HomeViewConrtoller.h"

@implementation HomeViewConrtoller

-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGSize imageSize;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    imageSize = CGSizeMake(screenWidth, screenHeight);
    
    UIImage *img = [self imageWithImage :[UIImage imageNamed:@"medium_carpool.png"] scaledToSize: imageSize];
    
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:img];
	// Do any additional setup after loading the view, typically from a nib.
}



@end
