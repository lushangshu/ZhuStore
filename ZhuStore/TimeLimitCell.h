//
//  TimeLimitCell.h
//  ZhuStore
//
//  Created by zhuzai on 17/3/28.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeLimitCell : UITableViewCell <UIScrollViewDelegate>
{
    NSArray *imageUrls;
    UIScrollView *deviceGallery;
}

@property (nonatomic,strong) UIViewController *vc;
-(void)setUpUI;

@end
