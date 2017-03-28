//
//  HomePageVC.h
//  ZhuStore
//
//  Created by zhuzai on 17/3/21.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BannerScrollView.h"

#import "SearchBarView.h"

@interface HomePageVC : UINavigationController

{
    UIView *navBar;
    UITableView *mainTable;
    
    UIButton *locationSelect;
    UIButton *scanBtn;
    UIButton *newsBtn;
    SearchBarView *searchBar;
    
}

@property (nonatomic,strong) BannerScrollView *scroll;

@end
