//
//  BannerCell.h
//  ZhuStore
//
//  Created by zhuzai on 17/3/24.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBHotTopicScroll.h"    


@interface BannerCell : UITableViewCell
{
    UIButton *btn;
    UILabel *nameLabel;
    UIView *lineView;
    UIImageView *btnImage;
}
-(void)setUpUI;

@property (nonatomic,strong) UIViewController *delegateVc;
@property (nonatomic,strong) BBHotTopicScroll *sCroll;

@end
