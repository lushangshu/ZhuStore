//
//  SpecialGoodsCell.h
//  ZhuStore
//
//  Created by zhuzai on 17/3/31.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpecialGoodsCell : UITableViewCell

{
    NSArray *imageUrls;
    //UIScrollView *deviceGallery;
}

@property (nonatomic,strong) UIViewController *vc;
-(void)setUpUI;


@end
