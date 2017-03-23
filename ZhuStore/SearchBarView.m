//
//  SearchBarView.m
//  ZhuStore
//
//  Created by zhuzai on 17/3/22.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "SearchBarView.h"

@implementation SearchBarView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *background = [UIView new];
        //NSLog(@"width is %f and height is %F",self.frame.size.width,self.frame.size.height);
        [background setBackgroundColor:[UIColor lightGrayColor]];
        background.alpha = 0.5;
        [self addSubview:background];
        background.sd_layout.leftSpaceToView(self,0).rightSpaceToView(self,0).topSpaceToView(self,0).bottomSpaceToView(self,0);
        
        UIImageView *img = [[UIImageView alloc]init];
        [img setImage:[UIImage imageNamed:@"first"]];
        
        [self addSubview:img];
        img.sd_layout.leftSpaceToView(self,3).centerYEqualToView(self).widthIs(30).heightIs(30);
        
        _showLabel = [UILabel new];
        [self addSubview:_showLabel];
        
        _showLabel.sd_layout.leftSpaceToView(img,5).centerYEqualToView(img).topSpaceToView(self,3).rightSpaceToView(self,5).bottomSpaceToView(self,3);
        _showLabel.textAlignment = NSTextAlignmentLeft;
        [_showLabel setBackgroundColor:[UIColor greenColor]];
        
        searchBtn = [UIButton new];
        [self addSubview:searchBtn];
        searchBtn.sd_layout.leftSpaceToView(self,0).rightSpaceToView(self,0).topSpaceToView(self,0).bottomSpaceToView(self,0);
        [searchBtn setBackgroundColor:[UIColor clearColor]];
        [searchBtn addTarget:self action:@selector(pySearchView) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}


-(void)setUpSearchBarView{
   
}

-(void)pySearchView{
    
    NSLog(@"进入搜索界面");
}
@end
