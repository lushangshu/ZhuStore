//
//  BannerCell.h
//  ZhuStore
//
//  Created by zhuzai on 17/3/24.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BannerCell : UITableViewCell
{
    UIButton *btn;
    UILabel *nameLabel;
    
}
-(void)setUpUI;

@property (nonatomic,strong) UIViewController *delegateVc;
@end
