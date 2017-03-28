//
//  NavBarView.h
//  ZhuStore
//
//  Created by zhuzai on 17/3/28.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavBarView : UIView

@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) UIViewController *vc;
@property(nonatomic,strong) UIButton *goBackBtn;
@end
