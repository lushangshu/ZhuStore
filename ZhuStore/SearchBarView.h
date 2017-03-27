//
//  SearchBarView.h
//  ZhuStore
//
//  Created by zhuzai on 17/3/22.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PYSearch.h"    

@interface SearchBarView : UIView <PYSearchViewControllerDelegate >
{
    UIButton *searchBtn;
}

@property (nonatomic,strong) UILabel *showLabel;
@property (nonnull,strong) UIViewController *vc;
-(void)setUpSearchBarView;

@end
