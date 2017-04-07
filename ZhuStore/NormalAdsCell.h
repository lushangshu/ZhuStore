//
//  NormalAdsCell.h
//  ZhuStore
//
//  Created by zhuzai on 17/4/5.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NormalAdsCell : UITableViewCell
{
    UIButton *btn;
    NSArray *imgUrls;
}

@property (nonatomic,strong) UIViewController *vc;

-(void)setUpUI;

@end
