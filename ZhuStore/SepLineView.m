//
//  SepLineView.m
//  ZhuStore
//
//  Created by zhuzai on 17/3/28.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "SepLineView.h"

@implementation SepLineView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(UIView *)createSepLineView{
    UIView *lineView= [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 0.3)];
    [lineView setBackgroundColor:[UIColor lightGrayColor]];
    
    return lineView;
}

@end
