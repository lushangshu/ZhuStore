//
//  FunthinsCell.h
//  ZhuStore
//
//  Created by zhuzai on 17/4/7.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FunthinsCell : UITableViewCell

{
    NSArray *imageUrls;
    //UIScrollView *deviceGallery;
}

@property (nonatomic,strong) UIViewController *vc;

-(void)setUpUI;



@end
