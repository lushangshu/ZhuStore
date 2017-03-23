//
//  SearchBarView.h
//  ZhuStore
//
//  Created by zhuzai on 17/3/22.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchBarView : UIView
{
    UIButton *searchBtn;
}

@property (nonatomic,strong) UILabel *showLabel;

-(void)setUpSearchBarView;

@end
