//
//  NavBarView.m
//  ZhuStore
//
//  Created by zhuzai on 17/3/28.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "NavBarView.h"

@implementation NavBarView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        UIView *lineView = [UIView new];
        [self addSubview:lineView];
        lineView.sd_layout.bottomSpaceToView(self,0.5).widthIs(ScreenW).heightIs(0.3).leftSpaceToView(self,0);
        [lineView setBackgroundColor:[UIColor lightGrayColor]];
        
        UILabel *label = [UILabel new];
        [self addSubview:label];
        label.sd_layout.centerXEqualToView(self).centerYEqualToView(self).widthIs(ScreenW/2).heightIs(ScreenH-20);
        [label setText:_title];
        
        [self setBackgroundColor:[UIColor yellowColor]];
        
        _goBackBtn = [UIButton new];
        [self addSubview:_goBackBtn];
        _goBackBtn.sd_layout.leftSpaceToView(self,10).topSpaceToView(self,20).widthIs(40).heightIs(40);
        
        [_goBackBtn setBackgroundColor:[UIColor blueColor]];
        //[btn addTarget:self action:@selector(goBackVC) forControlEvents:UIControlEventTouchUpInside ];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
