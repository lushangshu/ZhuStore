//
//  NormalAdsCell.m
//  ZhuStore
//
//  Created by zhuzai on 17/4/5.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "NormalAdsCell.h"
#import "UIImageView+WebCache.h"
#import "PrefixHeader.pch"

@implementation NormalAdsCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setUpUI{
    
    
    imgUrls = @[@"https://img2.ch999img.com/pic/clientimg/201703240433530.jpg",
                @"https://img2.ch999img.com/pic/clientimg/201703170709300.jpg",
                @"https://img2.ch999img.com/pic/clientimg/201703170710120.jpg",
                @"https://img2.ch999img.com/pic/clientimg/201703240451360.jpg",
                @"https://img2.ch999img.com/pic/clientimg/201703240516070.jpg",
                @"https://img2.ch999img.com/pic/clientimg/201703240538290.jpg"];
    
    NSArray *imgs =  @[@"img_1",@"img_2",@"img_3",@"img_4",@"img_5",@"img_6"];
    
    UIImageView *img_1 = [UIImageView new];
    UIImageView *img_2 = [UIImageView new];
    UIImageView *img_3 = [UIImageView new];
    UIImageView *img_4 = [UIImageView new];
    UIImageView *img_5 = [UIImageView new];
    UIImageView *img_6 = [UIImageView new];
    
    [self addSubview:img_1];
    [self addSubview:img_2];
    [self addSubview:img_3];
    [self addSubview:img_4];
    [self addSubview:img_5];
    [self addSubview:img_6];
    
    img_1.sd_layout.topSpaceToView(self,0).leftSpaceToView(self,0).widthIs(ScreenW).heightIs(110);
    img_2.sd_layout.topSpaceToView(img_1,10).leftSpaceToView(self,0).widthIs((ScreenW-20)/3).heightIs(155);
    img_3.sd_layout.topSpaceToView(img_1,10).leftSpaceToView(img_2,10).widthIs((ScreenW-20)/3).heightIs(155);
    img_4.sd_layout.topSpaceToView(img_1,10).leftSpaceToView(img_3,10).widthIs((ScreenW-20)/3).heightIs(155);
    img_5.sd_layout.topSpaceToView(img_2,10).leftSpaceToView(self,0).widthIs(ScreenW/2-0.5).heightIs(110);
    img_6.sd_layout.topSpaceToView(img_2,10).leftSpaceToView(img_5,1).widthIs(ScreenW/2-0.5).heightIs(110);
    
    
    [img_1 sd_setImageWithURL:imgUrls[0] placeholderImage:nil];
    [img_2 sd_setImageWithURL:imgUrls[1] placeholderImage:nil];
    [img_3 sd_setImageWithURL:imgUrls[2] placeholderImage:nil];
    [img_4 sd_setImageWithURL:imgUrls[3] placeholderImage:nil];
    [img_5 sd_setImageWithURL:imgUrls[4] placeholderImage:nil];
    [img_6 sd_setImageWithURL:imgUrls[5] placeholderImage:nil];
    
    [self setBackgroundColor:CSepLine];
    
}

@end
