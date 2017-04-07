//
//  GoodSingleCollectionCell.m
//  ZhuStore
//
//  Created by zhuzai on 17/4/7.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "GoodSingleCollectionCell.h"

@implementation GoodSingleCollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *img = [UIImageView new];
        UILabel *nameLabel = [UILabel new];
        UILabel *priceLabel = [UILabel new];
        
        [self addSubview:img];
        [self addSubview:nameLabel];
        [self addSubview:priceLabel];
        
        img.sd_layout.centerXEqualToView(self).topSpaceToView(self,20).heightIs(100).widthIs(100);
        nameLabel.sd_layout.topSpaceToView(img,10).leftSpaceToView(self,10).rightSpaceToView(self,10).heightIs(30);
        priceLabel.sd_layout.topSpaceToView(nameLabel,10).leftSpaceToView(self,10).rightSpaceToView(self,10).heightIs(20);
        
        [img sd_setImageWithURL:[NSURL URLWithString:@"https://img2.ch999img.com/pic/product/440x440/20160630101844141.jpg"] placeholderImage:nil];
        [nameLabel setText:@"乐2全网通原力金 32G"];
        [priceLabel setText:@"￥999.00"];
        
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.adjustsFontSizeToFitWidth = YES;
        priceLabel.textAlignment = NSTextAlignmentCenter;
        
        priceLabel.textColor = [UIColor orangeColor];
        nameLabel.textColor = [UIColor darkGrayColor];
    }
    return self;
}


@end
